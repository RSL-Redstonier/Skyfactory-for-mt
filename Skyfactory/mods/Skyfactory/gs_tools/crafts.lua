-- tool mods, by gsmanners
-- license: WTFPL

--------------------------------------------------
-- general crafts

minetest.register_craftitem("gs_tools:stone_rod", {
	description = "Stone Rod",
	inventory_image = "gs_stone_rod.png",
})

minetest.register_craft({
	output = "gs_tools:stone_rod 1",
	recipe = {
		{"", "", "default:cobble"},
		{"", "default:cobble", ""},
		{"default:cobble", "", ""}
	}
})

minetest.register_craftitem("gs_tools:clay_rod", {
	description = "Clay Rod",
	inventory_image = "gs_clay_rod.png",
})

minetest.register_craft({
	output = "gs_tools:clay_rod 1",
	recipe = {
		{"", "", "default:clay_brick"},
		{"", "default:clay_brick", ""},
		{"default:clay_brick", "", ""}
	}
})


minetest.register_craftitem("gs_tools:steel_rod", {
	description = "Steel Rod",
	inventory_image = "gs_steel_rod.png",
})

minetest.register_craft({
	output = "gs_tools:steel_rod 1",
	recipe = {
		{"", "", "default:steel_ingot"},
		{"", "default:steel_ingot", ""},
		{"default:steel_ingot", "", ""}
	}
})
