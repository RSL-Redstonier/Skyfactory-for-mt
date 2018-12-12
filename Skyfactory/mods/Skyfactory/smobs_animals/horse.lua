
-- rideable horse
minetest.register_node("smobs_animals:horse_block", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.25, -0.25, 0.1875, 0.125, 0.25}, -- NodeBox1
			{-0.125, -0.5, -0.25, 0, -0.25, -0.125}, -- NodeBox2
			{0.0625, -0.5, -0.25, 0.1875, -0.25, -0.125}, -- NodeBox9
			{0, 0, -0.3125, 0.0625, 0.125, -0.25}, -- NodeBox10
			{-0.0625, -0.125, -0.375, 0.125, 0.0625, -0.3125}, -- NodeBox13
			{-0.0625, -0.25, -0.4375, 0.125, -0.0625, -0.3125}, -- NodeBox14
			{-0.0625, 0, 0.1875, 0.125, 0.1875, 0.375}, -- NodeBox15
			{0, 0.125, 0.25, 0.0625, 0.25, 0.4375}, -- NodeBox16
			{-0.0625, -0.125, 0.375, 0.125, 0.3125, 0.5}, -- NodeBox17
			{-0.0625, 0.3125, 0.375, 0, 0.375, 0.4375}, -- NodeBox18
			{0.0625, 0.3125, 0.375, 0.125, 0.375, 0.4375}, -- NodeBox19
			{-0.125, -0.5, 0.125, 0, -0.25, 0.25}, -- NodeBox14
			{0.0625, -0.5, 0.125, 0.1875, -0.1875, 0.25}, -- NodeBox15
		},
	},
	tiles = {
		"smobs_horse_top.png",
		"smobs_horse_bottom.png",
		"smobs_horse_left.png",
		"smobs_horse_right.png",
		"smobs_horse_front.png",
		"smobs_horse_back.png"
	},
    groups = {not_in_creative_inventory = 1},
})


mobs:register_mob("smobs_animals:horse", {
	type = "animal",
	visual = "wielditem",
	visual_size = {x = 1.355, y = 1.355},
	textures = {"smobs_animals:horse_block"},
	collisionbox = {-0.75, -1, -0.5, 0.75, 0.9, 0.5},
--	collisionbox = {-0.75, -1, -0.4, 0.4, 2.5, 0.4},
	fear_height = 3,
	runaway = true,
	fly = false,
	walk_chance = 60,
	view_range = 5,
	follow = {"farming:wheat", "default:apple"},
	passive = true,
	hp_min = 12,
	hp_max = 16,
	armor = 200,
	lava_damage = 5,
	fall_damage = 5,
	water_damage = 1,
	makes_footstep_sound = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 2, max = 3}
	},

	do_custom = function(self, dtime)

		-- set needed values if not already present
		if not self.v2 then
			self.v2 = 0
			self.max_speed_forward = 6
			self.max_speed_reverse = 2
			self.accel = 6
			self.terrain_type = 3
			self.driver_attach_at = {x = 1, y = 14, z = -2}
			self.driver_eye_offset = {x = 0, y = 3, z = 0}
		end

		-- if driver present allow control of horse
		if self.driver then

			mobs.drive(self, "walk", "stand", false, dtime)

			return false -- skip rest of mob functions
		end

		return true
	end,

	on_die = function(self, pos)

		-- drop saddle when horse is killed while riding
		-- also detach from horse properly
		if self.driver then
			minetest.add_item(pos, "mobs:saddle")
			mobs.detach(self.driver, {x = 1, y = 0, z = 1})
		end

		-- drop any horseshoes added
		if self.shoed then
			minetest.add_item(pos, self.shoed)
		end

	end,

	on_rightclick = function(self, clicker)

		-- make sure player is clicking
		if not clicker or not clicker:is_player() then
			return
		end

		-- feed, tame or heal horse
		if mobs:feed_tame(self, clicker, 10, true, true) then
			return
		end

		-- applying protection rune
		if mobs:protect(self, clicker) then
			return
		end

		-- make sure tamed horse is being clicked by owner only
		if self.tamed and self.owner == clicker:get_player_name() then

			local inv = clicker:get_inventory()

			-- detatch player already riding horse
			if self.driver and clicker == self.driver then

				mobs.detach(clicker, {x = 1, y = 0, z = 1})

				-- add saddle back to inventory
				if inv:room_for_item("main", "mobs:saddle") then
					inv:add_item("main", "mobs:saddle")
				else
					minetest.add_item(clicker:get_pos(), "mobs:saddle")
				end

			-- attach player to horse
			elseif not self.driver
			and clicker:get_wielded_item():get_name() == "mobs:saddle" then

				self.object:set_properties({stepheight = 1.1})
				mobs.attach(self, clicker)

				-- take saddle from inventory
				inv:remove_item("main", "mobs:saddle")
			end
		end

		-- used to capture horse with magic lasso
		mobs:capture_mob(self, clicker, 0, 0, 80, false, nil)
	end
})

