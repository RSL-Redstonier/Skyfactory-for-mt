berries_func = {}

berries_func.octaves       = 3
berries_func.scale         = 0.001
berries_func.common_offset = 0
berries_func.common_spread = 300
berries_func.common_persist= 0.0

berries_func.growth_delay  = 200
berries_func.growth_chance = 5


local seed = minetest.get_mapgen_params().seed







--snowberry bush
minetest.register_node("skytest:snowberry", {
	description = "Snowberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png^snowberry_bush.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.set_node(pos, {name="skytest:snowberry_empty"})
		pos.y = pos.y + 0.5
		minetest.spawn_item(pos, "skytest:snowberries")
	end,
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_node("skytest:snowberry_empty", {
	description = "Snowberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_abm({
	nodenames = {"skytest:snowberry_empty"},
	neighbors = {"air"},
	interval = berries_func.growth_delay,
	chance = berries_func.growth_chance,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name = "skytest:snowberry"})
	end,
})
local snowberrybush = {}
for j=1, 3*4*3 do
	table.insert(snowberrybush, { name = "skytest:snowberry" })
end
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_snow"},
	sidelen = 16,
		noise_params = {
			offset = berries_func.common_offset, --rarity
			scale = berries_func.scale,
			spread = {x = berries_func.common_spread, y = berries_func.common_spread, z = berries_func.common_spread},
			seed = seed,
			octaves = berries_func.octaves,
			persist = berries_func.common_persist
		},
	--biomes = {"deciduous_forest"},
	--y_min = 1,
	--y_max = 50,
	schematic = {
		size = { x = 3, y = 4, z = 3},
		data = snowberrybush,
	},
	flags = "place_center_x",
})








--blueberry bush
minetest.register_node("skytest:blueberry", {
	description = "Blueberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	--visual_scale = 1.3,
	tiles = {"default_leaves.png^blueberry_bush.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.set_node(pos, {name="skytest:blueberry_empty"})
		pos.y = pos.y + 0.5
		minetest.spawn_item(pos, "skytest:blueberries")
	end,
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_node("skytest:blueberry_empty", {
	description = "Blueberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_abm({
	nodenames = {"skytest:blueberry_empty"},
	neighbors = {"air"},
	interval = berries_func.growth_delay,
	chance = berries_func.growth_chance,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name = "skytest:blueberry"})
	end,
})
local blueberrybush = {}
for j=1, 3*4*3 do
	table.insert(blueberrybush, { name = "skytest:blueberry" })
end
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
		noise_params = {
			offset = berries_func.common_offset, --rarity
			scale = berries_func.scale,
			spread = {x = berries_func.common_spread, y = berries_func.common_spread, z = berries_func.common_spread},
			seed = seed,
			octaves = berries_func.octaves,
			persist = berries_func.common_persist
		},
	--biomes = {"deciduous_forest"},
	--y_min = 1,
	y_max = 50,
	schematic = {
		size = { x = 3, y = 4, z = 3},
		data = blueberrybush,
	},
	flags = "place_center_x",
})











--raspberry bush
minetest.register_node("skytest:raspberry", {
	description = "Raspberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	--visual_scale = 1.3,
	tiles = {"default_leaves.png^raspberry_bush.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.set_node(pos, {name="skytest:raspberry_empty"})
		pos.y = pos.y + 0.5
		minetest.spawn_item(pos, "skytest:raspberries")
	end,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("skytest:raspberry_empty", {
	description = "Raspberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_abm({
	nodenames = {"skytest:raspberry_empty"},
	neighbors = {"air"},
	interval = berries_func.growth_delay,
	chance = berries_func.growth_chance,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name = "skytest:raspberry"})
	end,
})

local raspberrybush = {}
for j=1, 3*4*3 do
	table.insert(raspberrybush, { name = "skytest:raspberry" })
end
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
		noise_params = {
			offset = berries_func.common_offset, --rarity
			scale = berries_func.scale,
			spread = {x = berries_func.common_spread, y = berries_func.common_spread, z = berries_func.common_spread},
			seed = seed,
			octaves = berries_func.octaves,
			persist = berries_func.common_persist
		},
	--biomes = {"deciduous_forest"},
	--y_min = 1,
	y_max = 50,
	schematic = {
		size = { x = 3, y = 4, z = 3},
		data = raspberrybush,
	},
	flags = "place_center_x",
})













