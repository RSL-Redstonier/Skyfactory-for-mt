minetest.register_craftitem("project_e:transmutation_tablet", {
	description = "Transmutation Tablet",
	inventory_image = "trans_tablet.png",
	on_use = function (itemstack, user, pointed_thing)
		playereffects.apply_effect_type("creative", 5, user)
		itemstack:take_item(1)
		return itemstack
	end
})

minetest.register_craft({
        output = "project_e:transmutation_tablet",
        recipe = {
            {"project_e:crafting_set_1","project_e:crafting_set_4","project_e:crafting_set_4"},
            {"project_e:crafting_set_1","","project_e:crafting_set_3"},
            {"project_e:crafting_set_2","project_e:crafting_set_2","project_e:crafting_set_3"},
        }
    })
minetest.register_craftitem("project_e:crafting_set_1", {
	description = "Crafting Set 1",
    inventory_image = "crafting_sets.png",
	})

minetest.register_craft({
	output = "project_e:crafting_set_1",
	recipe = {
		{"mystical_agriculture:harvest_crystal","tech_tweak:quarry","tech_tweak:hv_centrifuge"},
		{"tech_tweak:hv_geothermal","technic:hv_nuclear_reactor_core","technic:forcefield_emitter_off"},
		{"technic:uranium_fuel","wrench:wrench","waterican:waterican_op"},
	}
})

minetest.register_craftitem("project_e:crafting_set_2", {
	description = "Crafting Set 2",
    inventory_image = "crafting_sets.png",
	})

minetest.register_craft({
	output = "project_e:crafting_set_2",
	recipe = {
		{"filler:filler","gs_tools:bedrockium_sledge","hell:portal_filler"},
		{"","skytest:cosmic_crystal",""},
		{"skytest:carrot_nebula","mystical_agriculture:growth_crystal",""},
		}
})

minetest.register_craftitem("project_e:crafting_set_3", {
	description = "Crafting Set 3",
    inventory_image = "crafting_sets.png",
	})

minetest.register_craft({
	output = "project_e:crafting_set_3",
	recipe = {
		{"inventorybags:storage_upgrade_tier_3","technic:hv_battery_box0","bees:bottle_honey"},
		{"bonemeal:fertiliser","equivalent_exchange:alchemical_chest","equivalent_exchange:condenser"},
		{"equivalent_exchange_energy_collectors:interdiction_stone","equivalent_exchange_energy_collectors:antimatter_collector","gemeric:blank_rune"},
	}
})
minetest.register_craftitem("project_e:crafting_set_4", {
	description = "Crafting Set 4",
    inventory_image = "crafting_sets.png",
})

minetest.register_craft({
	output = "project_e:crafting_set_4",
	recipe = {
		{"automation_crusher:dust_gold","basic_machines:diamond_dust_66","basic_machines:power_rod"},
		{"qt_dimentions:orb_warp","orbs_of_time:orb_dawn","node_texture_modifier:desert_stonebrick_old2"},
		{"mobs:leather","microexpansion:cell_256k","microexpansion:chest"},
	}
})

--[[
automation_crusher:dust_gold
basic_machines:diamond_dust_66
basic_machines:power_rod
bees:bottle_honey
bonemeal:fertiliser
equivalent_exchange:alchemical_chest
equivalent_exchange:condenser
equivalent_exchange_energy_collectors:interdiction_stone
equivalent_exchange_energy_collectors:antimatter_collector
filler:filler
gemeric:blank_rune
gs_tools:bedrockium_sledge
hell:portal_filler
inventorybags:storage_upgrade_tier_3
inventorybags:item_teleportation_bag
microexpansion:chest
microexpansion:cell_256k
mobs:leather
node_texture_modifier:desert_stonebrick_old2
orbs_of_time:orb_dawn
qt_dimentions:orb_warp
special_picks:fortune_pick
tech_tweak:quarry
tech_tweak:hv_centrifuge
tech_tweak:hv_geothermal
technic:hv_nuclear_reactor_core
technic:forcefield_emitter_off
technic:uranium_fuel
wrench:wrench
waterican:waterican_op
skytest:bag
skytest:auto_sieve_blank
skytest:carrot_nebula
skytest:cosmic_crystal
seed:seed_seed_blank
skytest:grinder
]]--
