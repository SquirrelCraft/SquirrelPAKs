# Diamond Coins

import crafttweaker.api.recipe.FurnaceRecipeManager;
import crafttweaker.api.recipe.BlastFurnaceRecipeManager;

  
# Furnace recipes for diamond coin piles (9 coins)
furnace.addRecipe("sc_std_diamond_coin_piles2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:diamond>, 
  <item:lightmanscurrency:coinpile_diamond>, 
  162, 
  7200);
  
# Furnace recipes for diamond coin block (36 coins)
furnace.addRecipe("sc_std_diamond_coin_blocks2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:diamond> * 4, 
  <item:lightmanscurrency:coinblock_diamond>, 
  648, 
  28800);



  
# Blast Furnace recipes for diamond coin piles (9 coins)
blastFurnace.addRecipe("sc_blast_diamond_coin_piles2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:diamond>, 
  <item:lightmanscurrency:coinpile_diamond>, 
  41, 
  1800);
  
# Blast Furnace recipes for diamond coin block (36 coins)
blastFurnace.addRecipe("sc_blast_diamond_coin_blocks2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:diamond> * 4, 
  <item:lightmanscurrency:coinblock_diamond>, 
  162, 
  7200);

