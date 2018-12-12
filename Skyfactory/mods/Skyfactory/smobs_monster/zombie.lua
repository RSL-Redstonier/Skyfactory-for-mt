
local S = mobs.intllib


minetest.register_node("smobs_monster:zombie_block", {
	drawtype = "nodebox",
    paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, 0.25, -0.1875, 0.125, 0.5, 0.125}, -- NodeBox1
			{-0.1875, -0.5, -0.125, 0.125, 0.25, 0.0625}, -- NodeBox2
			{0.125, 0.125, -0.125, 0.25, 0.25, 0.3125}, -- NodeBox3
			{-0.3125, 0.125, -0.125, -0.1875, 0.25, 0.3125}, -- NodeBox5
		},
	},
	tiles = {
		"smobs_zombie_top.png",
		"smobs_zombie_bottom.png",
		"smobs_zombie_right.png",
		"smobs_zombie_left.png",
		"smobs_zombie_front.png",
		"smobs_zombie_back.png"
	},
    groups = {not_in_creative_inventory = 1},
})


mobs:register_mob("smobs_monster:zombie", {
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
	collisionbox = {-0.5, -1, -0.5, 0.4, 0.9, 0.5},
	visual = "wielditem",
	textures = {"smobs_monster:zombie_block"},
	visual_size = {x = 1.0, y = 1.25},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_zombie.1",
		damage = "mobs_zombie_hit",
		attack = "mobs_zombie.3",
		death = "mobs_zombie_death",
	},
	walk_velocity = 0.5,
	run_velocity = 1.0,
	jump = true,
   	floats = 0,
	view_range = 7,
	drops = {
		{name = "smobs_monster:rotten_flesh",
		chance = 2, min = 3, max = 5,},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 2,
	fall_damage = 0,
})


mobs:spawn({
	name = "smobs_monster:zombie",
	nodes = {"default:stone", "default:dirt_with_grass"},
	max_light = 7,
	chance = 7000,
--	min_height = 0,
	day_toggle = false,
})


mobs:register_egg("smobs_monster:zombie", S("Zombie"), "default_tree_top.png", 1)

minetest.register_craftitem("smobs_monster:rotten_flesh", {
	description = S("Rotten Flesh"),
	inventory_image = "mobs_rotten_flesh.png",
	on_use = minetest.item_eat(1),
})
