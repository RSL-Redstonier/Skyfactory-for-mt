minetest.register_node("qt_dimentions:brilliance_warp", {
	description = "Brilliance Dimention Warpstone",
	tiles = {"brilliance_warp.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=1, dimentional_warp=1},
	sounds = default.node_sound_stone_defaults(),
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local playerpos = player:getpos()
		if playerpos.y <= 500 or playerpos.y >= 1500 then
			player:setpos({x = playerpos.x, y = 1015, z = playerpos.z})
		else
			player:setpos({x = playerpos.x, y = 10, z = playerpos.z})
			minetest.after(0.3, function()
				for c = 0, 150 do
					local node = minetest.env:get_node({x = playerpos.x, y = c, z = playerpos.z})
					local above = minetest.env:get_node({x = playerpos.x, y = c+1, z = playerpos.z})
					if node.name == "air" and above.name == "air" then
						player:setpos({x = playerpos.x, y = c, z = playerpos.z})
						return
					end
				end
			end)
		end
	end
})
minetest.register_craft({
    output = "qt_dimentions:brilliance_warp",
    recipe = {
        {"group:super_gem","group:gem","group:super_gem"},
		{"gemeric:chaos_essence","default:mese","gemeric:chaos_essence"},
		{"group:super_gem","group:gem","group:super_gem"},
    }
})

minetest.register_node("qt_dimentions:orb_warp", {
	description = "Orb Dimention Warpstone",
	tiles = {"poison_warp.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=1, dimentional_warp=1},
	sounds = default.node_sound_stone_defaults(),
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local playerpos = player:getpos()
		if playerpos.y <= 3000 or playerpos.y >= 6000 then
			player:setpos({x = playerpos.x, y = 4500, z = playerpos.z})
		else
			player:setpos({x = playerpos.x, y = 10, z = playerpos.z})
			minetest.after(0.3, function()
				for c = 0, 150 do
					local node = minetest.env:get_node({x = playerpos.x, y = c, z = playerpos.z})
					local above = minetest.env:get_node({x = playerpos.x, y = c+1, z = playerpos.z})
					if node.name == "air" and above.name == "air" then
						player:setpos({x = playerpos.x, y = c, z = playerpos.z})
						return
					end
				end
			end)
		end
	end
})
minetest.register_craft({
    output = "qt_dimentions:orb_warp",
    recipe = {
        {"qt_dimentions:brilliance_dirt_with_grass","qt_dimentions:brilliance_dirt","qt_dimentions:brilliance_dirt_with_grass"},
		{"qt_dimentions:brilliance_dirt","qt_dimentions:brilliance_cobble","qt_dimentions:brilliance_dirt"},
		{"qt_dimentions:brilliance_dirt_with_grass","qt_dimentions:brilliance_dirt","qt_dimentions:brilliance_dirt_with_grass"},
    }
})