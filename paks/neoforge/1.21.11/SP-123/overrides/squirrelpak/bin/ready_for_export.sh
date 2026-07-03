#!/bin/bash
#
#     Internal script to ready for Export to CF
#
#     v4.4.1
# 

#     /squrrelpak/bin/ready_for_export.sh
#     Copyright (C) 2026 The Network Squirrel(SquirrelCraft)
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
echo "  SquirrelPAK CF Export Script v4.4.1"
echo "  (ready_for_export.sh) - Licnesed under GNU GPLv3"
echo " ----------------------------------------------------------------------------"
echo " | Copyright (C) 2026 The Network Squirrel(SquirrelCraft)                   |"
echo " | https://github.com/SquirrelCraft/squirrelpak-scripts                     |"
echo " | This program comes with ABSOLUTELY NO WARRANTY; This is free software,   |"
echo " | and you are welcome to redistribute it under certain conditions          |"
echo " ----------------------------------------------------------------------------"
echo " "

Script_Dir=$PWD 
PAK_ChangeLog=./changelog.txt
PAK_Full_ChangeLog=./changelog-full.txt
PAK_Removed_Files_Base_Dir=./zz-do-not-export
PAK_Export_Timestamp_File=$PAK_Removed_Files_Base_Dir/exported.timestamp

# We should be in the root dir where the changelog is
# located, if not exit
echo " "
echo " Script: Checking running directory..."
if [ ! -f $PAK_ChangeLog ]; then
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
echo " ----------------------------------------------------------------------------"



echo " Script: Checking for exported time stamp file"
if [ -f $PAK_Export_Timestamp_File ]; then
    echo " "
    echo "  Project has already been exported!"
    echo "  File $PAK_Export_Timestamp_File has been found"
    echo " "
    echo " -------------------------------------------------------"
    echo "Exported Time Stamp Details:"
    echo " -------------------------------------------------------"
    echo " "
    cat $PAK_Export_Timestamp_File
    echo " -------------------------------------------------------"
    echo " END OF FILE"
    echo " -------------------------------------------------------"
    echo " "
        
    echo "  The script exiting! We did nothing!"
    echo " "
    exit 1
fi
echo " Script: No exported time stamp file found"
echo " "
echo " ----------------------------------------------------------------------------"


echo " Script: Checking to see if project is marked Ready to Export"
if [ ! -f ./ready2.export ]; then
    echo " "
    echo "  Project is not marked Ready to Export!"
    echo "  File ready2.export not found"
    echo "  Script exiting!"
    echo " "
    exit 1
fi
echo " Script: Project marked Ready to Export"
echo " "
echo " ----------------------------------------------------------------------------"



# Set local vars
echo " Setting local var"
PAK_bin_dir=./squirrelpak/bin
PAK_etc_dir=./squirrelpak/etc
PAK_versons_dir=./squirrelpak/versions
PAK_export_history_base_dir=$PAK_Removed_Files_Base_Dir/0-export-history
PAK_last_export_history=$PAK_export_history_base_dir/last-export
PAK_Timestamp=`date +"%C%y%m%d%H%M"`
PAK_FM3_ASSET_DIR=./config/fancymenu/assets
PAK_CreditsFile=./credits.md
PAK_LicenseFile=./LICENSES/LICENSES.md
PAK_Tools_Save_Dir=./zz-do-not-export/squirrelpak-tools
PAK_Tools_Config_Save_Dir=./zz-do-not-export/squirrelpak-tools-config

echo " Local vars Set!"
echo " Script_Dir=$Script_Dir"
echo " PAK_ChangeLog=$PAK_ChangeLog"
echo " PAK_Full_ChangeLog=$PAK_Full_ChangeLog"
echo " PAK_bin_dir=$PAK_bin_dir"
echo " PAK_etc_dir=$PAK_etc_dir"
echo " PAK_versons_dir=$PAK_versons_dir"
echo " PAK_export_history_base_dir=$PAK_export_history_base_dir"
echo " PAK_last_export_history=$PAK_last_export_history"
echo " PAK_Timestamp=$PAK_Timestamp"
echo " PAK_FM3_ASSET_DIR=$PAK_FM3_ASSET_DIR"
echo " PAK_CreditsFile=$PAK_CreditsFile"
echo " PAK_LicenseFile=$PAK_LicenseFile"
echo " PAK_Export_Timestamp_File=$PAK_Export_Timestamp_File"
echo " PAK_Removed_Files_Base_Dir=$PAK_Removed_Files_Base_Dir"
echo " PAK_Tools_Save_Dir=$PAK_Tools_Save_Dir"
echo " PAK_Tools_Config_Save_Dir=$PAK_Tools_Config_Save_Dir"
echo " "
echo " ----------------------------------------------------------------------------"

