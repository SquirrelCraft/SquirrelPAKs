craftingTable.addShapeless("scsp_tec_book1", <item:patchouli:guide_book>.withTag({"patchouli:book": "patchouli:scsp_tec_guide" as string}), [<item:minecraft:paper>, <tag:items:minecraft:dirt>]);

# Add way to get quartz
craftingTable.addShapeless("scsp_quartz1", <item:minecraft:quartz> * 8, [<tag:items:forge:storage_blocks/quartz>, <item:minecraft:flint>]);

craftingTable.addShapeless("scsp_quartz2", <item:minecraft:quartz> * 8, [<item:minecraft:smooth_quartz>, <item:minecraft:flint>]);

craftingTable.addShapeless("scsp_quartz3", <item:minecraft:quartz> * 8, [<item:minecraft:quartz_bricks>, <item:minecraft:flint>]);

craftingTable.addShapeless("scsp_quartz4", <item:minecraft:quartz> * 8, [<item:minecraft:chiseled_quartz_block>, <item:minecraft:flint>]);

craftingTable.addShapeless("scsp_quartz5", <item:minecraft:quartz> * 8, [<item:minecraft:quartz_pillar>, <item:minecraft:flint>]);


# Better way to make leather from flesh
craftingTable.addShaped("scsp_leather", <item:minecraft:leather>, [ [<tag:items:forge:rods/wooden>, <tag:items:forge:rods/wooden>, <item:minecraft:rotten_flesh>], [<tag:items:forge:rods/wooden>, <item:minecraft:rotten_flesh>, <tag:items:forge:rods/wooden>], [<item:minecraft:rotten_flesh>, <tag:items:forge:rods/wooden>, <tag:items:forge:rods/wooden>]]);