# netherite Coins

import crafttweaker.api.recipe.FurnaceRecipeManager;
import crafttweaker.api.recipe.BlastFurnaceRecipeManager;

# Furnace recipes for netherite coins 
furnace.addRecipe("sc_std_netherite_coin2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:material_elements:netherite_nugget>, 
  <item:lightmanscurrency:coin_netherite>, 
  20, 
  1200);
  
# Furnace recipes for netherite coin piles (9 coins)
furnace.addRecipe("sc_std_netherite_coin_piles2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:netherite_ingot>, 
  <item:lightmanscurrency:coinpile_netherite>, 
  198, 
  10800);
  
# Furnace recipes for netherite coin block (36 coins)
furnace.addRecipe("sc_std_netherite_coin_blocks2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:netherite_ingot> * 4, 
  <item:lightmanscurrency:coinblock_netherite>, 
  864, 
  43200);



# Blast Furnace recipes for netherite coins 
blastFurnace.addRecipe("sc_blast_netherite_coin2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:material_elements:netherite_nugget>, 
  <item:lightmanscurrency:coin_netherite>, 
  5, 
  300);
  
# Blast Furnace recipes for netherite coin piles (9 coins)
blastFurnace.addRecipe("sc_blast_netherite_coin_piles2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:netherite_ingot>, 
  <item:lightmanscurrency:coinpile_netherite>, 
  45, 
  2700);
  
# Blast Furnace recipes for netherite coin block (36 coins)
blastFurnace.addRecipe("sc_blast_netherite_coin_blocks2nugs", 
  <constant:minecraft:recipe/category/cooking:misc>, 
  <item:minecraft:netherite_ingot> * 4, 
  <item:lightmanscurrency:coinblock_netherite>, 
  180, 
  10800);