--mountainberry bush
minetest.register_node("skytest:mountainberry", {
	description = "Mountainberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	--visual_scale = 1.3,
	tiles = {"default_leaves.png^mountainberry_bush.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.set_node(pos, {name="skytest:mountainberry_empty"})
		pos.y = pos.y + 0.5
		minetest.spawn_item(pos, "skytest:mountainberries")
	end,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("skytest:mountainberry_empty", {
	description = "Mountainberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_abm({
	nodenames = {"skytest:mountainberry_empty"},
	neighbors = {"air"},
	interval = berries_func.growth_delay,
	chance = berries_func.growth_chance,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name = "skytest:mountainberry"})
	end,
})

local mountainberrybush = {}
for j=1, 3*4*3 do
	table.insert(mountainberrybush, { name = "skytest:mountainberry" })
end
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass", "default:dirt_with_snow"},
	sidelen = 16,
		noise_params = {
			offset = -0.01, --rarity
			scale = berries_func.scale,
			spread = {x = 100, y = 100, z = 100},
			seed = seed,
			octaves = 5,
			persist = 0.6
		},
	--biomes = {"deciduous_forest"},
	y_min = 50,
	y_max = 500,
	schematic = {
		size = { x = 3, y = 4, z = 3},
		data = mountainberrybush,
	},
	flags = "place_center_x",
})










--desertberry bush
minetest.register_node("skytest:desertberry", {
	description = "Desertberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	--visual_scale = 1.3,
	tiles = {"default_leaves.png^desertberry_bush.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.set_node(pos, {name="skytest:desertberry_empty"})
		pos.y = pos.y + 0.5
		minetest.spawn_item(pos, "skytest:desertberries")
	end,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("skytest:desertberry_empty", {
	description = "Desertberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_abm({
	nodenames = {"skytest:desertberry_empty"},
	neighbors = {"air"},
	interval = berries_func.growth_delay,
	chance = berries_func.growth_chance,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name = "skytest:desertberry"})
	end,
})

local desertberrybush = {}
for j=1, 3*4*3 do
	table.insert(desertberrybush, { name = "skytest:desertberry" })
end
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"skytest:desert_sand","default:dirt_with_dry_grass"},
	sidelen = 16,
		noise_params = {
			offset = berries_func.common_offset, --rarity
			scale = berries_func.scale,
			spread = {x = berries_func.common_spread, y = berries_func.common_spread, z = berries_func.common_spread},
			seed = seed,
			octaves = berries_func.octaves,
			persist = berries_func.common_persist
		},
	biomes = {"desert", "savanna"},
	--y_min = 1,
	--y_max = 50,
	schematic = {
		size = { x = 3, y = 4, z = 3},
		data = desertberrybush,
	},
	flags = "place_center_x",
})










--strawberry bush
minetest.register_node("skytest:strawberry", {
	description = "Strawberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	--visual_scale = 1.3,
	tiles = {"default_leaves.png^strawberry_bush.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.set_node(pos, {name="skytest:strawberry_empty"})
		pos.y = pos.y + 0.5
		minetest.spawn_item(pos, "skytest:strawberries")
	end,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("skytest:strawberry_empty", {
	description = "Strawberry Bush",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, flammable = 2, leaves = 1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_abm({
	nodenames = {"skytest:strawberry_empty"},
	neighbors = {"air"},
	interval = berries_func.growth_delay,
	chance = berries_func.growth_chance,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name = "skytest:strawberry"})
	end,
})
local strawberrybush = {}
for j=1, 3*4*3 do
	table.insert(strawberrybush, { name = "skytest:strawberry" })
end
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
		noise_params = {
			offset = berries_func.common_offset, --rarity
			scale = berries_func.scale,
			spread = {x = berries_func.common_spread, y = berries_func.common_spread, z = berries_func.common_spread},
			seed = seed,
			octaves = berries_func.octaves,
			persist = berries_func.common_persist
		},
	--biomes = {"deciduous_forest"},
	--y_min = 1,
	--y_max = 50,
	schematic = {
		size = { x = 3, y = 4, z = 3},
		data = strawberrybush,
	},
	flags = "place_center_x",
})


minetest.register_craftitem("skytest:snowberries", {
	description = "Snowberries",
	inventory_image = "snowberry_bush.png",
	on_use = minetest.item_eat(3),
})

minetest.register_craftitem("skytest:blueberries", {
	description = "Blueberries",
	inventory_image = "blueberry_bush.png",
	on_use = minetest.item_eat(3),
})


minetest.register_craftitem("skytest:raspberries", {
	description = "Raspberries",
	inventory_image = "raspberry_bush.png",
	on_use = minetest.item_eat(3),
})

minetest.register_craftitem("skytest:desertberries", {
	description = "Desertberries",
	inventory_image = "desertberry_bush.png",
	on_use = minetest.item_eat(3),
})


minetest.register_craftitem("skytest:mountainberries", {
	description = "Mountainberries",
	inventory_image = "mountainberry_bush.png",
	on_use = minetest.item_eat(3),
})


minetest.register_craftitem("skytest:strawberries", {
	description = "Strawberries",
	inventory_image = "strawberry_bush.png",
	on_use = minetest.item_eat(3),
})