# Read config files
echo " Reading config files"
source $PAK_etc_dir/version.txt
source $PAK_etc_dir/current_version.txt
source $PAK_etc_dir/previous_version.txt

PAK_Full_Ver_Name="SquirrelPAK $PAK_NAME - $PAK_DESC v$PAK_VER"
PAK_Exported_ModListName=$PAK_NAME-v$PAK_VER-ModsList.txt
PAK_Short_Ver_Name="SquirrelPAK $PAK_NAME - v$PAK_VER"

PAK_Removed_Files_Export_Dir=$PAK_Removed_Files_Base_Dir/$PAK_RELEASE-$PAK_Timestamp

PAK_export_history_prev_dir=$PAK_export_history_base_dir/last-export
PAK_export_history_ver_dir=$PAK_export_history_base_dir/$PAK_RELEASE-$PAK_Timestamp


echo " Config files loaded, loaded config below:"
echo " "

echo " PAK_NAME_INIT_PFX=$PAK_NAME_INIT_PFX"
echo " PAK_NAME_INIT=$PAK_NAME_INIT"
echo " PAK_RELEASE=$PAK_RELEASE"
echo " PAK_MC_VER=$PAK_MC_VER"
echo " PAK_DESC=$PAK_DESC"
echo " PAK_FORGE_VER=$PAK_FORGE_VER"
echo " PAK_Menu_Config_Dir=$PAK_Menu_Config_Dir"
echo " PAK_NAME=$PAK_NAME"
echo " PAK_VER=$PAK_VER"
echo " PAK_Menu_Beta_Text=$PAK_Menu_Beta_Text"
echo " - - - - Fancy Menu Vars - - - - - "
echo " PAK_Menu3_Name=$PAK_Menu3_Name"
echo " PAK_Menu3_Version=$PAK_Menu3_Version"
echo " PAK_Menu3_INIT_PFX=$PAK_Menu3_INIT_PFX"
echo " PAK_Menu3_INIT=$PAK_Menu3_INIT"
echo " PAK_Menu3_INIT_FULL=$PAK_Menu3_INIT_FULL"
echo " PAK_Menu3_ShortName_And_Version=$PAK_Menu3_ShortName_And_Version"
echo " - - - - - - - - - - - - - - - - - -"
echo " PAK_Current_Version=$PAK_Current_Version "
echo " PAK_Previous_Version=$PAK_Previous_Version "
echo " PAK_Full_Ver_Name=$PAK_Full_Ver_Name "
echo " PAK_Short_Ver_Name=$PAK_Short_Ver_Name "
echo " PAK_Exported_ModListName=$PAK_Exported_ModListName "
echo " PAK_Removed_Files_Export_Dir=$PAK_Removed_Files_Export_Dir"
echo " PAK_CUR_VER=$PAK_CUR_VER"
echo " PAK_PREV_VER=$PAK_PREV_VER"
echo " PAK_export_history_base_dir=$PAK_export_history_base_dir"
echo " PAK_export_history_prev_dir=$PAK_export_history_prev_dir"
echo " PAK_export_history_ver_dir=$PAK_export_history_ver_dir"
echo " PAK_Tools_Save_Dir=$PAK_Tools_Save_Dir"
echo " - - - - Fancy Menu Vars R2- - - - - "
echo "PAK_Menu_R2_Menu_Music_Credits=$PAK_Menu_R2_Menu_Music_Credits"
echo "PAK_Menu_R2_Name=$PAK_Menu_R2_Name"
echo "PAK_Menu_R2_Desc=$PAK_Menu_R2_Desc"
echo "PAK_Menu_R2_Ver=$PAK_Menu_R2_Ver"
echo "PAK_Menu_R2_Full_Name_Ver=$PAK_Menu_R2_Full_Name_Ver"
echo " "
echo " ----------------------------------------------------------------------------"


