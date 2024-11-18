craftingTable.remove(<item:lightmanscurrency:trading_core>);
craftingTable.remove(<item:lightmanscurrency:coinmint>);
craftingTable.remove(<item:lightmanscurrency:atm>);
craftingTable.remove(<item:lightmanscurrency:terminal>);


craftingTable.addShaped("lightmanscurrency_trading_core", <item:lightmanscurrency:trading_core>, [[<item:minecraft:redstone>, <item:minecraft:quartz>, <item:minecraft:redstone>], [<item:minecraft:redstone>, <item:minecraft:dropper>, <item:minecraft:redstone>], [<item:minecraft:comparator>,<item:compressium:redstone_1> ,<item:minecraft:comparator> ]]);


craftingTable.addShaped("lightmanscurrency_coinmint", <item:lightmanscurrency:coinmint>, [[<item:compressium:iron_1>,<item:minecraft:sticky_piston> ,<item:compressium:iron_1> ], [<item:compressium:iron_1>,<item:tconstruct:round_plate_cast> ,<item:compressium:iron_1> ], [<item:compressium:iron_2>,<item:compressium:iron_2> ,<item:compressium:iron_2> ]]);


craftingTable.addShaped("lightmanscurrency_terminal", <item:lightmanscurrency:terminal>, [[<item:minecraft:chiseled_quartz_block>, <item:minecraft:ender_eye>,<item:minecraft:chiseled_quartz_block> ], [<item:minecraft:chiseled_quartz_block>, <item:minecraft:tinted_glass>,<item:minecraft:chiseled_quartz_block> ], [<item:minecraft:comparator>,<item:lightmanscurrency:trading_core> , <item:minecraft:comparator>]]);


  craftingTable.addShaped("lightmanscurrency_atm", <item:lightmanscurrency:atm>, [[<item:compressium:iron_1>,<item:supplementaries:redstone_illuminator> ,<item:compressium:iron_1> ], [<item:compressium:iron_1>,<item:lightmanscurrency:terminal> ,<item:compressium:iron_1> ], [<item:compressium:iron_1>,<item:storagedrawers:compacting_drawers_3> ,<item:compressium:iron_1> ]]);