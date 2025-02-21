// Custom 

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
  [<item:ae2:certus_quartz_crystal>, <item:enderio:pulsating_crystal>, <item:ae2:charged_certus_quartz_crystal>],
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