echo " Script: Checking if export has already been run"
# Check if mod list file exists, if it does 
# remind us that we need to change the version!
if [ -f $PAK_versons_dir/$PAK_Exported_ModListName ]; then
    echo " "
    echo "  Error: Export has already run!"
    echo "  Change the version in the versions.txt file"
    echo " "
    echo "  Script exiting!"
    echo " "
    exit 1
else
    echo " Script: export has not been run for this version"
echo " ----------------------------------------------------------------------------"
fi

# Check for export directories exists
echo " "
echo " Check that $PAK_Removed_Files_Base_Dir exists"
if [ ! -d $PAK_Removed_Files_Base_Dir ]; then
    echo " "
    echo " Directoy does not exist, create it"
    mkdir -v $PAK_Removed_Files_Base_Dir
else
    echo " $PAK_Removed_Files_Base_Dir found, moving on"
    echo " ----------------------------------------------------------------------------"
fi


echo " "
echo " Check that $PAK_export_history_base_dir exists"
if [ ! -d $PAK_export_history_base_dir ]; then
    echo " "
    echo " Directoy does not exist, create it"
    mkdir -v $PAK_export_history_base_dir
else
    echo " $PAK_export_history_base_dir found, moving on"
    echo " ----------------------------------------------------------------------------"
fi


echo " "
echo " Check that $PAK_last_export_history exists"
if [ ! -d $PAK_last_export_history ]; then
    echo " "
    echo " Directoy does not exist, create it"
    mkdir -v $PAK_last_export_history
else
    echo " $PAK_last_export_history found, moving on"
    echo " ----------------------------------------------------------------------------"
fi

 
# check for mod pack tools def file exists 
if [ ! -f "$Script_Dir/squirrelpak/etc/pak_tools_mods.txt" ]; then
    echo " "
    echo "  Missing pak tool remove list!"
    echo "  Can not find file $Script_Dir/squirrelpak/etc/pak_tools_mods.txt"
    echo "  You need to create this file first!"
    echo " "
    echo "  Script is exiting!"
    echo " "
    exit 1
fi

 
 
echo " "
echo " Getting Ready for Export!!"
echo " $PAK_Full_Ver_Name"


# Enable FM Editing
echo " "
echo "   - Disable Fancy Menu Editing"
sed -i '' "s/B:show_customization_overlay = '[^']*';/B:show_customization_overlay = 'false';/" config/fancymenu/options.txt
sed -i '' "s/B:modpack_mode = '[^']*';/B:modpack_mode = 'true';/" config/fancymenu/options.txt
echo " "
echo " ----------------------------------------------------------------------------"



# Remove voice server ID
sed -i '' 's/^server_id[[:space:]]*=.*/server_id = ""/' config/plasmovoice/server/config.toml




# Move unneeded dir
echo " Move un-needed files to:"
echo " $PAK_Removed_Files_Export_Dir"
echo " "

echo " Create folder"
echo " $PAK_Removed_Files_Export_Dir"
echo " "
mkdir $PAK_Removed_Files_Export_Dir

echo " "
echo " Moving backups..."
mv -v backups $PAK_Removed_Files_Export_Dir/


echo " "
echo " Moving crash-reports..."
mv -v crash-reports $PAK_Removed_Files_Export_Dir/


echo " "
echo " Moving xaero files ..."
mv -v xaero $PAK_Removed_Files_Export_Dir/
mv -v XaeroWaypoints* $PAK_Removed_Files_Export_Dir/


echo " "
echo " Moving fancymenu_data..."
mv -v fancymenu_data $PAK_Removed_Files_Export_Dir/

echo " "
echo " Moving fancymenu_data..."
mv -v fancymenu_data $PAK_Removed_Files_Export_Dir/



echo " "
echo " Moving logs..."
mv -v logs $PAK_Removed_Files_Export_Dir/
mv -v hs_err_* $PAK_Removed_Files_Export_Dir/


echo " "
echo " Moving screenshots..."
mv -v screenshots $PAK_Removed_Files_Export_Dir/


echo " "
echo " Moving ESM..."
mv -v ESM $PAK_Removed_Files_Export_Dir/


echo " "
echo " Moving downloads..."
mv -v downloads $PAK_Removed_Files_Export_Dir/


