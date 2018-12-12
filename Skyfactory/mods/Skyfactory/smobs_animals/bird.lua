
local S = mobs.intllib


minetest.register_node("smobs_animals:bird_block", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.25, -0.1875, 0.125, -0.125, 0.125}, -- NodeBox1
			{-0.0625, -0.125, 0.0625, 0.125, 0.0625, 0.25}, -- NodeBox2
			{0, -0.0625, 0.25, 0.0625, 0, 0.3125}, -- NodeBox3
			{-0.3125, -0.1875, -0.125, -0.0625, -0.125, 0.0625}, -- NodeBox5
			{0.125, -0.1875, -0.125, 0.375, -0.125, 0.0625}, -- NodeBox6
			{-0.0625, -0.125, -0.375, 0.125, -0.0625, -0.1875}, -- NodeBox7
			{-0.0625, -0.3125, -0.125, 0.125, -0.25, 0.0625}, -- NodeBox8
		},
	},
	tiles = {
		"smobs_bird_top.png",
		"smobs_bird_bottom.png",
		"smobs_bird_right.png",
		"smobs_bird_left.png",
		"smobs_bird_front.png",
		"smobs_bird_back.png"
	},
    groups = {not_in_creative_inventory = 1},
})

mobs:register_mob("smobs_animals:bird", {
--stepheight = 0.6,
	type = "animal",
	passive = true,
	reach = 1,
	hp_min = 5,
	hp_max = 10,
	armor = 200,
	collisionbox = {-0.4, -0.4, -0.4,  0.4, 0.4, 0.4},
	visual = "wielditem",
	visual_size = {x = 0.66, y = 0.66},
	textures = {"smobs_animals:bird_block"},
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 4,
	run_velocity = 6,
    walk_chance = 99,
	runaway = true,
	jump = false,
    sounds = {
        distance = 20,
--		random = {"canary",
--                "crow",
--                "peacock"},
        random = "canary",
	},	

--	stepheight = 1.1,
	drops = {
		{name = "mobs:chicken_raw", chance = 1, min = 2, max = 2},
		{name = "mobs:chicken_feather", chance = 3, min = 1, max = 2},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
--	fear_height = 2,
	fly_in = {"air"},
	fall_speed = 0,
	stepheight = 3,
	fly = true,
	floats = 0,
	follow = {"farming:seed_wheat", "farming:seed_cotton"},
	view_range = 14,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})


mobs:spawn({
	name = "smobs_animals:bird",
	nodes = {"air"},
	min_light = 10,
	chance = 700,
	min_height = 30,
	day_toggle = false,
})


mobs:register_egg("smobs_animals:bird", S("Bird"), "default_snow.png", 1)
