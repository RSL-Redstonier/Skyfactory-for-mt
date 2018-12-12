minetest.register_node("qt_dimentions:dimentional_seperator_203948", {
	description = "Dimentional Seperator - If this is in your inventory, then deleate it!",
	tiles = {"dimentional_seperator.png"},
	groups = {
		dimentional_seperator = 1,
		not_in_creative_inventory = 1
	},
	sounds = nil,
	pointable = true,
	buildable_to = true,
	diggable = true,
	damage_per_second = 0,
	on_blast = function(pos, intensity)
		--this is blank, so it will not be destroyed
	end,
})

minetest.register_node("qt_dimentions:dimentional_hider_043967097", {
	description = "Dimentional hider - If this is in your inventory, then deleate it!",
	tiles = {"transperent.png"},
	groups = {
		dimentional_seperator = 1,
		not_in_creative_inventory = 1
	},
	sounds = nil,
	pointable = true,
	buildable_to = true,
	diggable = true,
	damage_per_second = 0,
	on_blast = function(pos, intensity)
		--this is blank, so it will not be destroyed
	end,
})
minetest.register_node("qt_dimentions:brilliance_stone", {
	description = "Brilliance Stone",
	tiles = {"brilliance_stone.png"},
	groups = {cracky=3, stone=1, brilliance=1},
	drop = 'qt_dimentions:brilliance_cobble',
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab("brilliance_stone", "qt_dimentions:brilliance_stone",
		{cracky = 3},
		{"brilliance_stone.png"},
		"Brilliance Stone Stair",
		"Brilliance Stone Slab",
		default.node_sound_stone_defaults())

minetest.register_node("qt_dimentions:brilliance_cobble", {
	description = "Brilliance Cobblestone",
	tiles = {"brilliance_cobble.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=2, brilliance=1},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab("brilliance_cobble", "qt_dimentions:brilliance_cobble",
		{cracky = 3},
		{"brilliance_cobble.png"},
		"Brilliance Cobblestone Stair",
		"Brilliance Cobblestone Slab",
		default.node_sound_stone_defaults())

minetest.register_node("qt_dimentions:brilliance_stonebrick", {
	description = "Brilliance Stone Brick",
	tiles = {"brilliance_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky=2, stone=1, brilliance=1},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab("brilliance_stonebrick", "qt_dimentions:brilliance_stonebrick",
		{cracky = 3},
		{"brilliance_stone_brick.png"},
		"Brilliance Stone Brick Stair",
		"Brilliance Stone Brick Slab",
		default.node_sound_stone_defaults())

minetest.register_node("qt_dimentions:brilliance_dirt", {
	description = "Brilliance Dirt",
	tiles = {"brilliance_dirt.png"},
	groups = {crumbly=3,soil=1, brilliance=1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("qt_dimentions:brilliance_dirt_with_grass", {
	description = "Brilliance Dirt with Grass",
	tiles = {"brilliance_grass.png", "brilliance_dirt.png",
		{name = "brilliance_dirt.png^brilliance_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly=3,soil=1, brilliance=1},
	drop = 'qt_dimentions:brilliance_dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.25},
	}),
})

minetest.register_node("qt_dimentions:brilliance_sand", {
	description = "Brilliance Sand",
	tiles = {"brilliance_sand.png"},
	groups = {crumbly=3, falling_node=1, sand=1, brilliance=1},
	sounds = default.node_sound_sand_defaults(),
})


minetest.register_craft({
	output = 'qt_dimentions:brilliance_stonebrick 4',
	recipe = {
		{'qt_dimentions:brilliance_stone', 'qt_dimentions:brilliance_stone'},
		{'qt_dimentions:brilliance_stone', 'qt_dimentions:brilliance_stone'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "qt_dimentions:brilliance_stone",
	recipe = "qt_dimentions:brilliance_cobble",
})

minetest.register_abm({
	nodenames = {"qt_dimentions:brilliance_dirt"},
	interval = 2,
	chance = 200,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if nodedef and (nodedef.sunlight_propagates or nodedef.paramtype == "light") and
				nodedef.liquidtype == "none" and
				(minetest.get_node_light(above) or 0) >= 13 then
				minetest.set_node(pos, {name = "qt_dimentions:brilliance_dirt_with_grass"})
		end
	end
})

minetest.register_abm({
	nodenames = {"qt_dimentions:brilliance_dirt_with_grass"},
	interval = 2,
	chance = 20,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if name ~= "ignore" and nodedef and not ((nodedef.sunlight_propagates or
				nodedef.paramtype == "light") and
				nodedef.liquidtype == "none") then
			minetest.set_node(pos, {name = "qt_dimentions:brilliance_dirt"})
		end
	end
})

minetest.register_node("qt_dimentions:brilliance_tree", {
	description = "Brilliance Tree",
	tiles = {"brilliance_tree_top.png", "brilliance_tree_top.png", "brilliance_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2, brilliance=1},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("qt_dimentions:brilliance_leaves", {
	description = "Brilliance Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.3,
	tiles = {"brilliance_leaves.png"},
	special_tiles = {"brilliance_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1, brilliance=1},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {'qt_dimentions:brilliance_sapling'},
				rarity = 20,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'qt_dimentions:brilliance_leaves'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("qt_dimentions:brilliance_wood", {
	description = "Brilliance Wooden Planks",
	tiles = {"brilliance_wood.png"},
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1, brilliance=1},
	sounds = default.node_sound_wood_defaults(),
})

stairs.register_stair_and_slab("brilliance_wood", "qt_dimentions:brilliance_wood",
		{cracky = 3},
		{"brilliance_wood.png"},
		"Brilliance Wood Stair",
		"Brilliance Wood Slab",
		default.node_sound_stone_defaults())

default.register_fence("qt_dimentions:fence_brilliance_wood", {
	description = "Brilliance Wood Fence",
	texture = "brilliance_wood_fence.png",
	material = "qt_dimentions:brilliance_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_craft({
	output = 'qt_dimentions:brilliance_wood 4',
	recipe = {
		{'qt_dimentions:brilliance_tree'},
	}
})

minetest.register_node("qt_dimentions:brilliance_sapling", {
	description = "Brilliance Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"brilliance_sapling.png"},
	inventory_image = "brilliance_sapling.png",
	wield_image = "brilliance_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1,sapling=1, brilliance=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("qt_dimentions:brilliance_sapling_instant", {
	description = "Brilliance Sapling Instant-growing",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"brilliance_sapling.png"},
	inventory_image = "brilliance_sapling.png",
	wield_image = "brilliance_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1,sapling=1, brilliance=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("qt_dimentions:brilliance_glass", {
	description = "Brilliance Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"brilliance_glass.png", "brilliance_glass_framed.png"},
	inventory_image = minetest.inventorycube("brilliance_glass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3, brilliance=1},
	sounds = default.node_sound_glass_defaults(),
})

xpanes.register_pane("brilliance_pane", {
	description = "Brilliance Glass Pane",
	textures = {"brilliance_glass.png","brilliance_glass.png","brilliance_glass_side.png"},
	inventory_image = "brilliance_glass.png",
	wield_image = "brilliance_glass.png",
	sounds = default.node_sound_glass_defaults(),
	groups = {snappy=2, cracky=3, oddly_breakable_by_hand=3, pane=1},
	recipe = {
		{"qt_dimentions:brilliance_glass", "qt_dimentions:brilliance_glass", "qt_dimentions:brilliance_glass"},
		{"qt_dimentions:brilliance_glass", "qt_dimentions:brilliance_glass", "qt_dimentions:brilliance_glass"}
	}
})

minetest.register_craft({
	type = "cooking",
	output = "qt_dimentions:brilliance_glass",
	recipe = "qt_dimentions:brilliance_sand",
})
minetest.register_node("qt_dimentions:brilliance_wildflower", {
	description = "Brilliance Wildflower",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"brilliance_wildflower.png"},
	inventory_image = "brilliance_wildflower.png",
	wield_image = "brilliance_wildflower.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flora=1,attached_node=1, brilliance=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
})