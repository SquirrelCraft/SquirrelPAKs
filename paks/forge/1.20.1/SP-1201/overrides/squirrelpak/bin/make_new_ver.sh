#!/bin/bash
#
#     Internal script
#     Creates new version
#     make_new_ver.sh
#     v3.0
# 

#     make_new_ver.sh - Creates a new version
#     Copyright (C) 2024 The Network Squirrel(SquirrelCraft)
#     https://github.com/SquirrelCraft/squirrelpak-scripts     
#
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
# 
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <https://www.gnu.org/licenses/>.
 
echo " "
echo " ----------------------------------------------------------------------------"
echo "  SquirrelPAK Make New Version Script v3.0"
echo "  (ver.sh) - Licnesed under GNU GPLv3"
echo " ----------------------------------------------------------------------------"
echo " | Copyright (C) 2024 The Network Squirrel(SquirrelCraft)                   |"
echo " | https://github.com/SquirrelCraft/squirrelpak-scripts                     |"
echo " | This program comes with ABSOLUTELY NO WARRANTY; This is free software,   |"
echo " | and you are welcome to redistribute it under certain conditions          |"
echo " ----------------------------------------------------------------------------"
echo " "

Script_Dir=$PWD 
PAK_ChangeLog=./changelog.txt
PAK_Removed_Files_Base_Dir=./zz-do-not-export
PAK_Export_Timestamp_File=$PAK_Removed_Files_Base_Dir/exported.timestamp
PAK_Tools_Save_Dir=$Script_Dir/squirrelpak/pak-tools

# We should be in the root dir where the changelog is
# located, if not exit

if [ "$PAK_Debug " == "true " ]; then echo "Script: Checking running directory..."; fi

if [ ! -f $PAK_ChangeLog ]; then
    echo " "
    echo "PWD=$PWD"
    echo "Script must run in the root folder!"
    echo "Script exiting!"
    echo " "
    exit 1
fi


# Debug output
if [ "$PAK_Debug " == "true " ]; then
    echo "PWD=$PWD"
    echo "Script: Checking running directory (Ok)"
    echo " "
fi


# Set local vars
PAK_bin_dir=./squirrelpak/bin
PAK_etc_dir=./squirrelpak/etc
PAK_versons_dir=./squirrelpak/versions
PAK_FM3_ASSET_DIR=./config/fancymenu/assets

# Read config files
echo " Reading config files"
source $PAK_etc_dir/version.txt


# Debug output

if [ "$PAK_Debug " == "true " ]; then
    echo "Local Vars Set!"
    echo "PAK_bin_dir=$PAK_bin_dir"
    echo "PAK_etc_dir=$PAK_etc_dir"
    echo "PAK_versons_dir=$PAK_versons_dir"
    echo "PAK_Export_Timestamp_File=$PAK_Export_Timestamp_File"
	echo "PAK_Removed_Files_Base_Dir=$PAK_Removed_Files_Base_Dir"
	echo "PAK_Tools_Save_Dir=$PAK_Tools_Save_Dir"
    echo " "
fi


# Check for undo file
if [ ! -f "$PAK_etc_dir/version.txt.undo" ]; then
	echo "  Error: Undo File not found "
	echo "  $PAK_etc_dir/version.txt.undo"
	echo "  Exiting script, nothing done"
	echo " ----------------------------------------------------------------------------"
	exit 1
fi


# Check for undo file
if [ ! -f "$PAK_Export_Timestamp_File" ]; then
	echo "  Error: Export time stamp file not found "
	echo "  $PAK_Export_Timestamp_File"
	echo "  Exiting script, nothing done"
	echo " ----------------------------------------------------------------------------"
	exit 1
fi

echo " "
echo " Checks complete, ready to create new version!"
printf "%s " "Press enter to continue"
read ans
echo " "

echo " - Remove undo backup file"
if [ -f $PAK_etc_dir/version.txt.undo.backup ]; then
	echo "   - Found backup file, removing "
	rm -v $PAK_etc_dir/version.txt.undo.backup 
fi
echo     "done!"
echo " "
echo " - Make backup of current undo file"
mv -v $PAK_etc_dir/version.txt.undo $PAK_etc_dir/version.txt.undo.backup 
echo "   done!"
echo " "
echo " - Create version undo file: $PAK_etc_dir/version.txt.undo"
cp -v $PAK_etc_dir/version.txt $PAK_etc_dir/version.txt.undo
echo "   done!"
echo " "
echo " - Create new version"
echo "   - Update version.txt numbers via nano/vim"
echo " "
printf "%s " "Press enter to continue"
read ans
nano $PAK_etc_dir/version.txt
echo "     done"
echo " "

echo "   - Update bcc-common.toml version via nano/vim"
echo " "
printf "%s " "Press enter to continue"
read ans
nano ./config/bcc-common.toml
echo "     done"
echo " "


