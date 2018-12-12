
minetest.register_node("skytest:machine_frame", {
	description = "Empty frame for advanced machines",
	tiles = {
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png",
		"machine_frame.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5}, -- NodeBox3
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, -0.375, 0.4375, -0.375}, -- NodeBox5
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox6
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox7
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox8
			{-0.5, 0.375, 0.375, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375}, -- NodeBox11
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375}, -- NodeBox12
		}
	},
        is_ground_content = true,
	groups = {cracky = 3},
})
minetest.register_craft({
        output = "skytest:machine_frame",
        recipe = {
            {"terumet:item_ceramic","default:obsidian_glass","terumet:item_ceramic"},
            {"terumet:ingot_raw","","terumet:ingot_raw"},
            {"terumet:ingot_tste","default:obsidian_glass","terumet:ingot_tste"},
        }
    })

minetest.register_node("skytest:base_factory", {
	description = "Factory Base",
	tiles = {
		"bees_hive_industrial.png^factory_overlay.png",
		"bees_hive_industrial.png^factory_overlay.png",
		"factory_overlay.png",
		"factory_overlay.png",
		"factory_overlay.png",
		"factory_overlay.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.375, 0.5, -0.375}, -- NodeBox2
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox3
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox5
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox6
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375}, -- NodeBox7
		}
	},
        is_ground_content = true,
	groups = {cracky = 3},
})
minetest.register_craft({
        output = "skytest:base_factory",
        recipe = {
            {"terumet:ingot_cgls","","terumet:ingot_cgls"},
            {"terumet:ingot_tgol","skytest:machine_frame","terumet:ingot_tgol"},
            {"skytest:basic_chip","terumet:block_ceramic","skytest:basic_chip"},
        }
    })