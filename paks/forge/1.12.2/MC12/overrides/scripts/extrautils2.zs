// Extra Utils 2 Tweaks

// ExtraUtils Add to Crusher - Andesite to Beryllium + Arsenic (33%)
val oreDict_dustBeryllium = <ore:dustBeryllium>;
val oreDict_dustArsenic = <ore:dustArsenic>;
mods.extrautils2.Crusher.add
	(oreDict_dustBeryllium.firstItem,
	<minecraft:stone:5>,
	oreDict_dustArsenic.firstItem,
	0.30f);



//mods.extrautils2.Crusher.add
//	(IItemStack output,
//	IItemStack input,
//	@Optional IItemStack secondaryOutput,
//	@Optional float secondaryChance);
