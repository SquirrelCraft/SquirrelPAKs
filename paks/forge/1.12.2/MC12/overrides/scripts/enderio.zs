// ENDERIO
// mods.enderio.AlloySmelter.addRecipe
// 	(IItemStack output, 
//		IIngredient[] input,
//		@Optional int energyCost,
//		@Optional float xp
//	);


// Sand = <minecraft:sand>
// electrum = <thermalfoundation:material:161>
// manyullyn = <tconstruct:ingots:2>
// Mana Nugget <thermalfoundation:material:200>
// Mana Ingot = <thermalfoundation:material:136>
// Mana Block = <thermalfoundation:storage:8>

// Raw Limestone = <chisel:limestone2:7> 
// Platinum = <thermalfoundation:material:134>
// Iridium = <thermalfoundation:material:135> 
// Diamond Block = <minecraft:diamond_block>



// Add Mana Ingots
mods.enderio.AlloySmelter.addRecipe(
	<thermalfoundation:material:136> * 9, 
		[
			<minecraft:sand>, 
			<thermalfoundation:material:161> * 9, 
			<tconstruct:ingots:2> * 18
		],
		200000
);

// Add Iridium Ingots
mods.enderio.AlloySmelter.addRecipe(
	<thermalfoundation:material:135> * 4, 
		[
			<chisel:limestone2:7> * 3, 
			<thermalfoundation:material:134> * 6, 
			<minecraft:diamond_block>
		],
		300000
);