mobs:spawn({
	name = "smobs_animals:horse",
	nodes = {"default:dirt_with_grass", "ethereal:dry_dirt"},
	min_light = 14,
	interval = 60,
	chance = 16000,
	min_height = 10,
	max_height = 31000,
	day_toggle = true,
})

mobs:register_egg("smobs_animals:horse", "Horse", "wool_brown.png", 1)


-- horseshoe helper function
local apply_shoes = function(name, itemstack, obj, shoes, speed, jump, reverse)

	if obj.type ~= "object" then return end

	local mob = obj.ref
	local ent = mob:get_luaentity()

	if ent and ent.name and ent.name == "smobs_animals:horse" then

		if ent.shoed then
			minetest.add_item(mob:get_pos(), ent.shoed)
		end

		ent.max_speed_forward = speed
		ent.jump_height = jump
		ent.max_speed_reverse = reverse
		ent.accel = speed
		ent.shoed = shoes

		minetest.chat_send_player(name, "Horse shoes fitted -"
				.. " speed: " .. speed
				.. " , jump height: " .. jump
				.. " , stop speed: " .. reverse)

		itemstack:take_item() ; return itemstack
	else
		minetest.chat_send_player(name, "Horse shoes only work on horses!")
	end
end


-- steel horseshoes
minetest.register_craftitem(":mobs:horseshoe_steel", {
	description = "Steel HorseShoes (use on horse to apply)",
	inventory_image = "mobs_horseshoe_steel.png",
	on_use = function(itemstack, user, pointed_thing)
		return apply_shoes(user:get_player_name(), itemstack, pointed_thing,
				"mobs:horseshoe_steel", 7, 4, 2)
	end,
})

minetest.register_craft({
	output = "mobs:horseshoe_steel",
	recipe = {
		{"", "default:steelblock", ""},
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:steel_ingot"},
	}
})

-- bronze horseshoes
minetest.register_craftitem(":mobs:horseshoe_bronze", {
	description = "Bronze HorseShoes (use on horse to apply)",
	inventory_image = "mobs_horseshoe_bronze.png",
	on_use = function(itemstack, user, pointed_thing)
		return apply_shoes(user:get_player_name(), itemstack, pointed_thing,
				"mobs:horseshoe_bronze", 7, 4, 4)
	end,
})

minetest.register_craft({
	output = "mobs:horseshoe_bronze",
	recipe = {
		{"", "default:bronzeblock", ""},
		{"default:bronze_ingot", "", "default:bronze_ingot"},
		{"default:bronze_ingot", "", "default:bronze_ingot"},
	}
})

-- mese horseshoes
minetest.register_craftitem(":mobs:horseshoe_mese", {
	description = "Mese HorseShoes (use on horse to apply)",
	inventory_image = "mobs_horseshoe_mese.png",
	on_use = function(itemstack, user, pointed_thing)
		return apply_shoes(user:get_player_name(), itemstack, pointed_thing,
				"mobs:horseshoe_mese", 9, 5, 8)
	end,
})

minetest.register_craft({
	output = "mobs:horseshoe_mese",
	recipe = {
		{"", "default:mese", ""},
		{"default:mese_crystal_fragment", "", "default:mese_crystal_fragment"},
		{"default:mese_crystal_fragment", "", "default:mese_crystal_fragment"},
	}
})

-- diamond horseshoes
minetest.register_craftitem(":mobs:horseshoe_diamond", {
	description = "Diamond HorseShoes (use on horse to apply)",
	inventory_image = "mobs_horseshoe_diamond.png",
	on_use = function(itemstack, user, pointed_thing)
		return apply_shoes(user:get_player_name(), itemstack, pointed_thing,
				"mobs:horseshoe_diamond", 10, 6, 6)
	end,
})

minetest.register_craft({
	output = "mobs:horseshoe_diamond",
	recipe = {
		{"", "default:diamondblock", ""},
		{"default:diamond", "", "default:diamond"},
		{"default:diamond", "", "default:diamond"},
	}
})

