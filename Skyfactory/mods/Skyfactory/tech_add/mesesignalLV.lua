minetest.register_node("tech_add:lv_mesesignal", {
	description = "LV Mese Signal",
	tiles = {"tech_add_lv_mese_off.png"},
	infotext = "LV Mese Signal(OFF)",
	groups = {
			snappy=2, choppy=2, oddly_breakable_by_hand=2, 
			technic_machine=1, mesesignal=1 ,
		},
	active = false,
	paramtype = "light",
	technic_run = function(pos, node)
		local meta         = minetest.get_meta(pos)
		local machine_name = "LV Mese Signal"
		local eu_input     = meta:get_int("LV_EU_input")
		local demand       = 1
		meta:set_int("LV_EU_demand", demand)

		-- Setup meta data if it does not exist.
		if not eu_input then
			meta:set_int("LV_EU_demand", demand)
			meta:set_int("LV_EU_input", 0)
			return
		end

		if eu_input < demand then
			meta:set_string("infotext", machine_name.." Unpowered")
		elseif eu_input >= demand then
			minetest.swap_node(pos, {name="tech_add:lv_mesesignal_on"})
			mesecon.receptor_on(pos)
		end
	end,
	mesecons = {receptor = {
		state = mesecon.state.off,
	}}
})

minetest.register_node("tech_add:lv_mesesignal_on", {
	description = "LV Mese Signal",
	tiles = {"tech_add_lv_mese_on.png"},
	infotext = "LV Mese Signal(ON)",
	groups = {
			snappy=2, choppy=2, oddly_breakable_by_hand=2, 
			technic_machine=1, mesecon = 2 , mesesignal=1 , not_in_creative_inventory=1
		},
	active = false,
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	drop = "tech_add:lv_mesesignal", 
	technic_run = function(pos, node)
		local meta         = minetest.get_meta(pos)
		local machine_name = "LV Mese Signal"
		local eu_input     = meta:get_int("LV_EU_input")
		local demand       = 1
		meta:set_int("LV_EU_demand", demand)

		-- Setup meta data if it does not exist.
		if not eu_input then
			meta:set_int("LV_EU_demand", demand)
			meta:set_int("LV_EU_input", 1)
			return
		end

		if eu_input < demand then
			minetest.swap_node(pos, {name="tech_add:lv_mesesignal"})
			mesecon.receptor_off(pos)
		elseif eu_input >= demand then
			meta:set_string("infotext", machine_name.." Active")
		end
	end,
	mesecons = {receptor = {
		state = mesecon.state.on,
	}},
})

technic.register_machine("LV", "tech_add:lv_mesesignal", technic.receiver)
technic.register_machine("LV", "tech_add:lv_mesesignal_on", technic.receiver)

minetest.register_craft({
	output = 'tech_add:lv_mesesignal',
	recipe = {
		{'mesecons_torch:mesecon_torch_on',},
		{'technic:machine_casing',},
		{'technic:lv_cable0',},
}})
minetest.register_craft({
	output = 'tech_add:lv_mesesignal',
	recipe = {
		{'group:mesesignal',},
		{'technic:lv_cable0',},
}})


