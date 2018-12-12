--Created by Krock for the Mining+ mod

local mod_path = minetest.get_modpath("mining_plus")

function has_mining_access(player, meta)
	local player_name = player
	if type(player) ~= "string" then
		player_name = player:get_player_name()
	end
	return (player_name == meta:get_string("owner"))
end

dofile(mod_path.."/tunnelbomb.lua")
dofile(mod_path.."/bridgebuilder.lua")
dofile(mod_path.."/autominer.lua")
dofile(mod_path.."/grinder.lua")

minetest.register_node("mining_plus:breaknode", {
    description = "Breaknode",
    tiles = { "mining_breaknode.png" },
    groups = { dig_immediate = 2 },
})

minetest.register_craft({
	output = "mining_plus:breaknode 16",
	recipe = {
		{ "default:stick" },
		{ "default:steel_ingot" },
		{ "default:stick" },
	}
})

-- ADDITIONAL COBBLE-EATER

minetest.register_node("mining_plus:polished_cobble", {
    description = "Polished Cobble",
    tiles = { "mining_polished_cobble.png" },
    groups = { cracky = 1 },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "mining_plus:polished_cobble 8",
	recipe = {
		{ "default:cobble", "default:cobble", "default:cobble" },
		{ "default:cobble", "group:stone", "default:cobble" },
		{ "default:cobble", "default:cobble", "default:cobble" },
	}
})

minetest.register_craft({
	output = "default:cobble",
	recipe = {
		{ "mining_plus:polished_cobble" },
	}
})