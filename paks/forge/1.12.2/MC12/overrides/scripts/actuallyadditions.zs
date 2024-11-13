// Actually Additions Tweaks


// Actually Additions Add to Crusher - Andesite to Beryllium + Arsenic (30%)
val oreDict_dustBeryllium = <ore:dustBeryllium>;
val oreDict_dustArsenic = <ore:dustArsenic>;
mods.actuallyadditions.Crusher.addRecipe
	(oreDict_dustBeryllium.firstItem,
	<minecraft:stone:5>,
	oreDict_dustArsenic.firstItem,
	30);



// mods.actuallyadditions.Crusher.addRecipe
//	(IItemStack output, 
//	IItemStack input,
//	@Optional IItemStack outputSecondary,
//	@Optional int outputSecondaryChance);
