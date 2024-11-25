#!/bin/bash
#
#     Internal script to update pack menu fancy menus pack version 
#
#     v2.0.0
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
echo "  SquirrelPAK Menu Update Script v2.0.0"
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
echo " - - - - Fancy Menu Vars - - - - - "
echo "PAK_Menu3_Name=$PAK_Menu3_Name"
echo "PAK_Menu3_Version=$PAK_Menu3_Version"
echo "PAK_Menu3_INIT_PFX=$PAK_Menu3_INIT_PFX"
echo "PAK_Menu3_INIT=$PAK_Menu3_INIT"
echo "PAK_Menu3_INIT_FULL=$PAK_Menu3_INIT_FULL"
echo "PAK_Menu3_ShortName_And_Version=$PAK_Menu3_ShortName_And_Version"
echo "PAK_Menu3_Music_Title=$PAK_Menu3_Music_Title"

echo " "

echo " Setting Fancy Menu Version Files"
echo " "

echo " Setting $PAK_Menu_Config_Dir/menu-pak-init-prefx.txt to:"
echo " $PAK_Menu3_INIT_PFX"
echo "$PAK_Menu3_INIT_PFX" > $PAK_Menu_Config_Dir/menu-pak-init-prefx.txt
echo " done!"
echo " "

echo " Setting $PAK_Menu_Config_Dir/menu-pak-init.txt to:"
echo " $PAK_Menu3_INIT"
echo "$PAK_Menu3_INIT" >$PAK_Menu_Config_Dir/menu-pak-init.txt
echo " done!"
echo " "

echo " Setting $PAK_Menu_Config_Dir/menu-pak-init-full.txt to:"
echo " $PAK_Menu3_INIT_FULL"
echo "$PAK_Menu3_INIT_FULL" > $PAK_Menu_Config_Dir/menu-pak-init-full.txt
echo " done!"
echo " "

echo " Setting $PAK_Menu_Config_Dir/menu-pak-name.txt to:"
echo " $PAK_Menu3_Name"
echo "$PAK_Menu3_Name" > $PAK_Menu_Config_Dir/menu-pak-name.txt
echo " done!"
echo " "

echo " Setting $PAK_Menu_Config_Dir/menu-pak-short-name-ane-version.txt to:"
echo " $PAK_Menu3_ShortName_And_Version"
echo "$PAK_Menu3_ShortName_And_Version" > $PAK_Menu_Config_Dir/menu-pak-short-name-ane-version.txt
echo " done!"
echo " "

echo " Setting $PAK_Menu_Config_Dir/menu-pak-version.txt to:"
echo " $PAK_Menu3_Version"
echo "$PAK_Menu3_Version" > $PAK_Menu_Config_Dir/menu-pak-version.txt
echo " done!"
echo " "
echo " "

echo " Setting $PAK_Menu_Config_Dir/menu-pak-song-title.txt to:"
echo " $PAK_Menu3_Music_Title"
echo "$PAK_Menu3_Music_Title" > $PAK_Menu_Config_Dir/menu-pak-song-title.txt
echo " done!"
echo " "
echo " "

echo " Setting Fancy Menu Version Files - Complete"
echo " "
echo " ----------------------------------------------------------------------------"