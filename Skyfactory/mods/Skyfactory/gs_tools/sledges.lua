function gs_tools.after_sledge(pos, oldnode, digger)
	if digger then
		local wielded = digger:get_wielded_item()
		local rank = minetest.get_item_group(wielded:get_name(), "sledge")
		if rank > 0 then
			for _,k in ipairs(gs_tools.get_3x3s(pos, digger)) do
				gs_tools.drop_node(k, digger, wielded, rank)
			end
		end
	end
end

-- register_on_dignode is used here because after_use does not provide position
-- which is somewhat annoying

minetest.register_on_dignode(gs_tools.after_sledge)

minetest.register_tool("gs_tools:stone_sledge", {
	description = "Stone Sledgehammer",
	groups = {sledge=1},
	inventory_image = "gs_stone_sledge.png",
	tool_capabilities = {
		full_punch_interval = 2.5,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=3.00, [3]=2.75}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=7},
	},
})

minetest.register_tool("gs_tools:bronze_sledge", {
	description = "Bronze Sledgehammer",
	groups = {sledge=2},
	inventory_image = "gs_bronze_sledge.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=2.75, [2]=2.50, [3]=2.25}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=12},
	},
})

minetest.register_tool("gs_tools:steel_sledge", {
	description = "Steel Sledgehammer",
	groups = {sledge=3},
	inventory_image = "gs_steel_sledge.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=2.00, [2]=1.75, [3]=1.50}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=17},
	},
})

minetest.register_tool("gs_tools:obsidian_sledge", {
	description = "Obsidian Sledgehammer",
	groups = {sledge=4},
	inventory_image = "gs_obsidian_sledge.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=1.25, [2]=1.00, [3]=0.75}, uses=50, maxlevel=4},
		},
		damage_groups = {fleshy=23},
	},
})

minetest.register_craft({
	output = "gs_tools:stone_sledge",
	recipe = {
		{"","skytest:compressed_cobblestone_9c","skytest:compressed_cobblestone_9c"},
		{"", "gs_tools:stone_rod","skytest:compressed_cobblestone_9c"},
		{"gs_tools:stone_rod", "",""}
	}
})

minetest.register_craft({
	output = "gs_tools:bronze_sledge",
	recipe = {
		{"", "gs_tools:stone_sledge", "default:bronzeblock"},
		{"", "default:bronze_ingot", "gs_tools:stone_sledge"},
		{"default:bronze_ingot", "", ""}
	}
})
minetest.register_craft({
	output = "gs_tools:steel_sledge",
	recipe = {
		{"","gs_tools:bronze_sledge","default:steelblock"},
		{"", "gs_tools:steel_rod","gs_tools:bronze_sledge"},
		{"gs_tools:steel_rod", "",""}
	}
})

minetest.register_craft({
	output = "gs_tools:obsidian_sledge",
	recipe = {
		{"default:mese_crystal_fragment", "default:obsidian", "default:mese_crystal_fragment"},
		{"default:obsidian", "default:diamondblock", "default:obsidian"},
		{"", "gs_tools:steel_sledge", ""}
	}
})
minetest.register_craft({
	output = "gs_tools:bedrockium_sledge",
	recipe = {
		{"skytest:bedrockium_ingot", "skytest:bedrockium_ingot", "skytest:bedrockium_ingot"},
		{"skytest:bedrockium_ingot", "gs_tools:obsidian_sledge", "skytest:bedrockium_ingot"},
		{"", "skytest:bedrockium_ingot", ""}
	}
})
minetest.register_tool("gs_tools:bedrockium_sledge", {
	description = "Bedrockium Sledgehammer",
	groups = {sledge=5},
	inventory_image = "bedrockium_hammer.png",
	tool_capabilities = {
		full_punch_interval = 0.01,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=0.01, [2]=0.01, [3]=0.01}, uses=5000, maxlevel=15},
		},
		damage_groups = {fleshy=230},
	},
})