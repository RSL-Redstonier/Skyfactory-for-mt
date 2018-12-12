
local S = mobs.intllib

minetest.register_node("smobs_animals:sheep_shaved", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.35225, -0.375, 0.25, 0.125, 0.1875},
			{-0.1875, -0.207206, 0.125, 0.1875, 0.0207206, 0.375},
			{-0.25, -0.0625, 0.1875, 0.25, 0.06, 0.3125},
			{-0.125, -0.3125, 0.3125, 0.125, 0.08995, 0.5},
			{-0.0625, -0.1875, -0.4375, 0.0625, 0.0625, -0.375},
			{-0.25, -0.5, -0.375, -0.0625, -0.25, -0.1875},
			{0.0625, -0.5, -0.375, 0.25, -0.25, -0.1875},
			{-0.25, -0.5, -0.0625, -0.0625, -0.25, 0.125},
			{0.0625, -0.5, -0.0625, 0.25, -0.25, 0.125},
		},
	},
	tiles = {"ccmobs_sheep_shaved_top.png", "ccmobs_sheep_bottom.png", "ccmobs_sheep_shaved_right_side.png",
    "ccmobs_sheep_shaved_left_side.png", "ccmobs_sheep_shaved_front.png", "ccmobs_sheep_shaved_back.png"},
    groups = {not_in_creative_inventory = 1},
})


local all_colours = {
	{"black",      S("Black"),      "#000000b0"},
	{"blue",       S("Blue"),       "#015dbb70"},
	{"brown",      S("Brown"),      "#663300a0"},
	{"cyan",       S("Cyan"),       "#01ffd870"},
	{"dark_green", S("Dark Green"), "#005b0770"},
	{"dark_grey",  S("Dark Grey"),  "#303030b0"},
	{"green",      S("Green"),      "#61ff0170"},
	{"grey",       S("Grey"),       "#5b5b5bb0"},
	{"magenta",    S("Magenta"),    "#ff05bb70"},
	{"orange",     S("Orange"),     "#ff840170"},
	{"pink",       S("Pink"),       "#ff65b570"},
	{"red",        S("Red"),        "#ff0000a0"},
	{"violet",     S("Violet"),     "#2000c970"},
	{"white",      S("White"),      "#abababc0"},
	{"yellow",     S("Yellow"),     "#e3ff0070"},
}


-- Sheep by PilzAdam, texture converted to minetest by AMMOnym from Summerfield pack

