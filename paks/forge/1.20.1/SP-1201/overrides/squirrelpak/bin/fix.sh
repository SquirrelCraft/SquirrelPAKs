#!/bin/bash


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


# Move Pak Tools back
echo " "
echo " - Move Pak Tools back to mods dir"
echo "mv -v ./squirrelpak/pak-tools/* ./mods"
mv -v ./squirrelpak/pak-tools/* ./mods
echo " "
echo " Script Complete"
echo " "
echo " ----------------------------------------------------------------------------"
