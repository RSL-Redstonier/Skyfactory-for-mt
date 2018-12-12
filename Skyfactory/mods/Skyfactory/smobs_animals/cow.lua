
local S = mobs.intllib

minetest.register_node("smobs_animals:cow_block", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.25, -0.4375, 0.3125, 0.4375, 0.25},
			{-0.25, -0.5, 0, -0.0625, -0.25, 0.1875},
			{0.0625, -0.5, 0, 0.25, -0.25, 0.1875},
			{-0.25, -0.5, -0.375, -0.0625, -0.25, -0.1875},
			{0.0625, -0.5, -0.375, 0.25, -0.25, -0.1875},
			{-0.3125, 0.3125, 0.25, 0.3125, 0.375, 0.375},
			{-0.1875, 0.0625, -0.1875, 0.1875, 0.375, 0.25},
			{-0.0625, -0.1875, 0.0625, 0.0625, -0.125, 0.25},
			{-0.1875, 0.0625, 0.25, 0.1875, 0.3125, 0.5},
			{-0.0625, -0.0625, -0.5, 0.0625, 0.3125, -0.4375},
			{-0.1875, 0.125, 0.25, 0.1875, 0.4375, 0.4375},
			{-0.0625, 0, 0.1875, 0.0625, 0.0625, 0.4375},
			{-0.0625, -0.0625, 0.1875, 0.0625, 0, 0.375},
			{0.0625, 0.4375, 0.3125, 0.125, 0.5, 0.375},
			{-0.125, 0.4375, 0.3125, -0.0625, 0.5, 0.375},
			{-0.0625, -0.125, 0.1875, 0.0625, -0.0625, 0.3125},
		},
	},
	tiles = {"ccmobs_cow_top.png", "ccmobs_cow_bottom.png", "ccmobs_cow_right_side.png",
    "ccmobs_cow_left_side.png", "ccmobs_cow_front.png", "ccmobs_cow_back.png"},
    groups = {not_in_creative_inventory = 1},
})

mobs:register_mob("smobs_animals:cow", {
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	attack_npcs = false,
	reach = 2,
	damage = 4,
	hp_min = 5,
	hp_max = 20,
	armor = 200,
	collisionbox = {-0.9, -1, -1, 0.9, 0.9, 1},
	visual = "wielditem",
	visual_size = {x = 1.355, y = 1.355},
	textures = {"smobs_animals:cow_block"},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_cow",
		death = "mobs_cow",
        
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	jump_height = 6,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 3},
		{name = "mobs:leather", chance = 1, min = 1, max = 2},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	follow = "farming:wheat",
	view_range = 8,
	replace_rate = 10,
--	replace_what = {"default:grass_3", "default:grass_4", "default:grass_5", "farming:wheat_8"},
	replace_what = {
		{"group:grass", "air", 0},
		{"default:dirt_with_grass", "default:dirt", -1}
	},
	replace_with = "air",
	fear_height = 2,
	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 60, false, nil) then return end

		local tool = clicker:get_wielded_item()
		local name = clicker:get_player_name()

		-- milk cow with empty bucket
		if tool:get_name() == "bucket:bucket_empty" then

			--if self.gotten == true
			if self.child == true then
				return
			end

			if self.gotten == true then
				minetest.chat_send_player(name,
					S("Cow already milked!"))
				return
			end

			local inv = clicker:get_inventory()

			inv:remove_item("main", "bucket:bucket_empty")

			if inv:room_for_item("main", {name = "mobs:bucket_milk"}) then
				clicker:get_inventory():add_item("main", "mobs:bucket_milk")
			else
				local pos = self.object:get_pos()
				pos.y = pos.y + 0.5
				minetest.add_item(pos, {name = "mobs:bucket_milk"})
			end

			self.gotten = true -- milked

			return
		end
	end,
})


mobs:spawn({
	name = "mobs_animal:cow",
	nodes = {"default:dirt_with_grass", "ethereal:green_dirt"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 5,
	max_height = 200,
	day_toggle = true,
})


mobs:register_egg("smobs_animals:cow", S("Cow"), "default_grass.png", 1)

-- bucket of milk
minetest.register_craftitem(":mobs:bucket_milk", {
	description = S("Bucket of Milk"),
	inventory_image = "mobs_bucket_milk.png",
	stack_max = 1,
	on_use = minetest.item_eat(8, 'bucket:bucket_empty'),
	groups = {food_milk = 1, flammable = 3},
})

-- butter
minetest.register_craftitem(":mobs:butter", {
	description = S("Butter"),
	inventory_image = "mobs_butter.png",
	on_use = minetest.item_eat(1),
	groups = {food_butter = 1, flammable = 2},
})

if minetest.get_modpath("farming") and farming and farming.mod then
minetest.register_craft({
	type = "shapeless",
	output = "mobs:butter",
	recipe = {"mobs:bucket_milk", "farming:salt"},
	replacements = {{ "mobs:bucket_milk", "bucket:bucket_empty"}}
})
else -- some saplings are high in sodium so makes a good replacement item
minetest.register_craft({
	type = "shapeless",
	output = "mobs:butter",
	recipe = {"mobs:bucket_milk", "default:sapling"},
	replacements = {{ "mobs:bucket_milk", "bucket:bucket_empty"}}
})
end

-- cheese wedge
minetest.register_craftitem(":mobs:cheese", {
	description = S("Cheese"),
	inventory_image = "mobs_cheese.png",
	on_use = minetest.item_eat(4),
	groups = {food_cheese = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:cheese",
	recipe = "mobs:bucket_milk",
	cooktime = 5,
	replacements = {{ "mobs:bucket_milk", "bucket:bucket_empty"}}
})

-- cheese block
minetest.register_node(":mobs:cheeseblock", {
	description = S("Cheese Block"),
	tiles = {"mobs_cheeseblock.png"},
	is_ground_content = false,
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults()
})

minetest.register_craft({
	output = "mobs:cheeseblock",
	recipe = {
		{'mobs:cheese', 'mobs:cheese', 'mobs:cheese'},
		{'mobs:cheese', 'mobs:cheese', 'mobs:cheese'},
		{'mobs:cheese', 'mobs:cheese', 'mobs:cheese'},
	}
})

minetest.register_craft({
	output = "mobs:cheese 9",
	recipe = {
		{'mobs:cheeseblock'},
	}
})
