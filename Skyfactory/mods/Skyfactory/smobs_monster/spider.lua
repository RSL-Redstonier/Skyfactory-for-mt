
local S = mobs.intllib


minetest.register_node("smobs_monster:spider_block", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
      {-0.1875, -0.375, -0.4375, 0.1875, 0, -0.0625}, -- NodeBox1
      {-0.125, -0.375, 0, 0.125, -0.0625, 0.375}, -- NodeBox2
      {0.0625, -0.25, 0.375, 0.125, -0.1875, 0.5}, -- NodeBox3
      {-0.125, -0.25, 0.375, -0.0625, -0.1875, 0.5}, -- NodeBox4
      {0.0625, -0.3125, 0.4375, 0.125, -0.25, 0.5}, -- NodeBox5
      {-0.125, -0.3125, 0.4375, -0.0625, -0.25, 0.5}, -- NodeBox6
      {-0.125, -0.3125, -0.0625, 0.125, -0.125, 0}, -- NodeBox7
      {-0.0625, -0.3125, -0.0625, 0.0625, -0.0625, 0}, -- NodeBox7.5
      {0.125, -0.3125, 0.25, 0.1875, -0.25, 0.3125}, -- NodeBox8
      {0.125, -0.3125, 0.1875, 0.375, -0.25, 0.25}, -- NodeBox9
      {0.125, -0.3125, 0.0625, 0.4375, -0.25, 0.125}, -- NodeBox10
      {0.125, -0.3125, 0, 0.1875, -0.25, 0.0625}, -- NodeBox11
      {0.1875, -0.3125, -0.0625, 0.25, -0.25, 0}, -- NodeBox12
      {0.25, -0.3125, -0.125, 0.3125, -0.25, -0.0625}, -- NodeBox13
      {0.3125, -0.5, -0.1875, 0.375, -0.25, -0.125}, -- NodeBox14
      {0.375, -0.5, 0.0625, 0.4375, -0.25, 0.125}, -- NodeBox15
      {0.375, -0.5, 0.1875, 0.4375, -0.25, 0.25}, -- NodeBox16
      {0.1875, -0.3125, 0.3125, 0.25, -0.25, 0.375}, -- NodeBox17
      {0.25, -0.3125, 0.375, 0.3125, -0.25, 0.4375}, -- NodeBox18
      {0.3125, -0.5, 0.4375, 0.375, -0.25, 0.5}, -- NodeBox19
      {-0.375, -0.5, 0.4375, -0.3125, -0.25, 0.5}, -- NodeBox20
      {-0.3125, -0.3125, 0.375, -0.25, -0.25, 0.4375}, -- NodeBox21
      {-0.25, -0.3125, 0.3125, -0.1875, -0.25, 0.375}, -- NodeBox22
      {-0.25, -0.3125, -0.0625, -0.1875, -0.25, 0}, -- NodeBox23
      {-0.3125, -0.3125, -0.125, -0.25, -0.25, -0.0625}, -- NodeBox24
      {-0.375, -0.5, -0.1875, -0.3125, -0.25, -0.125}, -- NodeBox25
      {-0.375, -0.3125, 0.1875, -0.125, -0.25, 0.25}, -- NodeBox26
      {-0.4375, -0.3125, 0.0625, -0.125, -0.25, 0.125}, -- NodeBox27
      {-0.4375, -0.5, 0.1875, -0.375, -0.25, 0.25}, -- NodeBox28
      {-0.4375, -0.5, 0.0625, -0.375, -0.25, 0.125}, -- NodeBox29
      {-0.1875, -0.3125, 0, -0.125, -0.25, 0.0625}, -- NodeBox30
      {-0.1875, -0.3125, 0.25, -0.125, -0.25, 0.3125}, -- NodeBox31
		},
	},
	tiles = {"nmobs_spider_tarantula_top.png", "nmobs_spider_tarantula_bottom.png", "nmobs_spider_tarantula_right.png",
    "nmobs_spider_tarantula_left.png", "nmobs_spider_tarantula_front.png", "nmobs_spider_tarantula_back.png"},
    groups = {not_in_creative_inventory = 1},
})

mobs:register_mob("smobs_monster:spider", {
	docile_by_day = true,
	group_attack = true,
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 3,
	hp_min = 20,
	hp_max = 40,
	armor = 200,
	collisionbox = {-0.9, -1.15, -0.7, 0.7, 0.2, 0.7},
	visual = "wielditem",
	textures = {"smobs_monster:spider_block"},
	visual_size = {x = 1.5, y = 1.5},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_spider",
		attack = "mobs_spider",
	},
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	view_range = 15,
	floats = 0,
	drops = {
		{name = "farming:string", chance = 1, min = 1, max = 2},
		{name = "ethereal:crystal_spike", chance = 15, min = 1, max = 2},
	},
	water_damage = 5,
	lava_damage = 5,
	light_damage = 0,
})


if minetest.get_modpath("ethereal") then
	spawn_on = "ethereal:crystal_dirt"
else
	minetest.register_alias("ethereal:crystal_spike", "default:sandstone")
end

mobs:spawn({
	name = "smobs_monster:spider",
	nodes = {"default:desert_stone", "default:desert_sand"},
	min_light = 0,
	max_light = 12,
	chance = 7000,
--	active_object_count = 1,
	min_height = -50,
	max_height = 31000,
})


mobs:register_egg("smobs_monster:spider", S("Spider"), "mobs_cobweb.png", 1)

-- cobweb
minetest.register_node(":mobs:cobweb", {
	description = S("Cobweb"),
	drawtype = "plantlike",
	visual_scale = 1.2,
	tiles = {"mobs_cobweb.png"},
	inventory_image = "mobs_cobweb.png",
	paramtype = "light",
	sunlight_propagates = true,
	liquid_viscosity = 11,
	liquidtype = "source",
	liquid_alternative_flowing = "mobs:cobweb",
	liquid_alternative_source = "mobs:cobweb",
	liquid_renewable = false,
	liquid_range = 0,
	walkable = false,
	groups = {snappy = 1, disable_jump = 1},
	drop = "farming:cotton",
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craft({
	output = "mobs:cobweb",
	recipe = {
		{"farming:string", "", "farming:string"},
		{"", "farming:string", ""},
		{"farming:string", "", "farming:string"},
	}
})
