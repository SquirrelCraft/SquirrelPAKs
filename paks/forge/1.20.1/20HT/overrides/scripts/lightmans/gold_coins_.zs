# Gold Coins

import crafttweaker.api.recipe.FurnaceRecipeManager;
import crafttweaker.api.recipe.BlastFurnaceRecipeManager;

# Furnace recipes for gold coins 
furnace.addRecipe("sc_std_gold_coin2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:gold_nugget>, 
  <item:lightmanscurrency:coin_gold>, 
  8, 
  400);
  
# Furnace recipes for gold coin piles (9 coins)
furnace.addRecipe("sc_std_gold_coin_piles2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:gold_ingot>, 
  <item:lightmanscurrency:coinpile_gold>, 
  79, 
  3600);
  
# Furnace recipes for gold coin block (36 coins)
furnace.addRecipe("sc_std_gold_coin_blocks2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:gold_ingot> * 4, 
  <item:lightmanscurrency:coinblock_gold>, 
  346, 
  14400);



# Blast Furnace recipes for gold coins 
blastFurnace.addRecipe("sc_blast_gold_coin2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:gold_nugget>, 
  <item:lightmanscurrency:coin_gold>, 
  2, 
  100);
  
# Blast Furnace recipes for gold coin piles (9 coins)
blastFurnace.addRecipe("sc_blast_gold_coin_piles2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:gold_ingot>, 
  <item:lightmanscurrency:coinpile_gold>, 
  18, 
  900);
  
# Blast Furnace recipes for gold coin block (36 coins)
blastFurnace.addRecipe("sc_blast_gold_coin_blocks2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:gold_ingot> * 4, 
  <item:lightmanscurrency:coinblock_gold>, 
  72, 
  3600);
