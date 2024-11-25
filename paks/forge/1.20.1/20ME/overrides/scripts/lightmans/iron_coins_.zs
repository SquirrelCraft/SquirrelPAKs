# Iron Coins

import crafttweaker.api.recipe.FurnaceRecipeManager;
import crafttweaker.api.recipe.BlastFurnaceRecipeManager;

# Furnace recipes for iron coins 
furnace.addRecipe("sc_std_iron_coin2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:iron_nugget>, 
  <item:lightmanscurrency:coin_iron>, 
  6, 
  400);
  
# Furnace recipes for iron coin piles (9 coins)
furnace.addRecipe("sc_std_iron_coin_piles2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:iron_ingot>, 
  <item:lightmanscurrency:coinpile_iron>, 
  62, 
  3600);
  
# Furnace recipes for iron coin block (36 coins)
furnace.addRecipe("sc_std_iron_coin_blocks2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:iron_ingot> * 4, 
  <item:lightmanscurrency:coinblock_iron>, 
  272, 
  14400);



# Blast Furnace recipes for iron coins 
blastFurnace.addRecipe("sc_blast_iron_coin2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:iron_nugget>, 
  <item:lightmanscurrency:coin_iron>, 
  2, 
  100);
  
# Blast Furnace recipes for iron coin piles (9 coins)
blastFurnace.addRecipe("sc_blast_iron_coin_piles2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:iron_ingot>, 
  <item:lightmanscurrency:coinpile_iron>, 
  14, 
  900);
  
# Blast Furnace recipes for iron coin block (36 coins)
blastFurnace.addRecipe("sc_blast_iron_coin_blocks2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:iron_ingot> * 4, 
  <item:lightmanscurrency:coinblock_iron>, 
  57, 
  3600);
