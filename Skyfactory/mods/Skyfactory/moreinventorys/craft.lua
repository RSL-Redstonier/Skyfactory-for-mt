

minetest.register_craft({
	output = "moreinventorys:player_chest",
	recipe = {
		{"default:chest", "default:chest", "default:chest"},
		{"default:chest", "", "default:chest"},
		{"default:chest", "default:chest", "default:chest"},

	}
})


minetest.register_craft({
	output = "moreinventorys:password_chest",
	recipe = {{"moreinventorys:player_chest"}}
})