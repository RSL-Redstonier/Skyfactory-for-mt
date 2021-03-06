local modname = "equivalent_exchange_energy_collectors:"

collector = {
	emc_gather = function(orig_emc, mark, multiplier)
		return orig_emc + (10^(mark - 1)) * multiplier
	end,
	emc_transfer = function(mark,pos,multiplier)
		local meta = minetest.get_meta(pos)
		local emc = meta:get_int("emc")
		local surrounding_nodes = {
			minetest.get_meta({x = pos.x + 1, y = pos.y, z = pos.z}),
			minetest.get_meta({x = pos.x - 1,  y = pos.y, z = pos.z}),
			minetest.get_meta({x = pos.x, y = pos.y + 1, z = pos.z}),
			minetest.get_meta({x = pos.x, y = pos.y - 1, z = pos.z}),
			minetest.get_meta({x = pos.x, y = pos.y, z = pos.z + 1}),
			minetest.get_meta({x = pos.x, y = pos.y, z = pos.z - 1})
		}
		local emc_transferable_nodes = {}
		local emc_transferable_nodes_length = 0
		for i = 1,6 do
			if surrounding_nodes[i]:get_string("emc_storable") == "true" then
				table.insert(emc_transferable_nodes,surrounding_nodes[i])
				emc_transferable_nodes_length = emc_transferable_nodes_length + 1
			end
		end
		if emc_transferable_nodes_length == 0 then
			local generate_amount = math.floor(emc / 10)
			local times_over = math.floor(generate_amount / 99)
			local inventory = meta:get_inventory()
			local size = inventory:get_size("container")
			if emc >= 10 then
				meta:set_int("emc", emc - 10*generate_amount)
				if mark == 4 then
					meta:set_string("formspec",
						"size[8,7.4]"..
						"label[0,0;Antimatter Collector]"..
						"label[4,0;EMC Stored: "..emc - 10*generate_amount.."]"..
						"list[current_name;container;0,0.5;8,7;]")
				else
					meta:set_string("formspec",
						"size[8,7.4]"..
						"label[0,0;Energy Collector Mark "..mark.."]"..
						"label[4,0;EMC Stored: "..emc - 10*generate_amount.."]"..
						"list[current_name;container;0,0.5;8,7;]")
				end
				for i = 1, times_over do
  					inventory:add_item("container", {name = modname.."klein_star", count = 99})
  				end
  				if generate_amount % 99 > 0 then
   					inventory:add_item("container", {name = modname.."klein_star", count = generate_amount % 99})
  				end
			end
		end
		local newemc = (collector.emc_gather(emc, mark, multiplier))
		local distribution = math.floor(newemc / emc_transferable_nodes_length)
		for j = 1,emc_transferable_nodes_length do
			if mark == 4 then
				meta:set_string("formspec",
					"size[8,7.5]"..
					"label[0,0;Antimatter Collector]"..
					"label[4,0;EMC Stored: "..(newemc - distribution).."]"..
					"list[current_name;container;0,0.5;8,7;]")
			else
				meta:set_string("formspec",
					"size[8,7.5]"..
					"label[0,0;Energy Collector Mark "..mark.."]"..
					"label[4,0;EMC Stored: "..(newemc - distribution).."]"..
					"list[current_name;container;0,0.5;8,7;]")
			end
			meta:set_int("emc",(newemc - distribution))
			emc_transferable_nodes[j]:set_int("emc", (emc_transferable_nodes[j]:get_int("emc") + distribution))
		end
	end,
	check_multiplier = function(pos)
		local multiplier = 1
		if minetest.get_meta({x = pos.x, y = pos.y + 1, z = pos.z}):get_int("multiplier") == 2 then
			multiplier = 2
		end
		return multiplier
	end,
}

local register_name = {"mk1","mk2","mk3","antimatter_collector"}
local item_name = {"Energy Collector Mark 1","Energy Collector Mark 2","Energy Collector Mark 3", "Antimatter Collector"}

for i = 1,4 do

-- Registering ABMs --

	minetest["register_abm"]({
		nodenames = {modname..register_name[i]},
		interval = 1.0,
		chance = 1,
		action = function(pos, node, active_object_count, active_object_count_wider)
			local meta = minetest.get_meta(pos)
			local emc = meta:get_int("emc")
			local multiplier = collector.check_multiplier(pos)
			local emc_per = collector.emc_gather(emc,i,multiplier)
			meta:set_string("formspec",
				"size[8,7.4]"..
				"label[0,0;"..item_name[i].."]"..
				"label[4,0;EMC Stored: "..emc_per.."]"..
				"list[current_name;container;0,0.5;8,7;]")
			meta:set_int("emc", emc_per)
			collector.emc_transfer(i,pos,multiplier)
		end,
	})