echo " "
echo " Moving .cache..."
mkdir $PAK_Removed_Files_Export_Dir/cache
mv -v .cache $PAK_Removed_Files_Export_Dir/cache



echo " "
echo " Moving realms_persistence.json..."
mv -v realms_persistence.json $PAK_Removed_Files_Export_Dir/

echo " "
echo " Moving usercache.json..."
mv -v usercache.json $PAK_Removed_Files_Export_Dir/

echo " "
echo " Moving usernamecache.json..."
mv -v usernamecache.json $PAK_Removed_Files_Export_Dir/


echo " "
echo " Moving options.txt..."
mv -v options.txt $PAK_Removed_Files_Export_Dir/
echo " "
echo " "

echo " "
echo " Moving servers.dat..."
mv -v servers.dat* $PAK_Removed_Files_Export_Dir/
echo " "
echo " "

echo " "
echo " Moving command_history.txt..."
mv -v command_history.txt $PAK_Removed_Files_Export_Dir/
echo " "
echo " "

echo " "
echo " Moving sodium-fingerprint.json..."
mv -v config/sodium-fingerprint.json $PAK_Removed_Files_Export_Dir/
echo " "
echo " "


# Move optional folders
echo " Move opt folders to:"
echo " $PAK_Removed_Files_Export_Dir"
echo " "

echo " "
echo " Moving datapacks..."
mv -v datapacks $PAK_Removed_Files_Export_Dir/

echo " "
echo " Moving shaderpacks..."
mv -v shaderpacks $PAK_Removed_Files_Export_Dir/


echo " "
echo " Moving ServerPAK if there..."
mv -v Server-SquirrelPAK* $PAK_Removed_Files_Export_Dir/



# Move saved games
echo " Move saved games to:"
echo " $PAK_Removed_Files_Export_Dir"
echo " "

echo " "
echo " Moving saved..."
mv -v saves $PAK_Removed_Files_Export_Dir/

echo " "
echo " Copy saved games..."
cp -vr $PAK_Removed_Files_Export_Dir/saves/ ./zz-do-not-export/saved-games/

# Remove DS_Store files
echo " Removing DS_Store files..."
find . -name '.DS_Store' -type f -delete
echo " "

echo " Remove un-needed files complete!"
echo " "
echo " ----------------------------------------------------------------------------"


# Create Client Mod Remove List for Server
echo " "
echo " Create Client Mod Server Remove List"
input="$PAK_etc_dir/client_mods.txt"
echo " Read from: $input"
echo " "

echo "# Do not edit this file! Created from ready_for_export.sh" > $PAK_etc_dir/client_mod_remove_list.txt
echo "# Mods to Remove From Server - $PAK_NAME-v$PAK_VER" >> $PAK_etc_dir/client_mod_remove_list.txt

