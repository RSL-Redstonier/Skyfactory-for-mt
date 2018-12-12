local modpath = minetest.get_modpath("stone")

function add_stone(name, opacity)

	minetest.register_node("stone:" .. name, {
		description = "" .. name,
		tiles = { name .. ".png"},
		groups = {cracky = 3, stone = 1},
		drop = "stone:" .. name .. "_cobble",
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_node("stone:" .. name .. "_cobble", {
		description = "" .. name .. " Cobblestone",
		tiles = { name .. ".png^(overlay_cobble.png^[opacity:64])"},
		is_ground_content = false,
		groups = {cracky = 3, stone = 2},
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_node("stone:" .. name .. "_brick", {
		description = "" .. name .. " Brick",
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = { name .. ".png^(overlay_brick.png^[opacity:" .. opacity .. "])"},
		is_ground_content = false,
		groups = {cracky = 2, stone = 1},
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_node("stone:fancy_" .. name .. "_brick", {
		description = "Fancy " .. name .. " Brick",
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = { name .. ".png^(overlay_brick_fancy.png^[opacity:" .. opacity .. "])"},
		is_ground_content = false,
		groups = {cracky = 2, stone = 1},
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_node("stone:mossy_" .. name .. "_brick", {
		description = "Mossy " .. name .. " Brick",
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = { name .. ".png^(overlay_brick.png^[opacity:" .. opacity .. "])^(overlay_moss.png^[opacity:200])"},
		is_ground_content = false,
		groups = {cracky = 2, stone = 1},
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_node("stone:" .. name .. "_block", {
		description = "" .. name .. " Block",
		tiles = { name .. ".png^(overlay_block.png^[opacity:" .. opacity .. "])"},
		is_ground_content = false,
		groups = {cracky = 2, stone = 1},
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_node("stone:mossy_" .. name .. "_cobble", {
		description = "Mossy " .. name .. " Cobblestone",
		tiles = { name .. ".png^(overlay_cobble.png^[opacity:" .. opacity .. "])^overlay_moss.png^[opacity:200]"},
		is_ground_content = false,
		groups = {cracky = 3, stone = 1},
		sounds = default.node_sound_stone_defaults(),
	})

	--Crafting

	minetest.register_craft({
		output = "stone:" .. name .. "_brick 4",
		recipe = {
			{"stone:" .. name, "stone:" .. name},
			{"stone:" .. name, "stone:" .. name},
		}
	})
node_texture_modifier.add_node_too_type("stone:" .. name, "stone")
	minetest.register_craft({
		output = "stone:fancy_" .. name .. "_brick 4",
		recipe = {
			{"stone:" .. name .. "_brick", "stone:" .. name .. "_brick"},
			{"stone:" .. name .. "_brick", "stone:" .. name .. "_brick"},
		}
	})

	minetest.register_craft({
		output = "stone:" .. name .. "_block 9",
		recipe = {
			{"stone:" .. name, "stone:" .. name, "stone:" .. name},
			{"stone:" .. name, "stone:" .. name, "stone:" .. name},
			{"stone:" .. name, "stone:" .. name, "stone:" .. name},
		}
	})

	minetest.register_craft({
		type = "cooking",
		output = "stone:" .. name,
		recipe = "stone:" .. name .. "_cobble",
	})

	--Advanced tools integration if available
	if advanced_tools then
		add_tools(name, modpath .. "/textures/" .. name .. ".png")
	end

	if stairs then
		stairs.register_stair_and_slab(
			name, 
			"stone:" .. name,
			{cracky = 3, stone = 1}, 
			{ name .. ".png"}, 
			name .. " Stair", 
			name .. " Slab", 
			default.node_sound_stone_defaults()
		)
		stairs.register_stair_and_slab(
			name .. "_cobble", 
			"stone:" .. name .. "_cobble",
			{cracky = 3, stone = 1}, 
			{ name .. ".png^(overlay_cobble.png^[opacity:64])"}, 
			name .. " Cobble Stair", 
			name .. " Cobble Slab", 
			default.node_sound_stone_defaults()
		)
		stairs.register_stair_and_slab(
			name .. "_brick", 
			"stone:" .. name .. "_brick",
			{cracky = 3, stone = 1}, 
			{ name .. ".png^(overlay_brick.png^[opacity:" .. opacity .. "])"}, 
			name .. " Brick Stair", 
			name .. " Brick Slab", 
			default.node_sound_stone_defaults()
		)
		stairs.register_stair_and_slab(
			"fancy_" .. name .. "_brick", 
			"stone:fancy_" .. name .. "_brick",
			{cracky = 3, stone = 1}, 
			{ name .. ".png^(overlay_brick_fancy.png^[opacity:" .. opacity .. "])"}, 
			"fancy " .. name .. " Brick Stair", 
			"Fancy " .. name .. " Brick Slab", 
			default.node_sound_stone_defaults()
		)
		stairs.register_stair_and_slab(
			name .. "_block", 
			"stone:" .. name .. "_block",
			{cracky = 3, stone = 1}, 
			{ name .. ".png^(overlay_block.png^[opacity:" .. opacity .. "])"}, 
			name .. " Block Stair", 
			name .. " Block Slab", 
			default.node_sound_stone_defaults()
		)
		stairs.register_stair_and_slab(
			"Mossy " .. name .. " brick", 
			"stone:mossy_" .. name .. "_brick",
			{cracky = 3, stone = 1}, 
			{ name .. ".png^(overlay_brick.png^[opacity:" .. opacity .. "])^(overlay_moss.png^[opacity:200])"}, 
			"Mossy " .. name .. " Brick Stair", 
			"Mossy " .. name .. " Brick Slab", 
			default.node_sound_stone_defaults()
		)
		stairs.register_stair_and_slab(
			"Mossy " .. name .. " Cobble", 
			"stone:mossy_" .. name .. "_cobble",
			{cracky = 3, stone = 1}, 
			{ name .. ".png^(overlay_cobble.png^[opacity:" .. opacity .. "])^overlay_moss.png^[opacity:200]"}, 
			"Mossy " .. name .. " Cobble Stair", 
			"Mossy " .. name .. " Cobble Slab", 
			default.node_sound_stone_defaults()
		)
	end

end

add_stone("slate", 16)
add_stone("granite", 128)
add_stone("sandstone", 200)
add_stone("marble", 200)
add_stone("limestone", 200)