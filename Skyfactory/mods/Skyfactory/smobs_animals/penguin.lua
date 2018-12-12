
local S = mobs.intllib


minetest.register_node("smobs_animals:penguin_block", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.4375, -0.25, 0.25, 0.125, 0.1875}, -- NodeBox1
			{-0.1875, 0.125, -0.1875, 0.1875, 0.5, 0.1875}, -- NodeBox2
			{0.0625, -0.5, -0.0625, 0.1875, -0.4375, 0.25}, -- NodeBox3
			{-0.1875, -0.5, -0.0625, -0.0625, -0.4375, 0.25}, -- NodeBox4
			{-0.0625, 0.25, 0.1875, 0.0625, 0.3125, 0.3125}, -- NodeBox5
			{0.25, -0.375, -0.125, 0.3125, 0.0625, 0.125}, -- NodeBox6
			{-0.3125, -0.375, -0.125, -0.25, 0.0625, 0.125}, -- NodeBox7
		},
	},
	tiles = {
		"smobs_penguin_top.png",
		"smobs_penguin_bottom.png",
		"smobs_penguin_right.png",
		"smobs_penguin_left.png",
		"smobs_penguin_front.png",
		"smobs_penguin_back.png"
	},
    groups = {not_in_creative_inventory = 1},
})

mobs:register_mob("smobs_animals:penguin", {
stepheight = 0.6,
	type = "animal",
	passive = true,
	reach = 1,
	hp_min = 5,
	hp_max = 10,
	armor = 200,
	collisionbox = {-0.2, -0.5, -0.2,  0.2, 0.5, 0.2},
	visual = "wielditem",
	visual_size = {x = 0.66, y = 0.66},
	textures = {"smobs_animals:penguin_block"},
	sounds = {},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2,
	runaway = true,
	jump = false,
	stepheight = 1.1,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	fly_in = {"default:water_source", "default:water_flowing"},
	floats = 0,
	follow = {"ethereal:fish_raw", "mobs_fish:clownfish", "mobs_fish:tropical"},
	view_range = 5,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})


mobs:spawn({
	name = "smobs_animals:penguin",
	nodes = {"default:snowblock"},
	min_light = 14,
	interval = 60,
	chance = 20000,
	min_height = 0,
	max_height = 200,
	day_toggle = true,
})


mobs:register_egg("smobs_animals:penguin", S("Penguin"), "default_snow.png", 1)
