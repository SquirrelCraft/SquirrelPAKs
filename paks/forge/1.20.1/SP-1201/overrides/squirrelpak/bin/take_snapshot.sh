#!/bin/bash
#
#     Internal script
#     Takes a snapshot of the mod directory state 
#     take_snapshot.sh
#     v1.0
# 
#
#     take_snapshot.sh - Takes a snapshot of the mod directory state
#     use with command wtd_current_vs_state.sh to display the diff 
#     between the snapshot and the current state of the mod dir.
#     Use the del_snapshot.sh to remove the snap shot file
#
#     Copyright (C) 2025 The Network Squirrel(SquirrelCraft)
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
echo "  SquirrelPAK Release Create Mod Dir Snapshot Diff Tool v1.0"
echo "  (take_snapshot.sh) - Licnesed under GNU GPLv3"
echo " ----------------------------------------------------------------------------"
echo " | Copyright (C) 2025 The Network Squirrel(SquirrelCraft)                   |"
echo " | https://github.com/SquirrelCraft/squirrelpak-scripts                     |"
echo " | This program comes with ABSOLUTELY NO WARRANTY; This is free software,   |"
echo " | and you are welcome to redistribute it under certain conditions          |"
echo " ----------------------------------------------------------------------------"
echo " "

Script_Dir=$PWD 

# We should be in the root dir where the changelog is
# located, if not exit

if [ "$PAK_Debug " == "true " ]; then echo "Script: Checking running directory..."; fi

if [ ! -f ./changelog.txt ]; then
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


# Debug output

if [ "$PAK_Debug " == "true " ]; then
    echo "Local Vars Set!"
    echo "PAK_bin_dir=$PAK_bin_dir"
    echo "PAK_etc_dir=$PAK_etc_dir"
    echo "PAK_versons_dir=$PAK_versons_dir"
    echo " "
fi



# Read config files
if [ "$PAK_Debug " == "true " ]; then echo "Reading config files"; fi

source $PAK_etc_dir/version.txt
source $PAK_etc_dir/current_version.txt
source $PAK_etc_dir/previous_version.txt

PAK_Full_Ver_Name="SquirrelPAK $PAK_NAME - $PAK_DESC v$PAK_VER"
PAK_Exported_ModListName=$PAK_NAME-v$PAK_VER-ModsList.txt
PAK_Short_Ver_Name="SquirrelPAK $PAK_NAME - v$PAK_VER"
PAK_Snapshot_ModListName=$PAK_NAME-Snapshot-ModsList.txt


# Debug output
if [ "$PAK_Debug " == "true " ]; then
    echo "Config files loaded, loaded config below:"
    echo " "
    echo "PAK_NAME=$PAK_NAME "
    echo "PAK_RELEASE=$PAK_RELEASE "
    echo "PAK_VER=$PAK_VER "
    echo "PAK_DESC=$PAK_DESC "
    echo "PAK_Menu_Beta_Text=$PAK_Menu_Beta_Text "
    echo "PAK_Menu_Config_Dir=$PAK_Menu_Config_Dir "
    echo "PAK_Current_Version=$PAK_Current_Version "
    echo "PAK_Previous_Version=$PAK_Previous_Version "
    echo "PAK_Full_Ver_Name=$PAK_Full_Ver_Name "
    echo "PAK_Short_Ver_Name=$PAK_Short_Ver_Name "
    echo "PAK_Exported_ModListName=$PAK_Exported_ModListName "
fi

PAK_Snapshot_Time=`date '+%D %r'`

echo " "
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo " Snapshot of mods taken - $PAK_Snapshot_Time "
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="    

# Create current state file
if [ "$PAK_Debug " == "true " ]; then echo "Create Mod List File"; fi
echo "Current Directory Snapshot" > $PAK_versons_dir/$PAK_Snapshot_ModListName
ls -y ./mods >> $PAK_versons_dir/$PAK_Snapshot_ModListName
if [ "$PAK_Debug " == "true " ]; then echo "Temp File $PAK_Snapshot_ModListName created"; fi
echo " "
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo " "



