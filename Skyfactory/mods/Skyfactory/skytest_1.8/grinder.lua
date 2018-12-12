minetest.register_node("skytest:heater", {
	description = "heater for crucibles",
	tiles = {
		"default_lava.png",
		"default_lava.png",
		"default_lava.png",
		"default_lava.png",
		"default_lava.png",
		"default_lava.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
		}
	},
        is_ground_content = true,
	groups = {cracky = 3},
})
minetest.register_craft({
        output = "skytest:heater",
        recipe = {
            {"","fire:flint_and_steel",""},
            {"default:furnace","skytest:machine_frame","default:furnace"},
            {"terumet:item_coil_tgol","bucket:bucket_lava","terumet:item_coil_tgol"},
        }
    })
minetest.register_craft({
        output = "skytest:presure_grinder",
        recipe = {
            {"","skytest:mese_hammer",""},
            {"skytest:shaker_motor","skytest:shaker_frame","skytest:shaker_motor"},
            {"terumet:item_ceramic","skytest:machine_frame","terumet:item_ceramic"},
        }
    })
minetest.register_node("skytest:presure_grinder", {
	description = "presure grinder",
	tiles = {
		"dsu_front.png",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.5, -0.375, 0.375, -0.4375, 0.375}, -- NodeBox17
		}
	},
        is_ground_content = true,
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wield_item = clicker:get_wielded_item():get_name()
        if itemstack:get_name() == "skytest:dust" then
	minetest.set_node(pos, {name="skytest:grinder1"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,

})

minetest.register_node("skytest:grinder1", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.5, -0.375, 0.375, -0.4375, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wield_item = clicker:get_wielded_item():get_name()
        if itemstack:get_name() == "skytest:dust" then
	minetest.set_node(pos, {name="skytest:grinder2"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:grinder2", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.5, -0.375, 0.375, -0.375, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wield_item = clicker:get_wielded_item():get_name()	
        if itemstack:get_name() == "skytest:dust" then
	minetest.set_node(pos, {name="skytest:grinder3"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:grinder3", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.5, -0.375, 0.375, -0.3125, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wield_item = clicker:get_wielded_item():get_name()
        if itemstack:get_name() == "skytest:dust" then
	minetest.set_node(pos, {name="skytest:grinder4"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:grinder4", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, -0.25, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wield_item = clicker:get_wielded_item():get_name()
        if itemstack:get_name() == "skytest:dust" then
	minetest.set_node(pos, {name="skytest:grinder5"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:grinder5", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, -0.1875, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wield_item = clicker:get_wielded_item():get_name()	
        if itemstack:get_name() == "skytest:dust" then
	minetest.set_node(pos, {name="skytest:grinder6"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:grinder6", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, -0.125, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wield_item = clicker:get_wielded_item():get_name()
        if itemstack:get_name() == "skytest:dust" then
	minetest.set_node(pos, {name="skytest:grinder7"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:grinder7", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, -0.0625, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wield_item = clicker:get_wielded_item():get_name()
        if itemstack:get_name() == "skytest:dust" then
	minetest.set_node(pos, {name="skytest:grinder8"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:grinder8", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, 0, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wield_item = clicker:get_wielded_item():get_name()
        if itemstack:get_name() == "skytest:dust" then
	minetest.set_node(pos, {name="skytest:grinder9"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:grinder9", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, 0.0625, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wield_item = clicker:get_wielded_item():get_name()
        if itemstack:get_name() == "skytest:dust" then
	minetest.set_node(pos, {name="skytest:grinder10"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:grinder10", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, 0.125, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wield_item = clicker:get_wielded_item():get_name()	
        if itemstack:get_name() == "skytest:dust" then
	minetest.set_node(pos, {name="skytest:grinder11"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:grinder11", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, 0.1875, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wield_item = clicker:get_wielded_item():get_name()
        if itemstack:get_name() == "skytest:dust" then
	minetest.set_node(pos, {name="skytest:grinder12"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:grinder12", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, 0.25, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wield_item = clicker:get_wielded_item():get_name()	
        if itemstack:get_name() == "skytest:dust" then
	minetest.set_node(pos, {name="skytest:grinder13"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:grinder13", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, 0.3125, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wield_item = clicker:get_wielded_item():get_name()	
        if itemstack:get_name() == "skytest:dust" then
	minetest.set_node(pos, {name="skytest:grinder14"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:grinder14", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, 0.375, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, clicker, itemstack)
	local inv = clicker:get_inventory()
	local wield_item = clicker:get_wielded_item():get_name()
        if itemstack:get_name() == "skytest:dust" then
	minetest.set_node(pos, {name="skytest:reverse_grinder14"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})




















minetest.register_node("skytest:reverse_grinder1", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.5, -0.375, 0.375, -0.4375, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, player, itemstack, pointed_thing, clicker)
            minetest.set_node(pos, {name="skytest:presure_grinder"})
	    pos.y = pos.y + 0.5
            minetest.add_item(pos, "skytest:powder")
    end,
})
minetest.register_node("skytest:reverse_grinder2", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.5, -0.375, 0.375, -0.375, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack)
	minetest.set_node(pos, {name="skytest:reverse_grinder1"})
    end,
})
minetest.register_node("skytest:reverse_grinder3", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.5, -0.375, 0.375, -0.3125, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, clicker, itemstack)
	minetest.set_node(pos, {name="skytest:reverse_grinder2"})
    end,
})
minetest.register_node("skytest:reverse_grinder4", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, -0.25, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, clicker, itemstack)
	minetest.set_node(pos, {name="skytest:reverse_grinder3"})
    end,
})
minetest.register_node("skytest:reverse_grinder5", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, -0.1875, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack)
	minetest.set_node(pos, {name="skytest:reverse_grinder4"})
    end,
})
minetest.register_node("skytest:reverse_grinder6", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, -0.125, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, clicker, itemstack)
	minetest.set_node(pos, {name="skytest:reverse_grinder5"})
    end,
})
minetest.register_node("skytest:reverse_grinder7", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, -0.0625, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, clicker, itemstack)
	minetest.set_node(pos, {name="skytest:reverse_grinder6"})
    end,
})
minetest.register_node("skytest:reverse_grinder8", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, 0, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, clicker, itemstack)
	minetest.set_node(pos, {name="skytest:reverse_grinder7"})
    end,
})
minetest.register_node("skytest:reverse_grinder9", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, 0.0625, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, clicker, itemstack)
	minetest.set_node(pos, {name="skytest:reverse_grinder8"})
    end,
})
minetest.register_node("skytest:reverse_grinder10", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, 0.125, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack)
	minetest.set_node(pos, {name="skytest:reverse_grinder9"})
    end,
})
minetest.register_node("skytest:reverse_grinder11", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, 0.1875, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, clicker, itemstack)
	minetest.set_node(pos, {name="skytest:reverse_grinder10"})
    end,
})
minetest.register_node("skytest:reverse_grinder12", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, 0.25, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack)
	minetest.set_node(pos, {name="skytest:reverse_grinder11"})
    end,
})
minetest.register_node("skytest:reverse_grinder13", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, 0.3125, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack)
	minetest.set_node(pos, {name="skytest:reverse_grinder12"})
    end,
})
minetest.register_node("skytest:reverse_grinder14", {
	description = "",
		tiles = {
		"dsu_front.png^default_sand.png^[colorize:white:120",
		"dsu_front.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox15
			{-0.375, -0.4375, -0.375, 0.375, 0.375, 0.375}, -- NodeBox17
		}
	},
	groups = {cracky = 3},
	sounds =  default.node_sound_wood_defaults(),	
	on_rightclick = function(pos, node, clicker, itemstack)
	minetest.set_node(pos, {name="skytest:reverse_grinder13"})
    end,
})