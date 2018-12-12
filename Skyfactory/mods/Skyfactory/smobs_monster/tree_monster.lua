
local S = mobs.intllib


minetest.register_node("smobs_monster:treemonster_block", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{0.1875, -0.5, -0.1875, 0.25, 0.5, 0.1875},
			{-0.25, -0.5, -0.1875, -0.1875, 0.5, 0.1875},
			{0.125, 0.3125, 0.1875, 0.1875, 0.5, 0.25},
			{-0.125, 0.25, 0.1875, -0.0625, 0.5, 0.25},
			{-0.1875, 0.3125, 0.1875, -0.125, 0.5, 0.25},
			{0.0625, 0.25, 0.1875, 0.125, 0.5, 0.25},
			{-0.0625, 0.0625, 0.1875, 0.0625, 0.5, 0.25},
			{-0.1875, 0, 0.1875, 0.1875, 0.125, 0.25},
			{-0, -0.5, 0.1875, 0.0625, -0.3125, 0.25},
			{-0.0625, -0.0625, 0.1875, -0, 0, 0.25},
			{0.0625, -0.1875, 0.1875, 0.125, 0, 0.25},
			{0.125, -0.5, 0.1875, 0.1875, -0.25, 0.25},
			{-0.125, -0.5, 0.1875, -0.0625, -0.3125, 0.25},
			{-0.125, -0.1875, 0.1875, -0.0625, 0, 0.25},
			{0.125, -0.125, 0.1875, 0.1875, 0, 0.25},
			{-0.1875, -0.5, 0.1875, 0.1875, -0.375, 0.25},
			{-0.1875, -0.125, 0.1875, -0.125, 0, 0.25},
			{-0.1875, -0.5, 0.1875, -0.125, -0.1875, 0.25},
			{-0.1875, -0.5, -0.25, 0.1875, 0.5, -0.1875},
			{-0.1875, -0.5, -0.1875, 0.1875, 0.4375, 0.1875},
		},
	},
	tiles = {"ccmobs_treemonster_top.png", "ccmobs_treemonster_top.png", "ccmobs_treemonster_sides.png",
    "ccmobs_treemonster_sides.png", "ccmobs_treemonster_front.png", "ccmobs_treemonster_sides.png"},
    groups = {not_in_creative_inventory = 1},
})


mobs:register_mob("smobs_monster:tree_monster", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	attack_animals = true,
	--specific_attack = {"player", "mobs_animal:chicken"},
	reach = 2,
	damage = 2,
	hp_min = 7,
	hp_max = 33,
	armor = 100,
--	collisionbox = {-0.4, -1, -0.4, 0.4, 0.8, 0.4},
	collisionbox = {-0.8, -1.725, -0.8, 0.85, 1.65, 0.85},
	visual = "wielditem",
	textures = {"smobs_monster:treemonster_block"},
	visual_size = {x = 2.0, y = 2.25},
	blood_texture = "default_wood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_treemonster",
	},
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	view_range = 15,
	drops = {
		{name = "default:sapling", chance = 3, min = 1, max = 2},
		{name = "default:junglesapling", chance = 3, min = 1, max = 2},
		{name = "default:apple", chance = 2, min = 1, max=3},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 2,
	fall_damage = 0,
})


mobs:spawn({
	name = "smobs_monster:tree_monster",
	nodes = {"default:leaves", "default:jungleleaves", "default:pine_needles"},
	max_light = 7,
	chance = 7000,
	min_height = 0,
	day_toggle = false,
})


mobs:register_egg("smobs_monster:tree_monster", S("Tree Monster"), "default_tree_top.png", 1)
