#!/usr/bin/env python3
"""
export_mod_list.py

Python 3.11+ (macOS friendly), no external deps.

Reads a Modrinth modpack index file (modrinth.index.json) and exports:
  - ModList.html (HTML UL list)
  - ModList.md   (Markdown bullet list)

Features:
  - Online mode (default): queries Modrinth API for accurate mod titles + version numbers
  - Offline mode (--offline): no network; infers from filenames (best-effort)
  - Disk cache (default): stores API results in ~/.modrinth-modlist-cache.json
      * project_id -> title/slug (stable)
      * version_id -> version_number (immutable)
  - Hardened API fetch:
      * URL-encoding for ids param (fixes InvalidURL from spaces/control chars)
      * Adaptive batch size to avoid overly-long URLs
      * Retries with exponential backoff + jitter
      * Handles HTTP 429 (Retry-After), 5xx transient errors, 414 URL too long
  - Verbose logging of what it’s doing (progress + outputs)

Usage:
  python3.11 export_mod_list.py --index modrinth.index.json
  python3.11 export_mod_list.py --offline
  python3.11 export_mod_list.py --log-level DEBUG
"""

from __future__ import annotations

import argparse
import json
import logging
import random
import re
import sys
import tempfile
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Dict, Iterable, List, Optional, Tuple

from urllib.request import Request, urlopen
from urllib.error import URLError, HTTPError
from urllib.parse import urlencode


MODRINTH_API = "https://api.modrinth.com/v2"
USER_AGENT = "modrinth-modlist-export/1.2 (python urllib; +https://modrinth.com)"

CACHE_PATH_DEFAULT = Path.home() / ".modrinth-modlist-cache.json"
CACHE_VERSION = 1


# ---------- logging ----------

log = logging.getLogger("modlist")


def setup_logging(level: str) -> None:
    numeric = getattr(logging, level.upper(), None)
    if not isinstance(numeric, int):
        numeric = logging.INFO
    logging.basicConfig(
        level=numeric,
        format="%(asctime)s | %(levelname)-7s | %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S",
    )


# ---------- data ----------

@dataclass(frozen=True)
class ModEntry:
    project_id: str
    version_id: str
    filename: str
    title: str
    version_number: str


# ---------- helpers ----------

def die(msg: str, code: int = 2) -> None:
    log.error(msg)
    raise SystemExit(code)


def load_json(path: Path) -> Dict[str, Any]:
    log.info("Loading index JSON: %s", path)
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except FileNotFoundError:
        die(f"File not found: {path}")
    except json.JSONDecodeError as e:
        die(f"Invalid JSON in {path}: {e}")


def chunked(items: List[str], n: int) -> Iterable[List[str]]:
    for i in range(0, len(items), n):
        yield items[i : i + n]


def extract_project_and_version_id(download_url: str) -> Optional[Tuple[str, str]]:
    """
    Modrinth CDN URLs usually look like:
      https://cdn.modrinth.com/data/<PROJECT_ID>/versions/<VERSION_ID>/<FILE>
    """
    m = re.search(r"/data/([^/]+)/versions/([^/]+)/", download_url)
    if not m:
        return None
    return m.group(1), m.group(2)


def best_effort_version_from_filename(filename: str) -> str:
    # First semver-ish token in filename
    m = re.search(r"(\d+(?:\.\d+){1,3}(?:[+\-~][A-Za-z0-9.\-_]+)?)", filename)
    return m.group(1) if m else "NONE"


def best_effort_title_from_filename(filename: str) -> str:
    base = re.sub(r"\.jar$", "", filename, flags=re.IGNORECASE)
    base = re.sub(r"\b(neoforge|forge|fabric|quilt)\b", "", base, flags=re.IGNORECASE)
    base = base.replace("_", " ").replace("-", " ")
    base = re.sub(r"\s+", " ", base).strip()
    base = re.sub(r"\s+\d+(?:\.\d+){1,3}.*$", "", base).strip()
    return base.title() if base else "Unknown Mod"


def escape_md_version(ver: str) -> str:
    # Matches your sample style: 2\.3\.1
    return ver.replace(".", r"\.")


# ---------- cache ----------

def load_cache(path: Path) -> Dict[str, Any]:
    empty = {"cache_version": CACHE_VERSION, "projects": {}, "versions": {}}
    try:
        if not path.exists():
            log.info("Cache not found (will create): %s", path)
            return empty
        data = json.loads(path.read_text(encoding="utf-8"))
        if not isinstance(data, dict):
            log.warning("Cache file invalid structure; ignoring: %s", path)
            return empty
        data.setdefault("cache_version", CACHE_VERSION)
        data.setdefault("projects", {})
        data.setdefault("versions", {})
        if not isinstance(data["projects"], dict) or not isinstance(data["versions"], dict):
            log.warning("Cache file invalid maps; ignoring: %s", path)
            return empty
        log.info("Loaded cache: %s (projects=%d, versions=%d)",
                 path, len(data["projects"]), len(data["versions"]))
        return data
    except Exception as e:
        log.warning("Failed to read cache; ignoring (%s): %s", e, path)
        return empty


