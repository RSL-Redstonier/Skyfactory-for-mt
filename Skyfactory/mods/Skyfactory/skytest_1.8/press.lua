local mesadragon_formspec =
	"size[8,8.5]"..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	"list[current_name;src;2.75,0.5;1,1;]"..
	"list[current_name;fuel;2.75,2.5;1,1;]"..
	"image[3.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
	"list[current_name;dst;4.75,1.5;2,2;]"..
	"list[current_player;main;0,4.25;8,1;]"..
	"list[current_player;main;0,5.5;8,3;8]"..
	"listring[current_name;dst]"..
	"listring[current_player;main]"..
	"listring[current_name;src]"..
	"listring[current_player;main]"..
	default.get_hotbar_bg(0, 4.25)

local function can_dig(pos, player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	return inv:is_empty("fuel") and inv:is_empty("dst") and inv:is_empty("src")
end

local function allow_metadata_inventory_put(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	if listname == "fuel" then
		if stack:get_name() == "skytest:board_press" then
			return stack:get_count()
		elseif stack:get_name() == "skytest:diode_press" then
			return stack:get_count()
		elseif stack:get_name() == "skytest:wire_press_pattern" then
			return stack:get_count()
		elseif stack:get_name() == "skytest:copper_wire" then
			return stack:get_count()
		elseif stack:get_name() == "skytest:advanced_chip" then
			return stack:get_count()
		else
			return 0
		end
	elseif listname == "src" then
		return stack:get_count()
	elseif listname == "dst" then
		return 0
	end
end

local function allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local stack = inv:get_stack(from_list, from_index)
	return allow_metadata_inventory_put(pos, to_list, to_index, stack, player)
end

local function allow_metadata_inventory_take(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	return stack:get_count()
end

minetest.register_node("skytest:press", {
	description = "Press",
	tiles = {
		"bees_hive_industrial.png^circut_board.png^factory_overlay.png",
		"bees_hive_industrial.png^circut_board.png^factory_overlay.png",
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
		meta:set_string("formspec", mesadragon_formspec)
		local inv = meta:get_inventory()
		inv:set_size('src', 1)
		inv:set_size('fuel', 1)
		inv:set_size('dst', 1)
	end,
	can_dig = can_dig,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local srclist = inv:get_list("src")
		local fuellist = inv:get_list("fuel")
		local dstlist = inv:get_list("dst")
		if fuellist[1]:get_name() == "skytest:board_press" then
			if srclist[1]:get_name() == "skytest:silicon" then
				if inv:room_for_item("dst", "skytest:silicon_board") then
					inv:add_item("dst", {name="skytest:silicon_board", count=1})
				end			
			else
				dstlist[1]:take_item()
				inv:set_stack("dst", 1, dstlist[1])
			end
		elseif fuellist[1]:get_name() == "skytest:wire_press_pattern" then
			if srclist[1]:get_name() == "default:copper_ingot" then
				if inv:room_for_item("dst", "skytest:copper_wire") then
					inv:add_item("dst", {name="skytest:copper_wire", count=1})
				end			
			else
				dstlist[1]:take_item()
				inv:set_stack("dst", 1, dstlist[1])
			end
		elseif fuellist[1]:get_name() == "skytest:diode_press" then
			if srclist[1]:get_name() == "terumet:item_ceramic" then
				if inv:room_for_item("dst", "skytest:diode") then
					inv:add_item("dst", {name="skytest:diode", count=1})
				end			
			else
				dstlist[1]:take_item()
				inv:set_stack("dst", 1, dstlist[1])
			end
		elseif fuellist[1]:get_name() == "skytest:advanced_chip" then
			if srclist[1]:get_name() == "skytest:bedrockium_ingot" then
				if inv:room_for_item("dst", "skytest:bedrockium_board") then
					inv:add_item("dst", {name="skytest:bedrockium_board", count=1})
				end			
			else
				dstlist[1]:take_item()
				inv:set_stack("dst", 1, dstlist[1])
			end
		elseif fuellist[1]:get_name() == "skytest:copper_wire" then
			if srclist[1]:get_name() == "default:tin_ingot" then
				if inv:room_for_item("dst", "skytest:solder_wire") then
					inv:add_item("dst", {name="skytest:solder_wire", count=1})
				end					
			else
				dstlist[1]:take_item()
				inv:set_stack("dst", 1, dstlist[1])
			end
		end
	end,	
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		if listname == "dst" then
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			local srclist = inv:get_list("src")
			local fuellist = inv:get_list("fuel")
			srclist[1]:take_item()
			inv:set_stack("src", 1, srclist[1])
			if fuellist[1]:get_name() == "skytest:copper_wire" then
			fuellist[1]:take_item()
			inv:set_stack("fuel", 1, fuellist[1])
			elseif fuellist[1]:get_name() == "skytest:advanced_chip" then
			fuellist[1]:take_item()
			inv:set_stack("fuel", 1, fuellist[1])
			end
		else
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			local dstlist = inv:get_list("dst")
			dstlist[1]:take_item()
			inv:set_stack("dst", 1, dstlist[1])
		end
	end,
	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
})





minetest.register_craftitem("skytest:basic_chip", {
	description = "Basic chip",
	inventory_image = "basic_circuit.png",
	})
		minetest.register_craftitem("skytest:advanced_chip", {
	description = "Advanced chip",
	inventory_image = "advanced_circuit.png",
	})
	minetest.register_craftitem("skytest:blank_chip", {
	description = "Blank chip",
	inventory_image = "circut_board.png",
	})
		minetest.register_craftitem("skytest:bedrockium_chip", {
	description = "Bedrockium chip",
	inventory_image = "basic_circuit.png^[colorize:black:180",
	})


	minetest.register_craftitem("skytest:silicon_board", {
	description = "Silicon Board",
	inventory_image = "circut_board.png^[colorize:black:70",
	})
		minetest.register_craftitem("skytest:bedrockium_board", {
	description = "Bedrockium Board",
	inventory_image = "circut_board.png^[colorize:black:140",
	})
	minetest.register_craftitem("skytest:diode", {
	description = "Diode",
	inventory_image = "diode.png",
	})
	minetest.register_craftitem("skytest:silicon", {
	description = "silicon",
	inventory_image = "rubber.png",
	})
	minetest.register_craftitem("skytest:solder_wire", {
	description = "Solder Wire",
	inventory_image = "solder_wire.png",
	})
	minetest.register_craftitem("skytest:copper_wire", {
	description = "Copper Wire",
	inventory_image = "copper_wire.png",
	})
	
	
	minetest.register_craftitem("skytest:board_press", {
	description = "Silicon Press Pattern",
	inventory_image = "chip_press.png",
})
minetest.register_craftitem("skytest:diode_press", {
	description = "Diode Press Pattern",
	inventory_image = "diode_press_pattern.png",
})
minetest.register_craftitem("skytest:wire_press_pattern", {
	description = "Wire Press Pattern",
	inventory_image = "solder_wire_press_pattern.png",
})



local percentpattern = {
    {"skytest:board_press", 2},
    {"skytest:diode_press", 4},
    {"skytest:wire_press_pattern", 6},
}
function pattern()
    local chance = math.random(8)
    for _,v in pairs(percentpattern) do
        if chance<v[2] then
            return ItemStack(v[1])
        end
    end
    return nil
end
minetest.register_node("skytest:pattern_crate", {
    description = "Pattern Crate(Rightclick to place then rightclick again to open)",
    tiles = {"a_standtb.png"},
    on_rightclick = function(pos, node)
    minetest.add_item(pos, pattern())
	minetest.set_node(pos, {name="air"})
    end,
})
minetest.register_craft({
        output = "skytest:pattern_crate",
        recipe = {
            {"terumet:item_ceramic","group:tree","terumet:item_ceramic"},
            {"group:tree","default:chest","group:tree"},
            {"terumet:item_ceramic","group:tree","terumet:item_ceramic"},
        }
    })
minetest.register_craft({
        output = "skytest:press",
        recipe = {
            {"skytest:shaker_motor","skytest:quintuple_compressed_cobblestone_59049c","skytest:shaker_motor"},
            {"skytest:shaker_motor","skytest:machine_frame","skytest:shaker_motor"},
            {"terumet:item_coil_tcop","terumet:ingot_cgls","terumet:item_coil_tcop"}
        }
    })