// Custom 
// craftingTable.addShaped("REC_NAME", ITEM, [
//  [xxxx, xxxx, xxxx],
//  [xxxx, xxxx, xxxx],
//  [xxxx, xxxx, xxxx]]);

//craftingTable.addShapeless("REC_NAME", 
//		ITEM_TO_CRAFT), 
//		[ITEM_1,ITEM_2]);

craftingTable.addShaped("sc_endertendril_seed", <item:endertendril:ender_tendril_seed>, [
  [<item:delightful:green_tea_leaf>, <item:minecraft:wheat_seeds>, <item:delightful:green_tea_leaf>],
  [<item:delightful:green_tea_leaf>, <item:minecraft:ender_eye>, <item:delightful:green_tea_leaf>],
  [<item:delightful:green_tea_leaf>, <item:minecraft:potion>.withTag({Potion: "minecraft:invisibility"}), <item:delightful:green_tea_leaf>]]);	
  
  
 craftingTable.addShaped("sc_name_tag", <item:minecraft:name_tag>, [
  [<item:minecraft:air>, <item:minecraft:chain>, <item:minecraft:chain>],
  [<item:thermal:bronze_plate>, <item:thermal:bronze_plate>, <item:minecraft:chain>],
  [<item:thermal:bronze_plate>, <item:thermal:bronze_plate>, <item:minecraft:air>]]);	
  
  
craftingTable.addShaped("sc_dim_shard", <item:rftoolsbase:dimensionalshard>, [
  [<item:ae2:certus_quartz_crystal>, <item:ae2:certus_quartz_crystal>, <item:ae2:certus_quartz_crystal>],
  [<item:ae2:certus_quartz_crystal>, <item:thermal:ruby>, <item:ae2:charged_certus_quartz_crystal>],
  [<item:ae2:certus_quartz_crystal>, <item:ae2:charged_certus_quartz_crystal>, <item:ae2:fluix_crystal>]]);	
 
 
craftingTable.addShaped("sc_therm_smelter", <item:thermal:machine_smelter>, [
  [<item:minecraft:air>, <item:minecraft:blast_furnace>, <item:minecraft:air>],
  [<tag:items:minecraft:sand>, <item:thermal:machine_frame>, <tag:items:minecraft:sand>],
  [<item:thermal:invar_gear>, <item:thermal:rf_coil>, <item:thermal:invar_gear>]]);	

craftingTable.addShaped("sc_log2chest", <item:minecraft:chest> * 4, [
  [<tag:items:minecraft:logs>, <tag:items:minecraft:logs>, <tag:items:minecraft:logs>],
  [<tag:items:minecraft:logs>, <item:minecraft:air>, <tag:items:minecraft:logs>],
  [<tag:items:minecraft:logs>, <tag:items:minecraft:logs>, <tag:items:minecraft:logs>]]);	

craftingTable.addShaped("sc_saddle", <item:minecraft:saddle>, [
  [<item:minecraft:leather> * 2, <item:minecraft:leather> * 2, <item:minecraft:leather> * 2],
  [<item:engineersdecor:metal_bar>, <item:minecraft:leather> * 2, <item:minecraft:leather> * 2],
  [<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:chain> * 2]]);	

craftingTable.addShapeless("sc_wither_bone", <item:bhc:wither_bone>,
  [<item:minecraft:wither_skeleton_skull>, <item:minecraft:fire_charge>]);

craftingTable.addShaped("sc_dimcell", <item:rftoolspower:dimensionalcell>, [
  [<item:minecraft:redstone_block>, <item:minecraft:emerald>, <item:minecraft:redstone_block>],
  [<item:minecraft:emerald>, <item:rftoolspower:dimensionalcell_simple>, <item:minecraft:emerald>],
  [<item:minecraft:redstone_block>, <item:minecraft:emerald>, <item:minecraft:redstone_block>]]);	

craftingTable.addShaped("sc_red_melted_heart", <item:bhc:red_heart_melted>, [
  [<item:moremekanismprocessing:dust_ruby> * 7, <item:moremekanismprocessing:dust_ruby> * 7, <item:moremekanismprocessing:dust_ruby> * 7],
  [<item:moremekanismprocessing:dust_ruby> * 7, <item:minecraft:experience_bottle>, <item:moremekanismprocessing:dust_ruby> * 7],
  [<item:moremekanismprocessing:dust_ruby> * 7, <item:moremekanismprocessing:dust_ruby> * 7, <item:moremekanismprocessing:dust_ruby> * 7]]);	

craftingTable.addShaped("sc_blue_melted_heart", <item:bhc:blue_heart_melted>, [
  [<item:moremekanismprocessing:dust_sapphire> * 7, <item:moremekanismprocessing:dust_sapphire> * 7, <item:moremekanismprocessing:dust_sapphire> * 7],
  [<item:moremekanismprocessing:dust_sapphire> * 7, <item:bhc:red_heart_melted>, <item:moremekanismprocessing:dust_sapphire> * 7],
  [<item:moremekanismprocessing:dust_sapphire> * 7, <item:moremekanismprocessing:dust_sapphire> * 7, <item:moremekanismprocessing:dust_sapphire> * 7]]);

