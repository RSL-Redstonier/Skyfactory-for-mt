-- crafts for autofarmer mod
-- feel free to edit


-- LV planter
minetest.register_craft({
	recipe = {
		{"default:copper_ingot", "pipeworks:one_way_tube", "default:copper_ingot"},
		{"default:tin_ingot", "mesecons_detector:node_detector_off", "default:tin_ingot"},
		{"default:copper_ingot", "default:tin_ingot", "default:copper_ingot"}},
	output = "autofarmer:lv_planter",
})



-- MV planter
minetest.register_craft({
	recipe = {
		{"default:bronze_ingot", "pipeworks:one_way_tube",    "default:bronze_ingot"},
		{"technic:brass_ingot", "mesecons_detector:node_detector_off",     "technic:brass_ingot"},
		{"default:bronze_ingot", "technic:brass_ingot", "default:bronze_ingot"}},
	output = "autofarmer:mv_planter",
})


-- HV planter
minetest.register_craft({
	recipe = {
		{"technic:stainless_steel_ingot", "pipeworks:one_way_tube",    "technic:stainless_steel_ingot"},
		{"technic:cast_iron_ingot", "mesecons_detector:node_detector_off",     "technic:cast_iron_ingot"},
		{"technic:stainless_steel_ingot", "technic:cast_iron_ingot", "technic:stainless_steel_ingot"}},
	output = "autofarmer:hv_planter",
})

-- TODO
minetest.register_craft({
	recipe = {
		{"default:dirt", "default:dirt", "default:dirt"},
		{"default:tin_ingot", "technic:motor", "default:tin_ingot"},
		{"technic:mv_cable", "default:tin_ingot", "pipeworks:pipe_1_empty"}},
	output = "autofarmer:harvester",
})


