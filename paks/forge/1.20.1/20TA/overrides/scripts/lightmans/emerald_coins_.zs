# Emerald Coins

import crafttweaker.api.recipe.FurnaceRecipeManager;
import crafttweaker.api.recipe.BlastFurnaceRecipeManager;


  
# Furnace recipes for emerald coin piles (9 coins)
furnace.addRecipe("sc_std_emerald_coin_piles2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:emerald>, 
  <item:lightmanscurrency:coinpile_emerald>, 
  108, 
  7200);
  
# Furnace recipes for emerald coin block (36 coins)
furnace.addRecipe("sc_std_emerald_coin_blocks2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:emerald> * 4, 
  <item:lightmanscurrency:coinblock_emerald>, 
  432, 
  28800);



  
# Blast Furnace recipes for emerald coin piles (9 coins)
blastFurnace.addRecipe("sc_blast_emerald_coin_piles2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:emerald>, 
  <item:lightmanscurrency:coinpile_emerald>, 
  27, 
  1800);
  
# Blast Furnace recipes for emerald coin block (36 coins)
blastFurnace.addRecipe("sc_blast_emerald_coin_blocks2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:emerald> * 4, 
  <item:lightmanscurrency:coinblock_emerald>, 
  108, 
  7200);
