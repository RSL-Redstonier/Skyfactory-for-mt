
local S = mobs.intllib


minetest.register_node("smobs_animals:pig_block", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.4375, -0.4375, 0.3125, 0.125, 0.1875},
			{0.0625, -0.5, -0.375, 0.25, -0.375, -0.1875},
			{-0.25, -0.5, -0.375, -0.0625, -0.375, -0.1875},
			{0.0625, -0.5, -0.0625, 0.25, -0.375, 0.125},
			{-0.25, -0.5, -0.0625, -0.0625, -0.375, 0.125},
			{-0.375, -0.0351278, 0.1875, 0.375, 0, 0.3125},
			{-0.1875, -0.3125, 0.375, 0.1875, -0.0625, 0.5},
			{-0.25, -0.375, 0.125, 0.25, 0.0625, 0.375},
			{-0.0625, 0, -0.471661, 0.0625, 0.0625, -0.4375},
			{0.0625, -0.125, -0.471661, 0.125, 0, -0.4375},
			{0, -0.1875, -0.471661, 0.0625, -0.125, -0.4375},
		},
	},
	tiles = {"ccmobs_pig_top.png", "ccmobs_pig_bottom.png", "ccmobs_pig_right_side.png",
    "ccmobs_pig_left_side.png", "ccmobs_pig_front.png", "ccmobs_pig_back.png"},
    groups = {not_in_creative_inventory = 1},
})

mobs:register_mob("smobs_animals:pig", {
stepheight = 0.6,
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	group_attack = true,
	owner_loyal = true,
	attack_npcs = false,
	reach = 2,
	damage = 2,
	hp_min = 5,
	hp_max = 15,
	armor = 200,
	collisionbox = {-0.25, -0.3525, -0.35, 0.25, 0.1, 0.35},
	visual = "wielditem",
	visual_size = {x = 0.65, y = 0.65},
	textures = {"smobs_animals:pig_block"},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_pig",
		attack = "mobs_pig_angry",
		death = "mobs_pig_angry",
	},
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	jump_height = 6,
	follow = {"default:apple", "farming:potato"},
	view_range = 10,
	drops = {
		{name = "mobs:pork_raw", chance = 1, min = 1, max = 3},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 2,
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

local spawn_on = {"default:dirt_with_grass"}
local spawn_by = {"group:grass"}

if minetest.get_mapgen_setting("mg_name") ~= "v6" then
	spawn_on = {"default:dirt_with_dry_grass"}
	spawn_by = {"group:dry_grass"}
end

if minetest.get_modpath("ethereal") then
	spawn_on = {"ethereal:mushroom_dirt"}
	spawn_by = {"flowers:mushroom_brown", "flowers:mushroom_brown"}
end

mobs:spawn({
	name = "smobs_animals:pig",
	nodes = spawn_on,
	neighbors = spawn_by,
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 0,
	max_height = 200,
	day_toggle = true,
})


mobs:register_egg("smobs_animals:pig", S("Pig"), "wool_pink.png", 1)

-- raw porkchop
minetest.register_craftitem(":mobs:pork_raw", {
	description = S("Raw Porkchop"),
	inventory_image = "mobs_pork_raw.png",
	on_use = minetest.item_eat(4),
	groups = {food_meat_raw = 1, food_pork_raw = 1, flammable = 2},
})

-- cooked porkchop
minetest.register_craftitem(":mobs:pork_cooked", {
	description = S("Cooked Porkchop"),
	inventory_image = "mobs_pork_cooked.png",
	on_use = minetest.item_eat(8),
	groups = {food_meat = 1, food_pork = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:pork_cooked",
	recipe = "mobs:pork_raw",
	cooktime = 5,
})
