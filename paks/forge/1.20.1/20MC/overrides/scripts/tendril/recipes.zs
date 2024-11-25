# Add way to convert tendril_pearls to normal ender pearls
craftingTable.addShapeless("ender_pearl1", <item:minecraft:ender_pearl>, [<item:endertendril:tendril_pearl>]);

# Add way to craft ender tendril seeds
craftingTable.addShaped("ender_tendril_seed1", <item:endertendril:ender_tendril_seed>, [
[<item:minecraft:ender_pearl> * 2, <item:minecraft:ender_pearl> * 2, <item:minecraft:ender_pearl> * 2], 
[<item:minecraft:ender_pearl> * 2, <item:minecraft:cherry_sapling>, <item:minecraft:ender_pearl> * 2], 
[<item:minecraft:ender_pearl> * 2, <item:minecraft:ender_pearl> * 2, <item:minecraft:ender_pearl> * 2]]);

craftingTable.addShaped("ender_tendril_seed2", <item:endertendril:ender_tendril_seed>, [
[<item:minecraft:ender_eye>, <item:minecraft:ender_eye>, <item:minecraft:ender_eye>], 
[<item:minecraft:ender_eye>, <item:minecraft:cherry_sapling>, <item:minecraft:ender_eye>], 
[<item:minecraft:ender_eye>, <item:minecraft:ender_eye>, <item:minecraft:ender_eye> ]]);

craftingTable.addShaped("ender_tendril_seed3", <item:endertendril:ender_tendril_seed> * 2, [
[<item:minecraft:bone_meal> * 2, <item:minecraft:bone_meal> * 2, <item:minecraft:bone_meal> * 2], 
[<item:minecraft:bone_meal> * 2, <item:endertendril:tendril_pearl> * 2, <item:minecraft:bone_meal> * 2], 
[<item:minecraft:bone_meal> * 2, <item:minecraft:bone_meal> * 2, <item:minecraft:bone_meal> * 2 ]]);
