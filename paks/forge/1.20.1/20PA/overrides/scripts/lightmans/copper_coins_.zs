# Copper Coins

import crafttweaker.api.recipe.FurnaceRecipeManager;
import crafttweaker.api.recipe.BlastFurnaceRecipeManager;

# Furnace recipes for copper coins 
furnace.addRecipe("sc_std_copper_coin2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:material_elements:copper_nugget>, 
  <item:lightmanscurrency:coin_copper>, 
  7, 
  200);
  
# Furnace recipes for copper coin piles (9 coins)
furnace.addRecipe("sc_std_copper_coin_piles2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:copper_ingot>, 
  <item:lightmanscurrency:coinpile_copper>, 
  69, 
  1800);
  
# Furnace recipes for copper coin block (36 coins)
furnace.addRecipe("sc_std_copper_coin_blocks2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:copper_ingot> * 4, 
  <item:lightmanscurrency:coinblock_copper>, 
  302, 
  7200);


# Blast Furnace recipes for copper coins 
blastFurnace.addRecipe("sc_blast_copper_coin2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:material_elements:copper_nugget>, 
  <item:lightmanscurrency:coin_copper>, 
  2, 
  100);
  
# Blast Furnace recipes for copper coin piles (9 coins)
blastFurnace.addRecipe("sc_blast_copper_coin_piles2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:copper_ingot>, 
  <item:lightmanscurrency:coinpile_copper>, 
  16, 
  900);
  
# Blast Furnace recipes for copper coin block (36 coins)
blastFurnace.addRecipe("sc_blast_copper_coin_blocks2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:copper_ingot> * 4, 
  <item:lightmanscurrency:coinblock_copper>, 
  63, 
  3600);