while IFS= read -r file; do

	if [[ $file = \#* ]]
	then
		echo " Added $file"
		echo "$file" >> $PAK_etc_dir/client_mod_remove_list.txt
	else
		ls -y mods/$file
        ls -y mods/$file >> $PAK_etc_dir/client_mod_remove_list.txt
	fi

done < "$input"
echo " Client Mod Server Remove List Complete"
echo " "
echo " ----------------------------------------------------------------------------"


# Start mod tools removal 
echo " Start Mod Tools Relocation"
echo " "
echo " "
echo " Create Mod Tools Remove List"
input="$PAK_etc_dir/pak_tools_mods.txt"
echo " Read from: $input"
output="$PAK_etc_dir/pak_tools_mods_list.txt"
echo " Write to: $output"
echo " "
echo "# Do not edit this file! Created from ready_for_export.sh" > $output
echo "# Pak Tool Mods to Remove From Export - $PAK_NAME-v$PAK_VER" >> $output

while IFS= read -r file; do

	if [[ $file = \#* ]]
	then
		echo " Added $file"
		echo "$file" >> $output
	else
		ls -y mods/$file
        ls -y mods/$file >> $output
	fi

done < "$input"
echo " Pak Tools Mod Remove List Complete"
echo " "
echo " ----------------------------------------"

echo " Moving Pak Tools to $PAK_Tools_Save_Dir"
echo " "
echo " "
# Remove pak tools mods from list
input="$Script_Dir/squirrelpak/etc/pak_tools_mods_list.txt"
echo " Reading file: $input"
echo " "

while IFS= read -r file; do

	if [[ $file = \#* ]]
	then
		echo "$file"
	else
		echo " move file $file to $PAK_Tools_Save_Dir"
		pwd
		mv -v $file $PAK_Tools_Save_Dir
		echo " "
	fi

done < "$input"

echo " Moving Pak Tools Config to $PAK_Tools_Config_Save_Dir"
echo " "
# Move PAK Tools Config

mv -v ./config/worldedit $PAK_Tools_Config_Save_Dir
mv -v ./config/xray $PAK_Tools_Config_Save_Dir
mv -v ./config/panoramica $PAK_Tools_Config_Save_Dir
mv -v ./config/xray-client.toml $PAK_Tools_Config_Save_Dir

# End mod tools removal
echo " "
echo " Pak Tools Removed"
echo " "
echo " ---------------------------------------- "







echo " "
echo " Create Mod List File"
echo " $PAK_Full_Ver_Name" > $PAK_versons_dir/$PAK_Exported_ModListName
ls ./mods | sort --ignore-case >> $PAK_versons_dir/$PAK_Exported_ModListName
echo " File $PAK_Exported_ModListName created"
echo " "
echo " ----------------------------------------------------------------------------"

 
# Clean up prev PAK_export_history_ver_dir
echo " Cleaning last export history folder at"
echo " $PAK_export_history_prev_dir"

echo " Run CMD: rm -Rv $PAK_export_history_prev_dir"
rm -Rv $PAK_export_history_prev_dir
echo " Done!"
echo " "
echo " Run CMD: mkdir -v $PAK_export_history_prev_dir"
mkdir -v $PAK_export_history_prev_dir
echo " Done!"


echo " Cleaning previous backup folder complete!"
echo " "
echo " ----------------------------------------------------------------------------"
echo " "

echo " Backup $PAK_etc_dir/previous_version.txt to"
echo " $PAK_export_history_prev_dir/previous_version.txt"
cp -v $PAK_etc_dir/previous_version.txt $PAK_export_history_prev_dir/previous_version.txt
echo " "
echo " Done!"
echo " ----------------------------------------------------------------------------"
echo " "

echo " "
echo " Set previous version with current version:"
echo " $PAK_Previous_Version to $PAK_Exported_ModListName"
echo " "
echo " "
echo "# This file is auto created by ready_for_export.sh" > $PAK_etc_dir/previous_version.txt
echo "#" >> $PAK_etc_dir/previous_version.txt
echo "# Do not edit directly, bad things could happen" >> $PAK_etc_dir/previous_version.txt
echo "#" >> $PAK_etc_dir/previous_version.txt
echo "#" >> $PAK_etc_dir/previous_version.txt
echo "PAK_Previous_Version=$PAK_Current_Version" >> $PAK_etc_dir/previous_version.txt
echo " PAK_Previous_Version=$PAK_Current_Version"
echo "PAK_PREV_VER=$PAK_CUR_VER" >> $PAK_etc_dir/previous_version.txt
echo " PAK_PREV_VER=$PAK_CUR_VER" 
echo " "
echo " done!"
echo " "
echo " ----------------------------------------------------------------------------"


echo " Backup $PAK_etc_dir/current_version.txt to"
echo " $PAK_export_history_prev_dir/current_version.txt"
cp -v $PAK_etc_dir/current_version.txt $PAK_export_history_prev_dir/current_version.txt
echo " "
echo " Done!"
echo " ----------------------------------------------------------------------------"
echo " "

echo " "
echo " Set the new current version"
echo " $PAK_Current_Version to $PAK_Exported_ModListName"
echo " "
echo "# This file is auto created by ready_for_export.sh" > $PAK_etc_dir/current_version.txt
echo "#" >> $PAK_etc_dir/current_version.txt
echo "# Do not edit directly, bad things could happen" >> $PAK_etc_dir/current_version.txt
echo "#" >> $PAK_etc_dir/current_version.txt
echo "#" >> $PAK_etc_dir/current_version.txt
echo "PAK_Current_Version=$PAK_Exported_ModListName" >> $PAK_etc_dir/current_version.txt
echo " PAK_Current_Version=$PAK_Exported_ModListName"
echo "PAK_CUR_VER=$PAK_RELEASE" >> $PAK_etc_dir/current_version.txt
echo " PAK_CUR_VER=$PAK_RELEASE"
echo " "
echo " done!"
echo " "
echo " ----------------------------------------------------------------------------"


echo " "
echo " Setting Version on Fancy Menus, in case you forgot!"
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
echo " Copy to: $PAK_FM3_ASSET_DIR/credits.md"
echo " --------------------------------"
cp -v $PAK_CreditsFile $PAK_FM3_ASSET_DIR/credits.md
echo " --------------------------------"
echo " done"
echo " "

echo " Copy license file to Fancy Menu Assets:"
echo " Copy to: $PAK_FM3_ASSET_DIR/licesnse.md"
echo " --------------------------------"
cp -v $PAK_LicenseFile $PAK_FM3_ASSET_DIR/license.md
echo " --------------------------------"
echo " done"
echo " "

echo " Setting Fancy Menu Version Files - Complete"
echo " "
echo " ----------------------------------------------------------------------------"


echo " Confirm Change Log Notes"
nano $PAK_etc_dir/changelog-notes.txt
echo " Done!"
echo " ----------------------------------------------------------------------------"
echo " "

echo " Backup $PAK_ChangeLog to"
echo " $PAK_export_history_prev_dir/changelog.txt"
cp -v $PAK_ChangeLog $PAK_export_history_prev_dir/changelog.txt
echo " "
echo " Done!"
echo " ----------------------------------------------------------------------------"
echo " "

echo " Backup $PAK_Full_ChangeLog to"
echo " $PAK_export_history_prev_dir/changelog-full.txt"
cp -v $PAK_Full_ChangeLog $PAK_export_history_prev_dir/changelog-full.txt
echo " "
echo " Done!"
echo " ----------------------------------------------------------------------------"
echo " "



echo " Backup $PAK_etc_dir/changelog-notes.txt to"
echo " $PAK_export_history_prev_dir/changelog-notes.txt"
cp -v $PAK_etc_dir/changelog-notes.txt $PAK_export_history_prev_dir/changelog-notes.txt
echo " "
echo " Done!"
echo " ----------------------------------------------------------------------------"
echo " "



echo " "
echo " Update the changelog"
echo " - - - - -"
echo " Change changelog name to $PAK_ChangeLog.bak"
mv -v $PAK_ChangeLog $PAK_ChangeLog.bak
echo " "

echo " Change changelog-full name to $PAK_Full_ChangeLog.bak"
mv -v $PAK_Full_ChangeLog $PAK_Full_ChangeLog.bak
echo " "

echo " Write new change log template header"
cat <<EOF > $PAK_ChangeLog
$PAK_Full_Ver_Name
=====================================================
SquirrelPAK $PAK_NAME Release $PAK_RELEASE
File Version $PAK_VER

Required Forge Version: $PAK_FORGE_VER
=====================================================

EOF

echo " done"
echo " "


echo " Append change log notes from $PAK_etc_dir/changelog-notes.txt"
if [ -f $PAK_etc_dir/changelog-notes.txt ]; then
   echo "Notes found, adding them to change log"
   echo " " >> $PAK_ChangeLog
   cat $PAK_etc_dir/changelog-notes.txt >> $PAK_ChangeLog
   echo " " >> $PAK_ChangeLog
   echo "--------------------------------"
   cat $PAK_etc_dir/changelog-notes.txt
   echo "--------------------------------"
   echo " "
   echo "Resetting change log notes file"
   cat <<EOF > $PAK_etc_dir/changelog-notes.txt
Change Log Notes - Title Here 

Summary:
Notes Here
 
-------------------------------------------
 Mod Changes from v$PAK_VER
-------------------------------------------
EOF
else
   echo "  No change log notes found, adding Add notes here tag"
   echo "  Add Change Log Notes Here!" >> $PAK_ChangeLog
fi
echo " done"
echo " "

echo " "
echo " Adding mod change list to changelog file"
echo " " >> $PAK_ChangeLog
echo " " >> $PAK_ChangeLog

# If the previous is None from when the script ran then mark
# as such.
# Remember that PAK_Exported_ModListName is current
# and PAK_Current_Version is previous in the current context 
# when the script ran since we do not update the running vars
#
if [ "$PAK_Current_Version" == "None" ]; then
    echo " "
    echo "  There is no Previous Version"
    echo "  skipping"
    echo " "
else
    echo " Addng mod diff to changelog"
cat <<EOF >> $PAK_ChangeLog

[Key Codes]
|  = Mod Updated
<  = Mod Added
>  = Mod Removed
-------------------------------------------
EOF
    $PAK_bin_dir/wtd.sh $PAK_versons_dir/$PAK_Exported_ModListName $PAK_versons_dir/$PAK_Current_Version true >> $PAK_ChangeLog
fi

# Add rest of the change log template 
cat <<EOF >> $PAK_ChangeLog

-------------------------------------------
For the full mod list see the file 
squirrelpak/versions/$PAK_Exported_ModListName
-------------------------------------------

EOF


echo " Add change log end template from file $PAK_etc_dir/changelog-end-template.txt"
echo " Adding below text to change log:"
echo " --------------------------------"
echo " " >> $PAK_ChangeLog
cat $PAK_etc_dir/changelog-end-template.txt
echo " " >> $PAK_ChangeLog
echo " --------------------------------"
cat $PAK_etc_dir/changelog-end-template.txt >> $PAK_ChangeLog
echo " done"
echo " "

# Change log here is only this release to this point 

echo " Copy this release change log to Fancy Menu Assets:"
echo " Copy to: $PAK_FM3_ASSET_DIR/changelog.txt"
echo " --------------------------------"
cp -v $PAK_ChangeLog $PAK_FM3_ASSET_DIR/changelog.txt
echo " --------------------------------"
echo " done"
echo " "

echo " Create new changelog-full.txt"
echo "  - Copy current change log..."
cat $PAK_ChangeLog > $PAK_Full_ChangeLog
echo "  - Copy changelog history"
cat $PAK_Full_ChangeLog.bak >> $PAK_Full_ChangeLog
echo " done"
echo " "
echo " Remove copy of changelog.txt.bak"
rm -v $PAK_ChangeLog.bak
echo " done"
echo " "
echo " Remove copy of changelog-full.txt.bak"
rm -v $PAK_Full_ChangeLog.bak
echo " done"
echo " "
echo " Update changelog complete!"
echo " "
echo " ----------------------------------------------------------------------------"
echo " "


# Stamp version history by copy version file
echo " Record export history in file database"
echo " - Copy $PAK_versons_dir/$PAK_Exported_ModListName to $PAK_export_history_prev_dir"
cp -v $PAK_versons_dir/$PAK_Exported_ModListName $PAK_export_history_prev_dir/$PAK_Exported_ModListName
echo     "done!"
echo " "
echo " - Create version stamp"
echo "    - Make version directory"
mkdir -v $PAK_export_history_ver_dir
echo "      done!"
echo " "
echo "    - Copy files from PAK_export_history_prev_dir to: " 
echo "      $PAK_export_history_ver_dir"
cp -v $PAK_export_history_prev_dir/* $PAK_export_history_ver_dir
echo "      done!"
echo " "
echo "    - Create Export Stamp File"
cat <<EOF > $PAK_Export_Timestamp_File
PAK_UNDO_VER_STAMP=$PAK_RELEASE-$PAK_Timestamp
# Time Stamp File - $PAK_RELEASE-$PAK_Timestamp
#
# $PAK_Full_Ver_Name
# =====================================================
# SquirrelPAK $PAK_NAME Release $PAK_RELEASE
# File Version $PAK_VER
# 
# Required Forge Version: $PAK_FORGE_VER
# =====================================================

EOF
cp -v $PAK_Export_Timestamp_File $PAK_export_history_prev_dir
cp -v $PAK_Export_Timestamp_File $PAK_export_history_ver_dir
echo "      done!"
echo " "
echo "   done!"
echo " "
echo " Record export history in file database complete!"
echo " "
echo " ----------------------------------------------------------------------------"
echo " "


echo " Remove ready to export file check file"
rm -v ./ready2.export
echo " done"
echo " "
echo " ----------------------------------------------------------------------------"

echo " "
echo " ----------------------------------------------------------------------------"
echo " Script Complete!"
echo " ----------------------------------------------------------------------------"
echo " "