-- Registering Nodes --

	minetest["register_node"](":"..modname..register_name[i], {
		description = item_name[i],
		tiles = {
		"ee_energy_collectors_"..register_name[i].."_top.png",
		"ee_energy_collectors_"..register_name[i].."_bottom.png",
		"ee_energy_collectors_"..register_name[i].."_side.png",
		"ee_energy_collectors_"..register_name[i].."_side.png",
		"ee_energy_collectors_"..register_name[i].."_side.png",
		"ee_energy_collectors_"..register_name[i].."_side.png",
		},
		paramtype2 = "facedir",
		groups = {cracky = 2},
		is_ground_content = false,
		sounds = default.node_sound_stone_defaults(),
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec",
				"size[8,7.4]"..
				"label[0,0;"..item_name[i].."]"..
				"label[4,0;EMC Stored: 0]"..
				"list[current_name;container;0,0.5;8,7;]")
			meta:set_string("infotext", item_name[i])
			meta:set_int("emc", 0)
			local inventory = meta:get_inventory()
			inventory:set_size("container", 8*7)
		end,
		can_dig = function(pos,player)
			local meta = minetest.env:get_meta(pos);
			local inv = meta:get_inventory()
			return inv:is_empty("container")
		end,
		--emc = emc[i]
	})
if minetest.get_modpath("hopper") and hopper ~= nil and hopper.add_container ~= nil then
	hopper:add_container({ 
		{"top", modname..register_name[i], "container"},
	})
end
end

minetest.register_node(modname.."interdiction_stone", {
	description = "Interdiction Stone",
	tiles = {
		"ee_energy_collectors_interdiction_stone.png",
		"ee_energy_collectors_interdiction_stone.png",
		"ee_energy_collectors_interdiction_stone.png",
		"ee_energy_collectors_interdiction_stone.png",
		"ee_energy_collectors_interdiction_stone.png",
		"ee_energy_collectors_interdiction_stone.png"
	},
	paramtype2 = "facedir",
	groups = {cracky = 1},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	light_source = 10,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_int("multiplier", 2)
	end,
})

-- Registering Craft Items --

minetest.register_craftitem(modname.."klein_star", {
	description = "Klein Star",
	inventory_image = "ee_energy_collectors_klein_star.png",
	emc = 172202112, 
})

-- Registering Crafts --

minetest.register_craft({
	output = modname.."mk1",
	recipe = {
		{"default:mese", "default:glass", "default:mese"},
		{"default:mese", "default:diamondblock", "default:mese"},
		{"default:mese", "default:furnace", "default:mese"}
	}
})

minetest.register_craft({
	output = modname.."mk2",
	recipe = {
		{"default:mese", modname.."red_matter", "default:mese"},
		{"default:mese", modname.."mk1", "default:mese"},
		{"default:mese", "default:mese", "default:mese"}
	}
})

minetest.register_craft({
	output = modname.."mk3",
	recipe = {
		{"default:mese", modname.."antimatter", "default:mese"},
		{"default:mese", modname.."mk2", "default:mese"},
		{"default:mese", "default:mese", "default:mese"}
	}
})

minetest.register_craft({
	output = modname.."interdiction_stone",
	recipe = {
		{"default:torch", modname.."aeternalis_fuel", "default:torch"},
		{modname.."aeternalis_fuel", "equivalent_exchange:philosophers_stone", modname.."aeternalis_fuel"},
		{"equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence", "equivalent_exchange:high_covalence"}
	},
	replacements = {
		{"equivalent_exchange:philosophers_stone", "equivalent_exchange:philosophers_stone"}
	}
})

minetest.register_craft({
	output = modname.."antimatter_collector",
	recipe = {
		{modname.."condensed_antimatter", modname.."condensed_antimatter", modname.."condensed_antimatter"},
		{modname.."condensed_antimatter", modname.."mk3", modname.."condensed_antimatter"},
		{modname.."condensed_antimatter", modname.."condensed_antimatter", modname.."condensed_antimatter"}
	}
})