for _, col in ipairs(all_colours) do

    minetest.register_node("smobs_animals:sheep_block_"..col[1], {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.35225, -0.375, 0.25, 0.125, 0.1875},
			{-0.1875, -0.207206, 0.125, 0.1875, 0.0207206, 0.375},
			{-0.25, -0.0625, 0.1875, 0.25, 0.06, 0.3125},
			{-0.125, -0.3125, 0.3125, 0.125, 0.08995, 0.5},
			{-0.0625, -0.1875, -0.4375, 0.0625, 0.0625, -0.375},
			{-0.25, -0.5, -0.375, -0.0625, -0.25, -0.1875},
			{0.0625, -0.5, -0.375, 0.25, -0.25, -0.1875},
			{-0.25, -0.5, -0.0625, -0.0625, -0.25, 0.125},
			{0.0625, -0.5, -0.0625, 0.25, -0.25, 0.125},
		},
	},
	tiles = {"ccmobs_sheep_top.png^(ccmobs_sheep_top_wool.png^[colorize:" .. col[3] .. ")", 
            "ccmobs_sheep_bottom.png^(ccmobs_sheep_bottom_wool.png^[colorize:" .. col[3] .. ")", 
            "ccmobs_sheep_right_side.png^(ccmobs_sheep_right_side_wool.png^[colorize:" .. col[3] .. ")",
            "ccmobs_sheep_left_side.png^(ccmobs_sheep_left_side_wool.png^[colorize:" .. col[3] .. ")", 
            "ccmobs_sheep_front.png^(ccmobs_sheep_front_wool.png^[colorize:" .. col[3] .. ")", 
            "ccmobs_sheep_back.png^(ccmobs_sheep_back_wool.png^[colorize:" .. col[3] .. ")"},
    groups = {not_in_creative_inventory = 1},
})


	mobs:register_mob("smobs_animals:sheep_"..col[1], {
stepheight = 0.6,
		type = "animal",
		passive = true,
		hp_min = 8,
		hp_max = 10,
		armor = 200,
        collisionbox = {-0.525, -0.585, -0.525, 0.525, 0.325, 0.525},
        visual = "wielditem",
        visual_size = {x=0.75, y=0.75},
        textures = {"smobs_animals:sheep_block_"..col[1]},
		makes_footstep_sound = true,
		sounds = {
			random = "mobs_sheep",
			death = "mobs_sheep",
		},
		walk_velocity = 1,
		run_velocity = 2,
		runaway = true,
		jump = true,
		jump_height = 6,
		drops = {
			{name = "mobs:mutton_raw", chance = 1, min = 1, max = 2},
			{name = "wool:"..col[1], chance = 1, min = 1, max = 1},
		},
		water_damage = 1,
		lava_damage = 5,
		light_damage = 0,
		follow = {"farming:wheat", "default:grass_5"},
		view_range = 8,
		replace_rate = 10,
		replace_what = {"default:grass_3", "default:grass_4", "default:grass_5", "farming:wheat_8"},
		replace_with = "air",
		replace_offset = -1,
		fear_height = 3,
--[[
		on_replace = function(self, pos, oldnode, newnode)
			print ("---- replaced") ; return false -- false to keep node, true to replace
		end,
]]
		on_rightclick = function(self, clicker)

			--are we feeding?
			if mobs:feed_tame(self, clicker, 8, true, true) then

				--if full grow fuzz
				if self.gotten == false then

					self.object:set_properties({
                        textures = {"smobs_animals:sheep_shaved"},
					})
				end

				return
			end

			local item = clicker:get_wielded_item()
			local itemname = item:get_name()
			local name = clicker:get_player_name()

			--are we giving a haircut>
			if itemname == "mobs:shears" then

				if self.gotten ~= false
				or self.child ~= false
				or name ~= self.owner
				or not minetest.get_modpath("wool") then
					return
				end

				self.gotten = true -- shaved

				local obj = minetest.add_item(
					self.object:get_pos(),
					ItemStack( "wool:" .. col[1] .. " " .. math.random(1, 3) )
				)

				if obj then

					obj:setvelocity({
						x = math.random(-1, 1),
						y = 5,
						z = math.random(-1, 1)
					})
				end

				item:add_wear(650) -- 100 uses

				clicker:set_wielded_item(item)

				self.object:set_properties({
                        textures = {"smobs_animals:sheep_shaved"},
				})

				return
			end

			--are we coloring?
			if itemname:find("dye:") then

				if self.gotten == false
				and self.child == false
				and self.tamed == true
				and name == self.owner then

					local colr = string.split(itemname, ":")[2]

					for _,c in pairs(all_colours) do

						if c[1] == colr then

							local pos = self.object:get_pos()

							self.object:remove()

							local mob = minetest.add_entity(pos, "smobs_animals:sheep_" .. colr)
							local ent = mob:get_luaentity()

							ent.owner = name
							ent.tamed = true

							-- take item
							if not mobs.is_creative(clicker:get_player_name()) then
								item:take_item()
								clicker:set_wielded_item(item)
							end

							break
						end
					end
				end

				return
			end

			-- protect mod with mobs:protector item
			if mobs:protect(self, clicker) then return end

			--are we capturing?
			if mobs:capture_mob(self, clicker, 0, 5, 60, false, nil) then return end
		end
	})

	mobs:register_egg("smobs_animals:sheep_"..col[1], S("@1 Sheep", col[2]), "wool_"..col[1]..".png", 1)

end


mobs:spawn({
	name = "smobs_animals:sheep_white",
	nodes = {"default:dirt_with_grass", "ethereal:green_dirt"},
	neighbors = {"group:grass"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 0,
	max_height = 200,
	day_toggle = true,
})



-- raw mutton
minetest.register_craftitem(":mobs:mutton_raw", {
	description = S("Raw Mutton"),
	inventory_image = "mobs_mutton_raw.png",
	on_use = minetest.item_eat(2),
	groups = {food_meat_raw = 1, food_mutton_raw = 1, flammable = 2},
})

-- cooked mutton
minetest.register_craftitem(":mobs:mutton_cooked", {
	description = S("Cooked Mutton"),
	inventory_image = "mobs_mutton_cooked.png",
	on_use = minetest.item_eat(6),
	groups = {food_meat = 1, food_mutton = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:mutton_cooked",
	recipe = "mobs:mutton_raw",
	cooktime = 5,
})
