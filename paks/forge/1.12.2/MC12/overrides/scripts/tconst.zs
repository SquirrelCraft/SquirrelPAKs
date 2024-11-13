// tconstruct tweaks


// nugget = 16mb
// ingot = 144mb
// block = 1296mb

// Sand = <minecraft:sand>
// electrum = <thermalfoundation:material:161>
// manyullyn = <tconstruct:ingots:2>
// Mana Nugget <thermalfoundation:material:200>
// Mana Ingot = <thermalfoundation:material:136>
// Mana Block = <thermalfoundation:storage:8>


// Add Alloy Recipe
// mods.tconstruct.Alloy.addRecipe(
//	ILiquidStack output, 
//	ILiquidStack[] inputs);


// Add Mana Metal
mods.tconstruct.Alloy.addRecipe(
	<liquid:mana> * 2592, 
		[
			<liquid:manyullyn> * 2592, 
			<liquid:electrum> * 1296,
			<liquid:glass> * 1296
		]);
		


//mods.tconstruct.Casting.addBasinRecipe(
//	IItemStack output, 
//	IIngredient cast, 
//	ILiquidStack fluid, 
//	int amount, 
//	@Optional boolean consumeCast,
//	@Optional int time);

mods.tconstruct.Casting.addBasinRecipe(
	<thermalfoundation:storage:8>, 
	null, 
	<liquid:mana>, 
	1296);


//mods.tconstruct.Casting.addTableRecipe(
//	IItemStack output,
//	IIngredient cast, 
//	ILiquidStack fluid, 
//	int amount,
//	@Optional boolean consumeCast,
//	@Optional int time);

// Add ingots
mods.tconstruct.Casting.addTableRecipe(
	<thermalfoundation:material:136>, 
	null, 
	<liquid:mana>, 
	144);

// Add nuggets
mods.tconstruct.Casting.addTableRecipe(
	<thermalfoundation:material:200>, 
	null, 
	<liquid:mana>, 
	16);