# Move Pak Tools back
echo " "
echo "   - Move Pak Tools back to mods dir"
mv -v ./zz-do-not-export/squirrelpak-tools/* ./mods
echo " "
echo " Script Complete"
echo " "
echo " ----------------------------------------------------------------------------"



echo " Setting Fancy Menu Version Files"
echo " "

# Check if is beta
echo " Eval: $PAK_IS_BETA = true"
# If Beta set the beta 
if [ "$PAK_IS_BETA" == "true" ]; then
	echo " PAK_IS_BETA is set to True, setting beta files"

	echo " Setting $PAK_Menu_Config_Dir/menu_r2-beta.txt to:"
	echo " ^^^"
	echo " $PAK_Beta_Text"
	echo " ^^^"
	echo "^^^" > $PAK_Menu_Config_Dir/menu_r2-beta.txt
	echo "$PAK_Beta_Text" >> $PAK_Menu_Config_Dir/menu_r2-beta.txt
	echo "^^^" >> $PAK_Menu_Config_Dir/menu_r2-beta.txt	
	echo " done!"
	echo " "

	echo " Setting $PAK_Menu_Config_Dir/menu_r2-beta-header.txt to:"
	echo " ^^^"
	echo " $PAK_Beta_Header"
	echo " ^^^"
	echo "^^^" > $PAK_Menu_Config_Dir/menu_r2-beta-header.txt
	echo "$PAK_Beta_Header" >> $PAK_Menu_Config_Dir/menu_r2-beta-header.txt
	echo "^^^" >> $PAK_Menu_Config_Dir/menu_r2-beta-header.txt
	echo " done!"
	echo " "

	echo " Setting $PAK_Menu_Config_Dir/menu_r2-beta-tagline.txt to:"
	echo " ^^^"
	echo " $PAK_Beta_Tagline"
	echo " ^^^"
	echo "^^^" > $PAK_Menu_Config_Dir/menu_r2-beta-tagline.txt
	echo "$PAK_Beta_Tagline" >> $PAK_Menu_Config_Dir/menu_r2-beta-tagline.txt
	echo "^^^" >> $PAK_Menu_Config_Dir/menu_r2-beta-tagline.txt
	echo " done!"
	echo " "

else
	echo " PAK_IS_BETA is set to False, blanking beta files"

	echo " Setting $PAK_Menu_Config_Dir/menu_r2-beta.txt to blank line"
	echo " " > $PAK_Menu_Config_Dir/menu_r2-beta.txt	
	echo " done!"
	echo " "

	echo " Setting $PAK_Menu_Config_Dir/menu_r2-beta-header.txt to blank line"
	echo " " > $PAK_Menu_Config_Dir/menu_r2-beta-header.txt
	echo " done!"
	echo " "

	echo " Setting $PAK_Menu_Config_Dir/menu_r2-beta-tagline.txt to blank line"
	echo " " > $PAK_Menu_Config_Dir/menu_r2-beta-tagline.txt
	echo " done!"
	echo " "
fi

echo " Setting $PAK_Menu_Config_Dir/menu_r2-pak-name.txt to:"
echo " ^^^"
echo " $PAK_Menu_R2_Name"
echo " ^^^"
echo "^^^" > $PAK_Menu_Config_Dir/menu_r2-pak-name.txt
echo "$PAK_Menu_R2_Name" >> $PAK_Menu_Config_Dir/menu_r2-pak-name.txt
echo "^^^" >> $PAK_Menu_Config_Dir/menu_r2-pak-name.txt
echo " done!"
echo " "

echo " Setting $PAK_Menu_Config_Dir/menu_r2-pak-desc.txt to:"
echo " ^^^"
echo " $PAK_Menu_R2_Desc"
echo " ^^^"
echo "^^^" > $PAK_Menu_Config_Dir/menu_r2-pak-desc.txt
echo "$PAK_Menu_R2_Desc" >> $PAK_Menu_Config_Dir/menu_r2-pak-desc.txt
echo "^^^" >> $PAK_Menu_Config_Dir/menu_r2-pak-desc.txt
echo " done!"
echo " "

echo " Setting $PAK_Menu_Config_Dir/menu_r2-pak-ver.txt to:"
echo " ^^^"
echo " $PAK_Menu_R2_Ver"
echo " ^^^"
echo "^^^" > $PAK_Menu_Config_Dir/menu_r2-pak-ver.txt
echo "$PAK_Menu_R2_Ver" >> $PAK_Menu_Config_Dir/menu_r2-pak-ver.txt
echo "^^^" >> $PAK_Menu_Config_Dir/menu_r2-pak-ver.txt
echo " done!"
echo " "

echo " Setting $PAK_Menu_Config_Dir/menu_r2-pak-full-name-ver.txt to:"
echo " |||"
echo " $PAK_Menu_R2_Full_Name_Ver"
echo " |||"
echo "|||" > $PAK_Menu_Config_Dir/menu_r2-pak-full-name-ver.txt 
echo "$PAK_Menu_R2_Full_Name_Ver" >> $PAK_Menu_Config_Dir/menu_r2-pak-full-name-ver.txt
echo "|||" >> $PAK_Menu_Config_Dir/menu_r2-pak-full-name-ver.txt
echo " done!"
echo " "

echo " Setting $PAK_Menu_Config_Dir/menu_r2-pak-song-title.txt to:"
echo " $PAK_Menu_R2_Menu_Music_Credits"
echo "$PAK_Menu_R2_Menu_Music_Credits" > $PAK_Menu_Config_Dir/menu_r2-pak-song-title.txt
echo " done!"
echo " "
echo " "

echo " Setting Fancy Menu Version Files - Complete"
echo " "
echo " ----------------------------------------------------------------------------"


if [ -f $PAK_Export_Timestamp_File.backup ]; then
	echo " Found $PAK_Export_Timestamp_File.backup"
	echo " Remove it!"
	rm -v $PAK_Export_Timestamp_File.backup	
fi
echo " - Backup time stamp file"
mv -v $PAK_Export_Timestamp_File $PAK_Export_Timestamp_File.backup
echo " done!"
echo " "
echo " Script Complete"
echo " "
echo " ----------------------------------------------------------------------------"
