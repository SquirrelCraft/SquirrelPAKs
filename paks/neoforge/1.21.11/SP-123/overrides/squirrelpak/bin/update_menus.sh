#!/bin/bash
#
#     Internal script to update pack menu fancy menus pack version 
#
#     v3.0
# 

#     update_menu.sh
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
echo "  SquirrelPAK Menu Update Script v3.0"
echo "  (update_menu.sh) - Licnesed under GNU GPLv3"
echo " ----------------------------------------------------------------------------"
echo " | Copyright (C) 2024 The Network Squirrel(SquirrelCraft)                   |"
echo " | https://github.com/SquirrelCraft/squirrelpak-scripts                     |"
echo " | This program comes with ABSOLUTELY NO WARRANTY; This is free software,   |"
echo " | and you are welcome to redistribute it under certain conditions          |"
echo " ----------------------------------------------------------------------------"

Script_Dir=$PWD 

# We should be in the root dir where the changelog is
# located, if not exit
echo " Script: Checking running directory..."
if [ ! -f ./changelog.txt ]; then
    echo " "
    echo " PWD=$PWD"
    echo " Script must run in the root folder!"
    echo " Script exiting!"
    echo " "
    exit 1
fi

echo " PWD=$PWD"
echo " Script: Checking running directory (Ok)"
echo " "

# Set local vars
PAK_bin_dir=./squirrelpak/bin
PAK_etc_dir=./squirrelpak/etc
PAK_versons_dir=./squirrelpak/versions
PAK_FM3_ASSET_DIR=./config/fancymenu/assets
PAK_CreditsFile=./credits.md
PAK_LicenseFile=./LICENSES/LICENSES.md

echo " Local Vars Set!"
echo " PAK_bin_dir=$PAK_bin_dir"
echo " PAK_etc_dir=$PAK_etc_dir"
echo " PAK_versons_dir=$PAK_versons_dir"
echo " "

# Read config files
echo " Reading config files"
source $PAK_etc_dir/version.txt

PAK_Short_Ver_Name="SquirrelPAK $PAK_NAME - v$PAK_VER"

echo " Config files loaded, loaded config below:"
echo " "
echo "PAK_NAME_INIT_PFX=$PAK_NAME_INIT_PFX"
echo "PAK_NAME_INIT=$PAK_NAME_INIT"
echo "PAK_RELEASE=$PAK_RELEASE"
echo "PAK_MC_VER=$PAK_MC_VER"
echo "PAK_DESC=$PAK_DESC"
echo "PAK_FORGE_VER=$PAK_FORGE_VER"
echo "PAK_Menu_Config_Dir=$PAK_Menu_Config_Dir"
echo "PAK_NAME=$PAK_NAME"
echo "PAK_VER=$PAK_VER"
echo "PAK_Menu_Beta_Text=$PAK_Menu_Beta_Text"
echo " - - - - Fancy Menu Vars R1- - - - - "
echo "PAK_Menu3_Name=$PAK_Menu3_Name"
echo "PAK_Menu3_Version=$PAK_Menu3_Version"
echo "PAK_Menu3_INIT_PFX=$PAK_Menu3_INIT_PFX"
echo "PAK_Menu3_INIT=$PAK_Menu3_INIT"
echo "PAK_Menu3_INIT_FULL=$PAK_Menu3_INIT_FULL"
echo "PAK_Menu3_ShortName_And_Version=$PAK_Menu3_ShortName_And_Version"
echo "PAK_Menu3_Music_Title=$PAK_Menu3_Music_Title"
echo " - - - - Fancy Menu Vars R2- - - - - "
echo "PAK_Menu_R2_Menu_Music_Credits=$PAK_Menu_R2_Menu_Music_Credits"
echo "PAK_Menu_R2_Name=$PAK_Menu_R2_Name"
echo "PAK_Menu_R2_Desc=$PAK_Menu_R2_Desc"
echo "PAK_Menu_R2_Ver=$PAK_Menu_R2_Ver"
echo "PAK_Menu_R2_Full_Name_Ver=$PAK_Menu_R2_Full_Name_Ver"
echo "PAK_CreditsFile=$PAK_CreditsFile"
echo "PAK_LicenseFile=$PAK_LicenseFile"
echo " "


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

echo " Copy credits files to Fancy Menu Assets:"
echo " Copy file: $PAK_CreditsFile"
echo " Copy to: $PAK_FM3_ASSET_DIR/credits.md"
echo " --------------------------------"
cp -v $PAK_CreditsFile $PAK_FM3_ASSET_DIR/credits.md
echo " --------------------------------"
echo " done"
echo " "

echo " Copy license file to Fancy Menu Assets:"
echo " Copy file: $PAK_LicenseFile"
echo " Copy to: $PAK_FM3_ASSET_DIR/licesnse.md"
echo " --------------------------------"
cp -v $PAK_LicenseFile $PAK_FM3_ASSET_DIR/license.md
echo " --------------------------------"
echo " done"
echo " "


echo " Setting Fancy Menu Version Files - Complete"
echo " "
echo " ----------------------------------------------------------------------------"