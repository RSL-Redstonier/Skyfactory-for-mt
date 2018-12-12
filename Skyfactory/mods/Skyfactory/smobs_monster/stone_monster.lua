
local S = mobs.intllib


minetest.register_node("smobs_monster:stonemonster_block", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{0.0625, -0.5, -0.125, 0.3125, -0.375, 0.125},
			{-0.3125, -0.5, -0.125, -0.0625, -0.375, 0.125},
			{0.0625, -0.375, -0.125, 0.25, -0.1875, 0.0625},
			{-0.25, -0.375, -0.125, -0.0625, -0.1875, 0.0625},
			{-0.25, -0.254703, -0.125, 0.25, 0.25, 0.0625},
			{-0.3125, -0.1875, -0.1875, 0.3125, 0.125, 0.125},
			{-0.125, 0.25, -0, 0.125, 0.375, 0.099219},
			{-0.125, 0.1875, -0.1875, 0.125, 0.4375, 0.0625},
			{-0.1875, 0.4375, -0.1875, 0.1875, 0.5, 0.157427},
			{0.125, 0.25, -0.1875, 0.1875, 0.5, 0.125},
			{-0.1875, 0.25, -0.1875, -0.125, 0.5, 0.125},
			{0.25, 0.0625, -0.1875, 0.5, 0.3125, 0.0625},
			{-0.5, 0.0625, -0.1875, -0.25, 0.3125, 0.0625},
			{0.333452, -0.25, -0.125, 0.474025, 0.0625, -0},
			{-0.474025, -0.25, -0.125, -0.339991, 0.0625, -0},
			{-0.3125, 0.0625, -0.207698, 0.3125, 0.235111, 0.154782},
			{-0.292365, -0.1875, -0.198212, 0.292365, 0.125, 0.215763},
		},
	},
	tiles = {"ccmobs_rockmonster_top.png", "ccmobs_rockmonster_bottom.png", "ccmobs_rockmonster_right_side.png",
    "ccmobs_rockmonster_left_side.png", "ccmobs_rockmonster_front.png", "ccmobs_rockmonster_back.png"},
    groups = {not_in_creative_inventory = 1},
})

mobs:register_mob("smobs_monster:stone_monster", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 2,
	damage = 3,
	hp_min = 12,
	hp_max = 35,
	armor = 80,
	collisionbox = {-1.2, -1.7, -1.2, 1.2, 1.7, 1.2},
	visual = "wielditem",
	textures = {"smobs_monster:stonemonster_block"},
	visual_size = {x = 2.0, y = 2.25},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_stonemonster",
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump_height = 0,
	stepheight = 1.1,
	floats = 0,
	view_range = 10,
	drops = {
		{name = "default:torch", chance = 2, min = 3, max = 5},
		{name = "default:iron_lump", chance = 5, min = 1, max = 2},
		{name = "default:coal_lump", chance = 3, min = 1, max = 3},
	},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
})


mobs:spawn({
	name = "smobs_monster:stone_monster",
	nodes = {"default:stone", "default:desert_stone", "default:sandstone"},
	max_light = 7,
	chance = 7000,
--	max_height = 0,
})


mobs:register_egg("smobs_monster:stone_monster", S("Stone Monster"), "default_stone.png", 1)

