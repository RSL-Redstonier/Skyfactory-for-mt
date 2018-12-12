
local S = mobs.intllib

minetest.register_node("smobs_animals:bee_block", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
      {-0.0625, -0.344034, 0.3125, 0.0625, -0.220739, 0.407445}, -- NodeBox1
      {-0.0929023, -0.375, 0.1875, 0.0929023, -0.1875, 0.3125}, -- NodeBox2
      {-0.0929023, -0.375, -0.1875, 0.0929023, -0.1875, 0.125}, -- NodeBox4
      {-0.0625, -0.346023, 0.125, 0.0625, -0.220739, 0.1875}, -- NodeBox5
      --{-0.0358294, -0.3125, -0.25, 0.0338389, -0.25, -0.1875}, -- NodeBox6
      {0.0625, -0.375, 0.1875, 0.125, -0.3125, 0.3125}, -- NodeBox7
      {0.125, -0.375, 0.125, 0.1875, -0.3125, 0.1875}, -- NodeBox8
      {0.1875, -0.5, 0.0625, 0.25, -0.3125, 0.125}, -- NodeBox9
      {0.1875, -0.5, 0.3125, 0.25, -0.3125, 0.375}, -- NodeBox10
      {0.25, -0.5, 0.1875, 0.3125, -0.3125, 0.25}, -- NodeBox11
      {0.125, -0.375, 0.25, 0.1875, -0.3125, 0.3125}, -- NodeBox12
      {0.1875, -0.375, 0.1875, 0.25, -0.3125, 0.25}, -- NodeBox13
      {-0.125, -0.375, 0.1875, -0.0625, -0.3125, 0.3125}, -- NodeBox14
      {-0.1875, -0.375, 0.125, -0.125, -0.3125, 0.1875}, -- NodeBox15
      {-0.25, -0.5, 0.0625, -0.1875, -0.3125, 0.125}, -- NodeBox16
      {-0.25, -0.5, 0.3125, -0.1875, -0.3125, 0.375}, -- NodeBox17
      {-0.3125, -0.5, 0.1875, -0.25, -0.3125, 0.25}, -- NodeBox18
      {-0.25, -0.375, 0.1875, -0.1875, -0.3125, 0.25}, -- NodeBox19
      {-0.1875, -0.375, 0.25, -0.125, -0.3125, 0.3125}, -- NodeBox20
      {-0.4375, -0.1875, 0.125, -0.125, -0.125, 0.25}, -- NodeBox21
      {0.125, -0.1875, 0.125, 0.4375, -0.125, 0.25}, -- NodeBox22
		},
	},
	tiles = {"nmobs_bee_top.png", "nmobs_bee_bottom.png", "nmobs_bee_right.png",
    "nmobs_bee_left.png", "nmobs_bee_front.png", "nmobs_bee_back.png"},
    groups = {not_in_creative_inventory = 1},
})

mobs:register_mob("smobs_animals:bee", {
	type = "animal",
	passive = true,
	hp_min = 1,
	hp_max = 2,
	armor = 200,
	collisionbox = {-0.2, -0.61, -0.2, 0.2, 0.1, 0.2},
	visual = "wielditem",
	visual_size = {x = 0.2, y = 0.2},
	textures = {"smobs_animals:bee_block"},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_bee",
	},	
	walk_velocity = 1,
	jump = true,
	drops = {
		{name = "mobs:honey", chance = 2, min = 1, max = 2},
	},
	water_damage = 2,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 0,
	fall_speed = -3,
	on_rightclick = function(self, clicker)
		mobs:capture_mob(self, clicker, 50, 90, 0, true, "smobs_animals:bee")
	end,
--	after_activate = function(self, staticdata, def, dtime)
--		print ("------", self.name, dtime, self.health)
--	end,
})

mobs:spawn({
	name = "smobs_animals:bee",
	nodes = {"group:flower"},
	min_light = 14,
	interval = 60,
	chance = 7000,
	min_height = 3,
	max_height = 200,
	day_toggle = true,
})

