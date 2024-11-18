craftingTable.remove(<item:adfinders:mineral_finder>);
craftingTable.remove(<item:adfinders:gem_finder>);
craftingTable.remove(<item:adfinders:metal_finder>);


  craftingTable.addShaped("adfinders_mineral_finder", <item:adfinders:mineral_finder>, [[ <item:minecraft:redstone_block>, <item:minecraft:comparator>, <item:minecraft:redstone_block>], [<item:minecraft:comparator>, <item:minecraft:compass>, <item:minecraft:comparator>], [<item:minecraft:coal_block> * 2, <item:minecraft:iron_block> * 2, <item:minecraft:coal_block> * 2]]);


  craftingTable.addShaped("adfinders_gem_finder", <item:adfinders:metal_finder>, [[ <item:minecraft:comparator> * 2, <item:minecraft:copper_block> * 16, <item:minecraft:comparator> * 2], [<item:minecraft:comparator> * 2, <item:minecraft:compass>, <item:minecraft:comparator> * 2], [<item:minecraft:iron_block> * 4, <item:minecraft:gold_block> * 8, <item:minecraft:iron_block> * 4]]);

 
  craftingTable.addShaped("adfinders_metal_finder", <item:adfinders:gem_finder>, [[ <item:minecraft:emerald_block>, <item:minecraft:lapis_block> * 2, <item:minecraft:emerald_block>], [<item:minecraft:comparator> * 4, <item:minecraft:compass>, <item:minecraft:comparator> * 4], [<item:minecraft:diamond_block> * 2, <item:minecraft:quartz_block> * 2, <item:minecraft:diamond_block> * 2]]);
