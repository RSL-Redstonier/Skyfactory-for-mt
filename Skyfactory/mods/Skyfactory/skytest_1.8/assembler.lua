


local paxelnodeformspec = 
	"size[8,9]"..
	"label[3,0;part builder]"..
	"list[current_name;paxeltype;1,2;1,1;]"..
	"list[current_name;head;3,1;1,1;]"..
	"list[current_name;binding;3,2;1,1;]"..
	"list[current_name;handle;3,3;1,1;]"..
	"list[current_name;tool;6,2;1,1;]"..
	"list[current_player;main;0,5;8,4;]"..
	"button[5,3;3,1;create;Assemble]"
	local paxels = {
	{"skytest:solder_wire", "skytest:diode", "skytest:silicon_board", "skytest:copper_wire", "skytest:blank_chip"},
	{"skytest:solder_wire", "skytest:diode", "skytest:blank_chip", "skytest:copper_wire", "skytest:basic_chip"},
	{"skytest:solder_wire", "skytest:diode", "skytest:basic_chip", "skytest:copper_wire", "skytest:advanced_chip"},
	{"skytest:solder_wire", "skytest:bedrockium_board", "skytest:advanced_chip", "skytest:bedrockium_board", "skytest:bedrockium_chip"}
}
minetest.register_node("skytest:assembler", {
    description = "Assembler",
	tiles = {
		"bees_hive_industrial.png^awards_craft.png^factory_overlay.png",
		"bees_hive_industrial.png^awards_craft.png^factory_overlay.png",
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
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",paxelnodeformspec)
		meta:set_string("infotext", "Part Builder")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
		inv:set_size("head", 1*1)
		inv:set_size("binding", 1*1)
		inv:set_size("handle", 1*1)
		inv:set_size("tool", 1*1)
		inv:set_size("paxeltype", 1*1)		
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if listname == "head" or listname == "binding" or listname == "handle" or listname == "paxeltype" then
			return stack:get_count()
		else
			return 0
		end
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		if to_list == "tool" then
			return 0
		else
			return 1
		end
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("head") then
			return false
		elseif not inv:is_empty("binding") then
			return false
		elseif not inv:is_empty("paxeltype") then
			return false
		elseif not inv:is_empty("handle") then
			return false
		elseif not inv:is_empty("tool") then
			return false
		end
		return true
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		for _, row in ipairs(paxels) do
			local paxeltype = row[1]
			local pick = row[2]
			local binding = row[3]
			local handle = row[4]
			local tool = row[5]
			if fields.create then
			if	inv:get_stack('paxeltype', 1):get_name() == paxeltype and inv:get_stack("head", 1):get_name() == pick and inv:get_stack("binding", 1):get_name() == binding and inv:get_stack("handle", 1):get_name() == handle and inv:is_empty("tool") then
					inv:add_item("tool", tool)
					inv:set_stack("head", 1, nil)
					inv:set_stack("binding", 1, nil)
					inv:set_stack("handle", 1, nil)
					inv:remove_item("paxeltype", paxeltype)
				end
			end
		end
	end,
})
minetest.register_craft({
        output = "skytest:assembler",
        recipe = {
            {"","terumet:mach_thermobox",""},
            {"default:axe_diamond","skytest:machine_frame","default:pick_diamond"},
            {"terumet:item_coil_tcop","terumet:ingot_cgls","terumet:item_coil_tcop"}
        }
    })
	