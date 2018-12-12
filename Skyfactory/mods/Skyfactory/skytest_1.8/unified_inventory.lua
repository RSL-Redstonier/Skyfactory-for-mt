unified_inventory.register_craft_type( "skytest_press", {
    description = "Pressing",
    icon = "circut_board.png",
    width=1,
    height=2,
})
    unified_inventory.register_craft{
        type = "skytest_press",
        output = "skytest:silicon_board",  -- change here if yield updated
        items = {"skytest:silicon","skytest:board_press"}
    }
	    unified_inventory.register_craft{
        type = "skytest_press",
        output = "skytest:copper_wire",  -- change here if yield updated
        items = {"default:copper_ingot","skytest:wire_press_pattern"}
    }
	    unified_inventory.register_craft{
        type = "skytest_press",
        output = "skytest:diode",  -- change here if yield updated
        items = {"terumet:item_ceramic","skytest:diode_press"}
    }
		unified_inventory.register_craft{
        type = "skytest_press",
        output = "skytest:solder_wire",  -- change here if yield updated
        items = {"default:tin_ingot","skytest:copper_wire"}
    }
		unified_inventory.register_craft{
        type = "skytest_press",
        output = "skytest:bedrockium_board",  -- change here if yield updated
        items = {"skytest:bedrockium_ingot","skytest:advanced_chip"}
    }
	unified_inventory.register_craft_type( "skytest_assembler", {
    description = "Assembler",
    icon = "awards_craft.png",
    width=2,
    height=3,
})
		unified_inventory.register_craft{
        type = "skytest_assembler",
        output = "skytest:blank_chip",  -- change here if yield updated
        items = {"","skytest:diode","skytest:solder_wire","skytest:silicon_board","","skytest:copper_wire"}
				}
		unified_inventory.register_craft{
        type = "skytest_assembler",
        output = "skytest:basic_chip",  -- change here if yield updated
        items = {"","skytest:diode","skytest:solder_wire","skytest:blank_chip","","skytest:copper_wire"}
    }
		unified_inventory.register_craft{
        type = "skytest_assembler",
        output = "skytest:advanced_chip",  -- change here if yield updated
        items = {"","skytest:diode","skytest:solder_wire","skytest:basic_chip","","skytest:copper_wire"}
				}
		unified_inventory.register_craft{
        type = "skytest_assembler",
        output = "skytest:bedrockium_chip",  -- change here if yield updated
        items = {"","skytest:bedrockium_board","skytest:solder_wire","skytest:advanced_chip","","skytest:bedrockium_board"}
				}
    
	
	
 unified_inventory.register_craft_type("world_lc", {
    description = "Left click block on right\nWith item on left",
    icon = "awards_miniminer.png",
    width=3,
    height=1,
})
 unified_inventory.register_craft_type("world_rc", {
    description = "Right click block on right\nWith item on left",
    icon = "awards_miniminer.png",
    width=3,
    height=1,
})
 unified_inventory.register_craft_type("world_mine", {
    description = "Mine block on right\nWith item on left",
    icon = "awards_miniminer.png",
    width=3,
    height=1,
})
unified_inventory.register_craft_type( "skytest_compost", {
    description = "Composting",
    icon = "compostfull.png",
    width=1,
    height=1,
})
unified_inventory.register_craft_type( "skytest_barrel", {
    description = "Barrel",
    icon = "wooden_bucket.png",
    width=1,
    height=2,
})

minetest.register_node("skytest:allplantmatter", {
    description = "Almost all plant matter",
    drawtype = "airlike",
    walkable = false,
    pointable = false,
    diggable = true,
    climbable = false,
    buildable_to = true,
    light_source = 1,
    paramtype = light
})
    unified_inventory.register_craft{
        type = "skytest_compost",
        output = "default:dirt",  -- change here if yield updated
        items = {"skytest:allplantmatter 8"}
    }
    unified_inventory.register_craft{
        type = "skytest_barrel",
        output = "default:water",  -- change here if yield updated
        items = {"group:leaves 8","skytest:leaf_weight"}
    }
	    unified_inventory.register_craft{
        type = "skytest_barrel",
        output = "default:water",  -- change here if yield updated
        items = {"default:cactus 8","skytest:leaf_weight"}
    }
	    unified_inventory.register_craft{
        type = "world_rc",
        output = "default:clay",  -- change here if yield updated
        items = {"skytest:dust","","skytest:oak_woodcrucible_full"}
    }