def save_cache(cache: Dict[str, Any], path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    tmp_fd, tmp_name = tempfile.mkstemp(prefix=path.name + ".", dir=str(path.parent))
    tmp_path = Path(tmp_name)
    try:
        with open(tmp_fd, "w", encoding="utf-8") as f:
            json.dump(cache, f, indent=2, sort_keys=True)
            f.write("\n")
        tmp_path.replace(path)  # atomic replace
        log.info("Saved cache: %s (projects=%d, versions=%d)",
                 path, len(cache.get("projects", {})), len(cache.get("versions", {})))
    finally:
        try:
            if tmp_path.exists() and tmp_path != path:
                tmp_path.unlink()
        except Exception:
            pass


def cache_get_project_title(cache: Dict[str, Any], project_id: str) -> Optional[str]:
    obj = cache.get("projects", {}).get(project_id)
    if isinstance(obj, dict):
        t = obj.get("title")
        if isinstance(t, str) and t.strip():
            return t.strip()
    return None


def cache_get_version_number(cache: Dict[str, Any], version_id: str) -> Optional[str]:
    obj = cache.get("versions", {}).get(version_id)
    if isinstance(obj, dict):
        v = obj.get("version_number")
        if isinstance(v, str) and v.strip():
            return v.strip()
    return None


def cache_put_projects(cache: Dict[str, Any], projects_by_id: Dict[str, Any]) -> None:
    now = int(time.time())
    proj_cache = cache.setdefault("projects", {})
    added = 0
    for pid, obj in projects_by_id.items():
        if not isinstance(obj, dict):
            continue
        title = obj.get("title") or obj.get("slug") or pid
        slug = obj.get("slug")
        proj_cache[pid] = {
            "title": str(title),
            "slug": str(slug) if slug is not None else None,
            "cached_at": now,
        }
        added += 1
    log.info("Cache updated: +%d projects", added)


def cache_put_versions(cache: Dict[str, Any], versions_by_id: Dict[str, Any]) -> None:
    now = int(time.time())
    ver_cache = cache.setdefault("versions", {})
    added = 0
    for vid, obj in versions_by_id.items():
        if not isinstance(obj, dict):
            continue
        vn = obj.get("version_number")
        if vn is None:
            continue
        ver_cache[vid] = {"version_number": str(vn), "cached_at": now}
        added += 1
    log.info("Cache updated: +%d versions", added)


# ---------- modrinth api ----------

def http_get_json(url: str, timeout: float = 20.0) -> Any:
    req = Request(
        url,
        headers={"User-Agent": USER_AGENT, "Accept": "application/json"},
        method="GET",
    )
    with urlopen(req, timeout=timeout) as resp:
        raw = resp.read()
    return json.loads(raw.decode("utf-8"))


def modrinth_batch_get(
    endpoint: str,
    ids: List[str],
    batch_size: int = 50,
    *,
    timeout: float = 20.0,
    max_retries: int = 5,
    base_backoff: float = 0.6,
    max_url_len: int = 7000,
) -> Dict[str, Any]:
    """
    Hardened Modrinth batch fetch:
      - URL-encodes ids param; JSON has no spaces
      - Adapts batch size if URL too long
      - Retries with backoff + jitter
      - Handles 429 Retry-After, 5xx, 414
    """
    out: Dict[str, Any] = {}
    if not ids:
        return out

    def make_url(batch: List[str]) -> str:
        ids_json = json.dumps(batch, separators=(",", ":"))  # no spaces
        query = urlencode({"ids": ids_json})
        return f"{MODRINTH_API}/{endpoint}?{query}"

    def sleep_backoff(attempt: int, retry_after: Optional[str] = None) -> None:
        if retry_after:
            try:
                ra = float(retry_after.strip())
                log.warning("Rate limited; honoring Retry-After=%ss", ra)
                time.sleep(max(0.0, ra))
                return
            except ValueError:
                pass
        delay = min(base_backoff * (2 ** attempt), 20.0) + random.uniform(0.0, 0.25)
        log.info("Retrying in %.2fs (attempt %d/%d)", delay, attempt + 1, max_retries)
        time.sleep(delay)

    i = 0
    current_batch_size = max(1, batch_size)

    while i < len(ids):
        j = min(len(ids), i + current_batch_size)
        batch = ids[i:j]
        url = make_url(batch)

        # shrink if URL too long
        while len(url) > max_url_len and len(batch) > 1:
            current_batch_size = max(1, len(batch) // 2)
            j = i + current_batch_size
            batch = ids[i:j]
            url = make_url(batch)

        log.debug("GET %s (batch=%d, url_len=%d)", endpoint, len(batch), len(url))

        last_err: Optional[Exception] = None
        for attempt in range(max_retries + 1):
            try:
                data = http_get_json(url, timeout=timeout)
                if not isinstance(data, list):
                    raise ValueError(f"Unexpected response type: {type(data)}")

                for obj in data:
                    if isinstance(obj, dict):
                        obj_id = obj.get("id")
                        if obj_id:
                            out[obj_id] = obj

                last_err = None
                break

            except HTTPError as e:
                last_err = e
                status = getattr(e, "code", None)
                log.warning("HTTPError %s on %s batch=%d", status, endpoint, len(batch))

                if status == 429:
                    retry_after = None
                    try:
                        retry_after = e.headers.get("Retry-After")
                    except Exception:
                        retry_after = None
                    sleep_backoff(attempt, retry_after=retry_after)
                    continue

                if status in (500, 502, 503, 504):
                    sleep_backoff(attempt)
                    continue

                if status == 414 and len(batch) > 1:
                    current_batch_size = max(1, len(batch) // 2)
                    j = i + current_batch_size
                    batch = ids[i:j]
                    url = make_url(batch)
                    log.warning("URL too long (414). Reducing batch to %d.", len(batch))
                    continue

                break  # non-retryable

            except (URLError, TimeoutError, json.JSONDecodeError, ValueError) as e:
                last_err = e
                log.warning("Transient error on %s batch=%d: %s", endpoint, len(batch), e)
                sleep_backoff(attempt)
                continue

        if last_err is not None:
            # split if multi-item batch
            if len(batch) > 1:
                current_batch_size = max(1, len(batch) // 2)
                log.warning("Batch failed; splitting. New batch_size=%d", current_batch_size)
                continue

            # single item failed: skip
            log.warning("Skipping one %s id after retries: %s", endpoint, batch[0])
            i += 1
            continue

        i = j
        time.sleep(0.05)

    return out


# ---------- parse + render ----------

def parse_index(index: Dict[str, Any]) -> Tuple[str, str, List[Tuple[str, str, str]]]:
    pack_name = str(index.get("name", "Unknown Pack"))
    pack_summary = str(index.get("summary", "")).strip()

    triples: List[Tuple[str, str, str]] = []
    files = index.get("files", [])
    log.info("Index contains %d file entries", len(files))

    for f in files:
        dl = f.get("downloads") or []
        if not dl:
            continue

        first_url = str(dl[0])
        pv = extract_project_and_version_id(first_url)
        if not pv:
            # not a modrinth CDN URL (or weird format) -> skip
            continue

        project_id, version_id = pv
        url_tail = first_url.rstrip("/").split("/")[-1]
        filename = url_tail or str(f.get("path", "")).split("/")[-1] or "UNKNOWN"

        triples.append((project_id, version_id, filename))

    # dedupe by project_id
    dedup: Dict[str, Tuple[str, str, str]] = {}
    for project_id, version_id, filename in triples:
        dedup.setdefault(project_id, (project_id, version_id, filename))

    out = list(dedup.values())
    log.info("Extracted %d unique projects from index", len(out))
    return pack_name, pack_summary, out


def render_html(title_line: str, mods: List[ModEntry]) -> str:
    lines = []
    lines.append("<html><body>")
    lines.append(f"<h2>{title_line}</h2><ul>")
    for m in mods:
        url = f"https://modrinth.com/mod/{m.project_id}"
        lines.append(f"\t<li><a href=\"{url}\">{m.title}</a> [{m.version_number}]</li>")
    lines.append("</ul></body></html>")
    return "\n".join(lines)


def render_md(title_line: str, mods: List[ModEntry]) -> str:
    lines = []
    lines.append(f"## {title_line} ")
    for m in mods:
        url = f"https://modrinth.com/mod/{m.project_id}"
        v = escape_md_version(m.version_number)
        lines.append(f"- [{m.title}]({url}) [{v}]")
    return "\n".join(lines)


# ---------- main ----------

def main() -> int:
    ap = argparse.ArgumentParser(description="Export Modrinth modpack mod list to HTML and Markdown.")
    ap.add_argument(
        "-i",
        "--index",
        type=Path,
        default=Path("modrinth.index.json"),
        help="Path to modrinth.index.json (default: ./modrinth.index.json)",
    )
    ap.add_argument("--out-html", type=Path, default=Path("ModList.html"), help="Output HTML file path")
    ap.add_argument("--out-md", type=Path, default=Path("ModList.md"), help="Output Markdown file path")

    ap.add_argument("--offline", action="store_true", help="Do not call Modrinth API; infer names/versions from filenames")

    ap.add_argument("--cache-file", type=Path, default=CACHE_PATH_DEFAULT,
                    help="Cache file path (default: ~/.modrinth-modlist-cache.json)")
    ap.add_argument("--no-cache", action="store_true", help="Do not read/write disk cache")

    ap.add_argument("--log-level", default="INFO", help="Logging level: DEBUG, INFO, WARNING, ERROR (default: INFO)")
    args = ap.parse_args()

    setup_logging(args.log_level)

    log.info("=== export_mod_list.py starting ===")
    log.info("Options: index=%s out_html=%s out_md=%s offline=%s cache=%s no_cache=%s log_level=%s",
             args.index, args.out_html, args.out_md, args.offline, args.cache_file, args.no_cache, args.log_level.upper())

    index = load_json(args.index)
    pack_name, pack_summary, triples = parse_index(index)

    title_line = f"{pack_name} - Easy Squirrels Mod List - {pack_summary}".strip()
    log.info("Pack title line: %s", title_line)

    entries: List[ModEntry] = []

    if args.offline:
        log.info("Running in OFFLINE mode: no Modrinth API calls will be made.")
        for project_id, version_id, filename in triples:
            title = best_effort_title_from_filename(filename)
            ver = best_effort_version_from_filename(filename)
            entries.append(ModEntry(project_id, version_id, filename, title, ver))
    else:
        log.info("Running in ONLINE mode: Modrinth API lookups enabled.")
        cache: Dict[str, Any] = {"cache_version": CACHE_VERSION, "projects": {}, "versions": {}}
        if not args.no_cache:
            cache = load_cache(args.cache_file)
        else:
            log.info("Cache disabled (--no-cache).")

        project_ids = [t[0] for t in triples]
        version_ids = [t[1] for t in triples]

        missing_project_ids = [pid for pid in project_ids if cache_get_project_title(cache, pid) is None]
        missing_version_ids = [vid for vid in version_ids if cache_get_version_number(cache, vid) is None]

        log.info("Cache status: missing projects=%d missing versions=%d", len(missing_project_ids), len(missing_version_ids))

        try:
            projects_fetched: Dict[str, Any] = {}
            versions_fetched: Dict[str, Any] = {}

            if missing_project_ids:
                log.info("Fetching %d projects from Modrinth API...", len(missing_project_ids))
                projects_fetched = modrinth_batch_get("projects", missing_project_ids)
                cache_put_projects(cache, projects_fetched)
            else:
                log.info("No project fetch needed (all present in cache).")

            if missing_version_ids:
                log.info("Fetching %d versions from Modrinth API...", len(missing_version_ids))
                versions_fetched = modrinth_batch_get("versions", missing_version_ids)
                cache_put_versions(cache, versions_fetched)
            else:
                log.info("No version fetch needed (all present in cache).")

            if not args.no_cache and (projects_fetched or versions_fetched):
                save_cache(cache, args.cache_file)
            elif not args.no_cache:
                log.info("Cache unchanged; not rewriting cache file.")

        except (HTTPError, URLError, TimeoutError, json.JSONDecodeError) as e:
            log.warning("Modrinth API lookup failed (%s). Will use cache + best-effort inference where needed.", e)

        # Build entries using cache first, then inference as fallback
        log.info("Building mod entries (cache-first, fallback-to-inference)...")
        cache_hits_proj = 0
        cache_hits_ver = 0

        for project_id, version_id, filename in triples:
            title = cache_get_project_title(cache, project_id)
            version_number = cache_get_version_number(cache, version_id)

            if title is not None:
                cache_hits_proj += 1
            if version_number is not None:
                cache_hits_ver += 1

            final_title = title or best_effort_title_from_filename(filename)
            final_ver = version_number or best_effort_version_from_filename(filename) or "NONE"

            entries.append(ModEntry(project_id, version_id, filename, final_title, final_ver))

        log.info("Cache hits: projects=%d/%d versions=%d/%d",
                 cache_hits_proj, len(triples), cache_hits_ver, len(triples))

    entries.sort(key=lambda m: m.title.lower())
    log.info("Sorted %d mods by title", len(entries))

    log.info("Rendering HTML...")
    html_out = render_html(title_line, entries)

    log.info("Rendering Markdown...")
    md_out = render_md(title_line, entries)

    log.info("Writing outputs...")
    args.out_html.write_text(html_out, encoding="utf-8")
    args.out_md.write_text(md_out, encoding="utf-8")

    log.info("Created: %s (%d mods)", args.out_html, len(entries))
    log.info("Created: %s (%d mods)", args.out_md, len(entries))
    log.info("=== export_mod_list.py done ===")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())