mobs:register_egg("smobs_animals:bee", S("Bee"), "mobs_bee_inv.png", 0)

-- honey
minetest.register_craftitem(":mobs:honey", {
	description = S("Honey"),
	inventory_image = "mobs_honey_inv.png",
	on_use = minetest.item_eat(4),
	groups = {food_honey = 1, food_sugar = 1, flammable = 1},
})

-- beehive (when placed spawns bee)
minetest.register_node(":mobs:beehive", {
	description = S("Beehive"),
	drawtype = "plantlike",
	tiles = {"mobs_beehive.png"},
	inventory_image = "mobs_beehive.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = true,
	groups = {oddly_breakable_by_hand = 3, flammable = 1},
	sounds = default.node_sound_defaults(),

	on_construct = function(pos)

		local meta = minetest.get_meta(pos)

		meta:set_string("formspec", "size[8,6]"
			..default.gui_bg..default.gui_bg_img..default.gui_slots
			.. "image[3,0.8;0.8,0.8;mobs_bee_inv.png]"
			.. "list[current_name;beehive;4,0.5;1,1;]"
			.. "list[current_player;main;0,2.35;8,4;]"
			.. "listring[]")

		meta:get_inventory():set_size("beehive", 1)
	end,

	after_place_node = function(pos, placer, itemstack)

		if placer and placer:is_player() then

			minetest.set_node(pos, {name = "mobs:beehive", param2 = 1})

			if math.random(1, 4) == 1 then
				minetest.add_entity(pos, "smobs_animals:bee")
			end
		end
	end,

	on_punch = function(pos, node, puncher)

		-- yep, bee's don't like having their home punched by players
		puncher:set_hp(puncher:get_hp() - 4)
	end,

	allow_metadata_inventory_put = function(pos, listname, index, stack, player)

		if listname == "beehive" then
			return 0
		end

		return stack:get_count()
	end,

	can_dig = function(pos,player)

		local meta = minetest.get_meta(pos)

		-- only dig beehive if no honey inside
		return meta:get_inventory():is_empty("beehive")
	end,

})

minetest.register_craft({
	output = "mobs:beehive",
	recipe = {
		{"mobs:bee","mobs:bee","mobs:bee"},
	}
})

-- honey block
minetest.register_node(":mobs:honey_block", {
	description = S("Honey Block"),
	tiles = {"mobs_honey_block.png"},
	groups = {snappy = 3, flammable = 2},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_craft({
	output = "mobs:honey_block",
	recipe = {
		{"mobs:honey", "mobs:honey", "mobs:honey"},
		{"mobs:honey", "mobs:honey", "mobs:honey"},
		{"mobs:honey", "mobs:honey", "mobs:honey"},
	}
})

minetest.register_craft({
	output = "mobs:honey 9",
	recipe = {
		{"mobs:honey_block"},
	}
})

-- beehive workings
minetest.register_abm({
	nodenames = {"mobs:beehive"},
	interval = 6,
	chance = 6,
	catch_up = false,
	action = function(pos, node)

		-- bee's only make honey during the day
		local tod = (minetest.get_timeofday() or 0) * 24000

		if tod < 5500 or tod > 18500 then
			return
		end

		-- is hive full?
		local meta = minetest.get_meta(pos)
		if not meta then return end -- for older beehives
		local inv = meta:get_inventory()
		local honey = inv:get_stack("beehive", 1):get_count()

		-- is hive full?
		if honey > 19 then
			return
		end

		-- no flowers no honey, nuff said!
		if #minetest.find_nodes_in_area_under_air(
			{x = pos.x - 4, y = pos.y - 3, z = pos.z - 4},
			{x = pos.x + 4, y = pos.y + 3, z = pos.z + 4},
			"group:flower") > 3 then

			inv:add_item("beehive", "mobs:honey")
		end
	end
})