// AE2 easier ways
craftingTable.addShapeless("sc_fluix_crystal", 
		<item:ae2:fluix_crystal>, 
		[<item:minecraft:redstone>,<item:ae2:charged_certus_quartz_crystal>,<item:minecraft:quartz>,<item:minecraft:water_bucket>.reuse()]);

    
  
// Make bulb block easier 
craftingTable.remove(<item:tinylightbulbs:bulb_block>);

craftingTable.addShaped("sc_bulb_block", <item:tinylightbulbs:bulb_block>, [
  [<item:minecraft:white_stained_glass_pane>, <item:minecraft:white_stained_glass_pane>, <item:minecraft:white_stained_glass_pane>],
  [<item:minecraft:white_stained_glass_pane>, <item:tinylightbulbs:bulb>, <item:minecraft:white_stained_glass_pane>],
  [<item:minecraft:white_stained_glass_pane>, <item:minecraft:white_stained_glass_pane>, <item:minecraft:white_stained_glass_pane>]]);	
  
// Fix bag of yurting
craftingTable.remove(<item:bagofyurting:bag_of_yurting>);
craftingTable.addShaped("sc_bag_of_yurting", <item:bagofyurting:bag_of_yurting>.withTag({radius: 0}), [
  [<tag:items:comforts:hammocks>, <tag:items:comforts:hammocks>, <tag:items:comforts:hammocks>],
  [<tag:items:comforts:hammocks>, <tag:items:forge:ender_pearls>, <tag:items:comforts:hammocks>],
  [<tag:items:comforts:hammocks>, <tag:items:comforts:hammocks>, <tag:items:comforts:hammocks>]]);
  
  
// Fix packed up pallets
craftingTable.remove(<item:packedup:netherite_pallet>);
craftingTable.addShapeless("sc_palletof_netherite", 
		<item:packedup:netherite_pallet>, 
		[<item:packedup:pallet>,<item:minecraft:netherite_block> * 9]);

recipes.remove(<item:packedup:emerald_pallet>);
craftingTable.addShapeless("sc_palletof_emerald", 
		<item:packedup:emerald_pallet>, 
		[<item:packedup:pallet>,<item:minecraft:emerald_block> * 9]);

recipes.remove(<item:packedup:gold_pallet>);
craftingTable.addShapeless("sc_palletof_gold", 
		<item:packedup:gold_pallet>, 
		[<item:packedup:pallet>,<item:minecraft:gold_block> * 9]);

recipes.remove(<item:packedup:iron_pallet>);
craftingTable.addShapeless("sc_palletof_iron", 
		<item:packedup:iron_pallet>, 
		[<item:packedup:pallet>,<item:minecraft:iron_block> * 9]);

recipes.remove(<item:packedup:copper_pallet>);
craftingTable.addShapeless("sc_palletof_copper", 
		<item:packedup:copper_pallet>, 
		[<item:packedup:pallet>,<item:minecraft:copper_block> * 9]);

recipes.remove(<item:packedup:diamond_pallet>);
craftingTable.addShapeless("sc_palletof_diamond", 
		<item:packedup:diamond_pallet>, 
		[<item:packedup:pallet>,<item:minecraft:diamond_block> * 9]);

// Add recipe for indust latex bucket 
craftingTable.addShaped("sc_thermal_rubber", <item:thermal:rubber> * 12, [
  [<item:industrialforegoing:latex_bucket>, <item:industrialforegoing:latex_bucket>, <item:minecraft:air>],
  [<item:industrialforegoing:latex_bucket>, <item:industrialforegoing:latex_bucket>, <item:minecraft:air>],
  [<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>]]);

craftingTable.addShaped("sc_thermal_cured_rubber", <item:thermal:cured_rubber> * 10, [
  [<item:industrialforegoing:latex_bucket>, <item:industrialforegoing:latex_bucket>, <item:minecraft:air>],
  [<item:industrialforegoing:latex_bucket>, <item:industrialforegoing:latex_bucket>, <item:minecraft:air>],
  [<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:fire_charge>]]);

// Fix iron frame clash
recipes.remove(<item:advgenerators:iron_frame>);
craftingTable.addShaped("sc_ironframe", <item:advgenerators:iron_frame>, [
 [<tag:items:forge:nuggets/iron>, <tag:items:forge:nuggets/iron>, <tag:items:forge:nuggets/iron>],
 [<tag:items:forge:nuggets/iron>, <item:minecraft:air>, <tag:items:forge:nuggets/iron>],
 [<tag:items:forge:nuggets/iron>, <tag:items:forge:nuggets/iron>, <tag:items:forge:nuggets/iron>]]);