// Add missing recipes for lights

 craftingTable.addShaped("sc_ceiling_lamp", <item:lightingfixtures:ceiling>, [
    [<item:engineersdecor:metal_bar>, <item:engineersdecor:metal_bar>, <item:engineersdecor:metal_bar>],
    [<item:tinylightbulbs:bulb>, <item:tinylightbulbs:bulb>, <item:tinylightbulbs:bulb>],
    [<item:minecraft:yellow_carpet>, <item:minecraft:yellow_carpet>, <item:minecraft:yellow_carpet>]]);

 craftingTable.addShaped("sc_led_panel", <item:lightingfixtures:le_dpanellight>, [
    [<item:engineersdecor:metal_bar>, <item:engineersdecor:metal_bar>, <item:engineersdecor:metal_bar>],
    [<item:minecraft:redstone>, <item:minecraft:quartz>, <item:minecraft:redstone>],
    [<item:minecraft:glass_pane>, <item:minecraft:glass_pane>, <item:minecraft:glass_pane>]]);

 craftingTable.addShaped("sc_elec_fluorescent_tube", <item:lightingfixtures:electronicsingletubefluorescentamps>, [
    [<item:engineersdecor:metal_bar>, <item:engineersdecor:metal_bar>, <item:engineersdecor:metal_bar>],
    [<item:minecraft:green_carpet>, <item:tinylightbulbs:bulb>, <item:minecraft:green_carpet>],
    [<item:minecraft:glass_pane>, <item:minecraft:glass_pane>, <item:minecraft:glass_pane>]]);


 craftingTable.addShaped("sc_fluorescent_gusset", <item:lightingfixtures:aluminumgusset>, [
    [<item:engineersdecor:metal_bar>, <item:engineersdecor:metal_bar>, <item:engineersdecor:metal_bar>],
    [<item:minecraft:iron_nugget>, <item:lightingfixtures:electronicsingletubefluorescentamps>, <item:minecraft:iron_nugget>],
    [<item:minecraft:glass_pane>, <item:minecraft:glass_pane>, <item:minecraft:glass_pane>]]);

 craftingTable.addShaped("sc_fluorescent_1by2", <item:lightingfixtures:fluorescentceilinglights>, [
    [<item:engineersdecor:metal_bar>, <item:engineersdecor:metal_bar>, <item:minecraft:air>],
    [<item:lightingfixtures:aluminumgusset>, <item:lightingfixtures:aluminumgusset>, <item:minecraft:air>],
    [<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>]]);

 craftingTable.addShaped("sc_fluorescent_2by2", <item:lightingfixtures:fluorescentceilinglights_2>, [
    [<item:engineersdecor:metal_bar>, <item:engineersdecor:metal_bar>, <item:minecraft:air>],
    [<item:lightingfixtures:fluorescentceilinglights>, <item:lightingfixtures:fluorescentceilinglights>, <item:minecraft:air>],
    [<item:engineersdecor:metal_bar>, <item:minecraft:air>, <item:minecraft:air>]]);

 craftingTable.addShaped("sc_fluorescent_small", <item:lightingfixtures:fluorescentceilinglights_1>, [
    [<item:minecraft:air>, <item:engineersdecor:metal_bar>, <item:minecraft:air>],
    [<item:minecraft:air>, <item:lightingfixtures:electronicdoubletubefluorescentlamps>, <item:minecraft:air>],
    [<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>]]);

 craftingTable.addShaped("sc_fluorescent_bulb_small", <item:lightingfixtures:fluorescentlightbulbs>, [
    [<item:minecraft:air>, <item:engineersdecor:metal_bar>, <item:minecraft:air>],
    [<item:minecraft:air>, <item:lightingfixtures:electronicsingletubefluorescentamps>, <item:minecraft:air>],
    [<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>]]);

 craftingTable.addShaped("sc_fluorescent_bulb_med", <item:lightingfixtures:energysavinglampmedium>, [
    [<item:minecraft:air>, <item:engineersdecor:metal_bar>, <item:minecraft:air>],
    [<item:minecraft:air>, <item:lightingfixtures:electronicsingletubefluorescentamps> * 2, <item:minecraft:air>],
    [<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>]]);

 craftingTable.addShaped("sc_fluorescent_bulb_large", <item:lightingfixtures:energysavinlamplarge>, [
    [<item:minecraft:air>, <item:engineersdecor:metal_bar>, <item:minecraft:air>],
    [<item:minecraft:air>, <item:lightingfixtures:electronicsingletubefluorescentamps> * 3, <item:minecraft:air>],
    [<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>]]);

 craftingTable.addShaped("sc_classroom_led", <item:lightingfixtures:classroom_led_lights>, [
    [<item:lightingfixtures:le_dpanellight>, <item:minecraft:air>, <item:minecraft:air>],
    [<item:minecraft:air>, <item:lightingfixtures:le_dpanellight>, <item:minecraft:air>],
    [<item:minecraft:air>, <item:minecraft:air>, <item:lightingfixtures:le_dpanellight>]]);

 craftingTable.addShaped("sc_fluorescent_tube", <item:lightingfixtures:singletubefluorescentlamps>, [
    [<item:engineersdecor:metal_bar>, <item:engineersdecor:metal_bar>, <item:engineersdecor:metal_bar>],
    [<item:minecraft:iron_nugget>, <item:tinylightbulbs:bulb>, <item:minecraft:iron_nugget>],
    [<item:minecraft:glass_pane>, <item:minecraft:glass_pane>, <item:minecraft:glass_pane>]]);

 craftingTable.addShaped("sc_fluorescent_single_double", <item:lightingfixtures:singletubefluorescentlamps_1>, [
    [<item:minecraft:air>, <item:engineersdecor:metal_bar>, <item:minecraft:air>],
    [<item:minecraft:air>, <item:lightingfixtures:singletubefluorescentlamps> * 2, <item:minecraft:air>],
    [<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>]]);

 craftingTable.addShaped("sc_fluorescent_double_tube", <item:lightingfixtures:doubletubefluorescentlamps>, [
    [<item:minecraft:air>, <item:engineersdecor:metal_bar> * 2, <item:minecraft:air>],
    [<item:minecraft:air>, <item:lightingfixtures:singletubefluorescentlamps> * 2, <item:minecraft:air>],
    [<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>]]);

 craftingTable.addShaped("sc_fluorescent_triple_tube", <item:lightingfixtures:threetubefluorescentlamp>, [
    [<item:minecraft:air>, <item:engineersdecor:metal_bar> * 3, <item:minecraft:air>],
    [<item:minecraft:air>, <item:lightingfixtures:singletubefluorescentlamps> * 3, <item:minecraft:air>],
    [<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>]]);



 craftingTable.addShapeless("sc_fluorescent_gusset_2by2", 
		<item:lightingfixtures:aluminumgusset_2_x_2>, 
		[<item:lightingfixtures:aluminumgusset> * 4]);

 craftingTable.addShapeless("sc_fluorescent_gusset_1by2", 
		<item:lightingfixtures:aluminumgusset_1_x_2>, 
		[<item:lightingfixtures:aluminumgusset> * 2]);

 craftingTable.addShapeless("sc_led_1by2", 
		<item:lightingfixtures:le_dcanopylight_1_x_2>, 
		[<item:lightingfixtures:le_dpanellight> * 2]);
		
 craftingTable.addShapeless("sc_led_2by2", 
		<item:lightingfixtures:le_dcanopylight_2_x_2>, 
		[<item:lightingfixtures:le_dpanellight> * 4]);

 craftingTable.addShapeless("sc_fluorescent_tube_double", 
		<item:lightingfixtures:electronicdoubletubefluorescentlamps>, 
		[<item:lightingfixtures:electronicsingletubefluorescentamps> * 2]);



