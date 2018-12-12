minetest.register_on_dieplayer(function(player)
	local bind_item = player:get_attribute("PLAYER_BOUND")
	if bind_item then
		local inv = player:get_inventory()
		if inv:contains_item("main", bind_item) then
			inv:remove_item("main", bind_item)
		player:set_attribute("PLAYER_HAD", "true")
		else
		player:set_attribute("PLAYER_HAD", "false")
		end
	end
	return true
end)

minetest.register_on_respawnplayer(function(player)
		local bind_item = player:get_attribute("PLAYER_BOUND")
		local had_item = player:get_attribute("PLAYER_HAD")
	if bind_item and had_item == "true" then
		local inv = player:get_inventory()
		inv:add_item("main", bind_item)
	end

end)

minetest.register_node("soulbinding:stone", {
	description = "Binding Stone (first slot)",
	tiles = {"binding_top.png", "binding_bottom.png", "binding_side.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		player:set_attribute("PLAYER_BOUND", itemstack:get_name())
		minetest.remove_node(pos)
		local itemname = itemstack:get_name()
		minetest.chat_send_player(player:get_player_name(), itemname .. " was soulbound to you in slot 1.")
	end,
})

minetest.register_craft({
	output = "soulbinding:stone",
	recipe = {
		{"default:stone", "default:diamondblock", "default:stone"},
		{"dye:blue", "default:stone", "dye:blue"},
		{"default:cobble", "default:cobble", "default:cobble"}
	}
})

minetest.register_node("soulbinding:stone_2", {
	description = "Binding Stone (second slot)",
	tiles = {"binding_top.png", "binding_bottom.png", "binding_side.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		player:set_attribute("PLAYER_BOUND2", itemstack:get_name())
		minetest.remove_node(pos)
		local itemname = itemstack:get_name()
		minetest.chat_send_player(player:get_player_name(), itemname .. " was soulbound to you in slot 2.")
	end,
})

minetest.register_on_respawnplayer(function(player)
		local bind_item = player:get_attribute("PLAYER_BOUND2")
		local had_item = player:get_attribute("PLAYER_HAD2")
	if bind_item and had_item == "true" then
		local inv = player:get_inventory()
		inv:add_item("main", bind_item)
	end

end)

minetest.register_on_dieplayer(function(player)
	local bind_item = player:get_attribute("PLAYER_BOUND2")
	if bind_item then
		local inv = player:get_inventory()
		if inv:contains_item("main", bind_item) then
			inv:remove_item("main", bind_item)
		player:set_attribute("PLAYER_HAD2", "true")
		else
		player:set_attribute("PLAYER_HAD2", "false")
		end
	end
	return true
end)

minetest.register_craft({
	output = "soulbinding:stone_2",
	recipe = {
		{"default:stone", "default:diamondblock", "default:stone"},
		{"soulbinding:stone", "default:stone", "soulbinding:stone"},
		{"default:cobble", "default:cobble", "default:cobble"}
	}
})

--3slot

minetest.register_node("soulbinding:stone_3", {
	description = "Binding Stone (third slot)",
	tiles = {"binding_top.png", "binding_bottom.png", "binding_side.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		player:set_attribute("PLAYER_BOUND3", itemstack:get_name())
		minetest.remove_node(pos)
		local itemname = itemstack:get_name()
		minetest.chat_send_player(player:get_player_name(), itemname .. " was soulbound to you in slot 3.")
	end,
})

minetest.register_on_respawnplayer(function(player)
		local bind_item = player:get_attribute("PLAYER_BOUND3")
		local had_item = player:get_attribute("PLAYER_HAD3")
	if bind_item and had_item == "true" then
		local inv = player:get_inventory()
		inv:add_item("main", bind_item)
	end

end)

minetest.register_on_dieplayer(function(player)
	local bind_item = player:get_attribute("PLAYER_BOUND3")
	if bind_item then
		local inv = player:get_inventory()
		if inv:contains_item("main", bind_item) then
			inv:remove_item("main", bind_item)
		player:set_attribute("PLAYER_HAD3", "true")
		else
		player:set_attribute("PLAYER_HAD3", "false")
		end
	end
	return true
end)

minetest.register_craft({
	output = "soulbinding:stone_3",
	recipe = {
		{"default:stone", "default:diamondblock", "default:stone"},
		{"soulbinding:stone_2", "default:stone", "soulbinding:stone_2"},
		{"default:cobble", "default:cobble", "default:cobble"}
	}
})

