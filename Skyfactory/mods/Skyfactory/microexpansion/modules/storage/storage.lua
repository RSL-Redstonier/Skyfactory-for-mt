microexpansion.register_cell("cell_8k", {
  description = "8k ME Storage Cell",
  capacity = 8000,
})

	minetest.register_craft({
		output = "microexpansion:cell_8k",
		recipe = {
			{"default:obsidian_shard", "default:mese", "default:obsidian_shard"},
			{"microexpansion:steel_infused_obsidian_ingot", "microexpansion:machine_casing", "microexpansion:steel_infused_obsidian_ingot"},
			{"default:obsidian_shard", "microexpansion:steel_infused_obsidian_ingot", "default:obsidian_shard"}
		}
	})

microexpansion.register_cell("cell_16k", {
  description = "16k ME Storage Cell",
  capacity = 16000,
})

	minetest.register_craft({
		output = "microexpansion:cell_16k",
		recipe = {
			{"default:obsidian_shard", "default:mese", "default:obsidian_shard"},
			{"microexpansion:cell_8k", "microexpansion:machine_casing", "microexpansion:cell_8k"},
			{"default:obsidian_shard", "microexpansion:cell_8k", "default:obsidian_shard"}
		}
	})
microexpansion.register_cell("cell_32k", {
  description = "32k ME Storage Cell",
  capacity = 32000,
})

	minetest.register_craft({
		output = "microexpansion:cell_32k",
		recipe = {
			{"default:obsidian_shard", "default:mese", "default:obsidian_shard"},
			{"microexpansion:cell_16k", "microexpansion:machine_casing", "microexpansion:cell_16k"},
			{"default:obsidian_shard", "microexpansion:cell_16k", "default:obsidian_shard"}
		}
	})
microexpansion.register_cell("cell_64k", {
  description = "64k ME Storage Cell",
  capacity = 64000,
})

	minetest.register_craft({
		output = "microexpansion:cell_64k",
		recipe = {
			{"default:obsidian_shard", "default:mese", "default:obsidian_shard"},
			{"microexpansion:cell_32k", "microexpansion:machine_casing", "microexpansion:cell_32k"},
			{"default:obsidian_shard", "microexpansion:cell_32k", "default:obsidian_shard"}
		}
	})
microexpansion.register_cell("cell_128k", {
  description = "128k ME Storage Cell",
  capacity = 128000,
})

	minetest.register_craft({
		output = "microexpansion:cell_128k",
		recipe = {
			{"default:obsidian_shard", "default:mese", "default:obsidian_shard"},
			{"microexpansion:cell_64k", "microexpansion:machine_casing", "microexpansion:cell_64k"},
			{"default:obsidian_shard", "microexpansion:cell_64k", "default:obsidian_shard"}
		}
	})
microexpansion.register_cell("cell_256k", {
  description = "256k ME Storage Cell",
  capacity = 256000,
})

	minetest.register_craft({
		output = "microexpansion:cell_256k",
		recipe = {
			{"default:obsidian_shard", "default:mese", "default:obsidian_shard"},
			{"microexpansion:cell_128k", "microexpansion:machine_casing", "microexpansion:cell_128k"},
			{"default:obsidian_shard", "microexpansion:cell_128k", "default:obsidian_shard"}
		}
	})
