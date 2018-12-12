minetest.register_craftitem("skytest:porcelain", {
	description = "Porcelain lump",
	inventory_image = "default_clay_lump.png^[colorize:white:120",
})
minetest.register_node("skytest:porcelain_block", {
	description = "Porcelain block",
    tiles = {"default_clay.png^[colorize:white:120"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	drop = 'skytest:porcelain 4',
})
minetest.register_craft({
        output = "skytest:rawcrucible",
        recipe = {
            {"skytest:porcelain","","skytest:porcelain"},
            {"skytest:porcelain","","skytest:porcelain"},
            {"skytest:porcelain","skytest:porcelain","skytest:porcelain"},
        }
    })
minetest.register_craft({
        output = "skytest:porcelain 2",
        recipe = {
            {"default:clay_lump","default:clay_lump",""},
            {"dye:white","default:clay_lump",""},
            {"","",""},
        }
    })
	minetest.register_craft({
        output = "skytest:porcelain_block",
        recipe = {
            {"skytest:porcelain","skytest:porcelain",""},
            {"skytest:porcelain","skytest:porcelain",""},
            {"","",""},
        }
    })
		minetest.register_craft({
        output = "skytest:porcelain_block 2",
        recipe = {
            {"default:clay","default:clay",""},
            {"dye:white","default:clay",""},
            {"dye:white","dye:white","dye:white"},
        }
    })
minetest.register_craft({
	type = "cooking",
	output = "skytest:crucible",
	recipe = "skytest:rawcrucible",
})

minetest.register_node("skytest:rawcrucible", {
	description = "Raw clay crucible",
	tiles = {
		"clay.png",
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			{-0.5, -0.5, -0.5, -0.375, 0.5, 0.5},
			{-0.5, -0.5, 0.375, 0.5, 0.5, 0.5},
			{0.375, -0.5, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.375},
		},
	},
	paramtype = "light",
        is_ground_content = true,
	groups = {cracky = 3},
})
minetest.register_node("skytest:crucible", {
	description = "Fired clay crucible",
	tiles = {
		"hard_clay.png",
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			{-0.5, -0.5, -0.5, -0.375, 0.5, 0.5},
			{-0.5, -0.5, 0.375, 0.5, 0.5, 0.5},
			{0.375, -0.5, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.375},
		},
	},
	paramtype = "light",
        is_ground_content = true,
	groups = {cracky = 3},
	drop = 'skytest:crucible',
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wield_item = clicker:get_wielded_item():get_name()
        if itemstack:get_name() == "default:cobble" then
	minetest.set_node(pos, {name="skytest:crucible1_8"})
	    itemstack:take_item(1)
            return itemstack
         elseif itemstack:get_name() == "skytest:compressed_cobblestone_9c" then
	minetest.set_node(pos, {name="skytest:crucible8_8"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,

})

minetest.register_node("skytest:crucible1_8", {
	description = "",
		tiles = {
		"hard_clay.png^default_cobble.png",
		"hard_clay.png",
	},
	drawtype = "nodebox",
        node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.3125, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.375, 0.5, 0.5}, -- NodeBox4
			{-0.5, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox5
			{0.375, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox6
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox7
		},
	},
	paramtype = "light",
	drop = 'skytest:crucible',
	groups = {cracky = 3, not_in_creative_inventory = 1},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        if itemstack:get_name() == "default:cobble" then
	minetest.set_node(pos, {name="skytest:crucible2_8"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:crucible2_8", {
	description = "",
		tiles = {
		"hard_clay.png^default_cobble.png",
		"hard_clay.png",
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.1875, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.375, 0.5, 0.5}, -- NodeBox4
			{-0.5, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox5
			{0.375, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox6
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox7
		},
	},
	paramtype = "light",
	groups = {cracky = 3, not_in_creative_inventory = 1},
	sounds =  default.node_sound_wood_defaults(),
	drop = 'skytest:crucible',
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        if itemstack:get_name() == "default:cobble" then
            minetest.set_node(pos, {name="skytest:crucible3_8"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:crucible3_8", {
	description = "",
		tiles = {
		"hard_clay.png^default_cobble.png",
		"hard_clay.png",
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.0625, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.375, 0.5, 0.5}, -- NodeBox4
			{-0.5, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox5
			{0.375, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox6
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox7
		},
	},
	paramtype = "light",

	groups = {cracky = 3, not_in_creative_inventory = 1},
	sounds =  default.node_sound_wood_defaults(),
	drop = 'skytest:crucible',
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        if itemstack:get_name() == "default:cobble" then
            minetest.set_node(pos, {name="skytest:crucible4_8"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:crucible4_8", {
	description = "",
		tiles = {
		"hard_clay.png^default_cobble.png",
		"hard_clay.png",
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.0625, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.375, 0.5, 0.5}, -- NodeBox4
			{-0.5, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox5
			{0.375, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox6
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox7
		},
	},
	paramtype = "light",
	groups = {cracky = 3, not_in_creative_inventory = 1},
	sounds =  default.node_sound_wood_defaults(),
	drop = 'skytest:crucible',
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        if itemstack:get_name() == "default:cobble" then
            minetest.set_node(pos, {name="skytest:crucible5_8"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:crucible5_8", {
	description = "",
		tiles = {
		"hard_clay.png^default_cobble.png",
		"hard_clay.png",
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.1875, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.375, 0.5, 0.5}, -- NodeBox4
			{-0.5, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox5
			{0.375, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox6
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox7
		},
	},
	paramtype = "light",
	groups = {cracky = 3, not_in_creative_inventory = 1},
	sounds =  default.node_sound_wood_defaults(),
	drop = 'skytest:crucible',
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        if itemstack:get_name() == "default:cobble" then
            minetest.set_node(pos, {name="skytest:crucible6_8"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:crucible6_8", {
	description = "",
		tiles = {
		"hard_clay.png^default_cobble.png",
		"hard_clay.png",
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.3125, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.375, 0.5, 0.5}, -- NodeBox4
			{-0.5, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox5
			{0.375, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox6
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox7
		},
	},
	paramtype = "light",
	groups = {cracky = 3, not_in_creative_inventory = 1},
	sounds =  default.node_sound_wood_defaults(),
	drop = 'skytest:crucible',
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        if itemstack:get_name() == "default:cobble" then
            minetest.set_node(pos, {name="skytest:crucible7_8"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:crucible7_8", {
	description = "",
		tiles = {
		"hard_clay.png^default_cobble.png",
		"hard_clay.png",
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.375, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.375, 0.5, 0.5}, -- NodeBox4
			{-0.5, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox5
			{0.375, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox6
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox7
		},
	},
	paramtype = "light",
	groups = {cracky = 3, not_in_creative_inventory = 1},
	sounds =  default.node_sound_wood_defaults(),
	drop = 'skytest:crucible',
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        if itemstack:get_name() == "default:cobble" then
            minetest.set_node(pos, {name="skytest:crucible8_8"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:crucible8_8", {
	description = "",
		tiles = {
		"hard_clay.png^default_cobble.png",
		"hard_clay.png",
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.4375, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.375, 0.5, 0.5}, -- NodeBox4
			{-0.5, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox5
			{0.375, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox6
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox7
		},
	},
	paramtype = "light",
	drop = 'skytest:crucible',
	groups = {cracky = 3, not_in_creative_inventory = 1},
	sounds =  default.node_sound_wood_defaults(),
})
minetest.register_node("skytest:crucible_full", {
	description = "",
		tiles = {
		"hard_clay.png^default_lava.png",
		"hard_clay.png",
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.4375, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.375, 0.5, 0.5}, -- NodeBox4
			{-0.5, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox5
			{0.375, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox6
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox7
		},
	},
	paramtype = "light",
	drop = 'skytest:crucible',
	groups = {cracky = 3, not_in_creative_inventory = 1},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, player, itemstack, pointed_thing, clicker)
        if itemstack:get_name() == "bucket:bucket_empty" then
	    minetest.set_node(pos, {name="skytest:crucible"})
	    pos.y = pos.y + 0.5
	    itemstack:take_item(1)
            minetest.add_item(pos, "bucket:bucket_lava")
end
if itemstack:get_name() == "skytest:bucket_clay_empty" then
	    minetest.set_node(pos, {name="skytest:crucible"})
	    pos.y = pos.y + 0.5
	    itemstack:take_item(1)
            minetest.add_item(pos, "skytest:bucket_clay_lava")
            return itemstack
         end
    end,
})
minetest.register_abm({
	nodenames = {"skytest:crucible8_8"},
	neighbors = {},
	interval = 10,
	chance = 3,
	action = function(pos, node)
		local pos_under = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.get_node(pos_under).name == "default:torch" then
		minetest.set_node(pos, {name = "skytest:crucible_full"})
            end
	end
})
minetest.register_abm({
	nodenames = {"skytest:crucible8_8"},
	neighbors = {},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		local pos_under = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.get_node(pos_under).name == "skytest:heater" then
		minetest.set_node(pos, {name = "skytest:crucible_full"})
            end
	end
})