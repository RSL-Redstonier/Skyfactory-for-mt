minetest.register_node("skytest:glow", {
    drawtype = "airlike",
    walkable = false,
    pointable = false,
    diggable = true,
    climbable = false,
    buildable_to = true,
    light_source = 14,
    paramtype = light
})

minetest.register_craft({
    output = "skytest:source",
    recipe = {
        {'default:glass', 'default:glass', 'default:glass'},
        {'default:glass', 'default:torch', 'default:glass'},
        {'default:glass', 'default:glass', 'default:glass'},
    }
})

minetest.register_node("skytest:source", {
    description = "Super Bright Star Light",
  tiles = {"default_obsidian_glass.png^greedy_soul_fragment.png"},
    drawtype = "glasslike",
    groups = { cracky=3, oddly_breakable_by_hand=3 },
    sounds = default.node_sound_glass_defaults(),
    drop = "skytest:source",
    light_source = 14,
    paramtype = light,
    after_place_node = function(pos, placer)
        minetest.get_node_timer(pos):start(1.1)
    end,
    on_destruct = function(pos)
        minetest.get_node_timer(pos):stop()
    end,
    after_destruct = function(pos, oldnode)
        local dist = 6
        local minp = { x=pos.x-dist, y=pos.y-dist, z=pos.z-dist }
        local maxp = { x=pos.x+dist, y=pos.y+dist, z=pos.z+dist }
        local glow_nodes = minetest.find_nodes_in_area(minp, maxp, "skytest:glow")
        for key, npos in pairs(glow_nodes) do
            minetest.remove_node(npos)
            end
    end,
    on_timer = function(pos, elapsed)
        local dist = 6
        local pmod = (pos.x + pos.y + pos.z) %2 
        local minp = { x=pos.x-dist, y=pos.y-dist, z=pos.z-dist }
        local maxp = { x=pos.x+dist, y=pos.y+dist, z=pos.z+dist }
        local air_nodes = minetest.find_nodes_in_area(minp, maxp, "air")
        for key, npos in pairs(air_nodes) do
            if (npos.x + npos.y + npos.z) %2 == pmod then -- 3d checkerboard pattern
                if grounded(npos) then                    -- against lightable surfaces
                    minetest.add_node(npos, {name = "skytest:glow"})
                end
            end
        end
        return true
    end
})

grounded = function(pos)
    -- checks all nodes touching the edges and corners (but not faces) of the given pos
    for nx = -1, 1, 2 do
        for ny = -1, 1, 2 do
            for nz = -1, 1, 2 do
                local npos = { x=pos.x+nx, y=pos.y+ny, z=pos.z+nz }
                local name = minetest.get_node(npos).name
                if minetest.registered_nodes[name].walkable and name ~= "skytest:source" then
                    return true
                end
            end
        end
  end
    return false
end
minetest.register_node("skytest:dust", {
    description = "Dust",
    tiles = {"default_sand.png^[colorize:white:120"},
    groups = {crumbly = 3, falling_node = 1, sand = 1},
emc = 20,
})
minetest.register_node("skytest:pms", {
    description = "Plant Mixed Soil\nSive to get plants",
    tiles = {"default_dirt.png^special_plant_4.png"},
    groups = {crumbly = 3},
emc = 2000,
})
minetest.register_node("skytest:powder", {
    description = "Powder",
    tiles = {"default_sand.png^[colorize:white:200"},
    groups = {crumbly = 3, falling_node = 1, sand = 1},
emc = 200000,
})
minetest.register_node("skytest:enchanted_block", {
    description = "Enchanted block",
        tiles = {"enchanted_block.png"},
        groups = {cracky=1},
})
minetest.register_node("skytest:spectral_block", {
    description = "Spectral block",
        tiles = {"spectral_block.png"},
        groups = {cracky=1},
})
minetest.register_craft({
        output = "skytest:pms 5",
        recipe = {
            {"group:soil","skytest:bonemeal","group:soil"},
            {"group:leaves","group:soil","group:sapling"},
            {"group:soil","group:seed","group:soil"},
        }
    })
	minetest.register_craft({
        output = "skytest:spectral_block",
        recipe = {
            {"skytest:spectral_ingot","skytest:spectral_ingot","skytest:spectral_ingot"},
            {"skytest:spectral_ingot","skytest:spectral_ingot","skytest:spectral_ingot"},
            {"skytest:spectral_ingot","skytest:spectral_ingot","skytest:spectral_ingot"},
        }
    })
minetest.register_node("skytest:world_interaction_simulator", {
    description = "World Interaction Simulator\nWARNING\n very large nodebox",
        tiles = {"enchanted_block.png"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.375, -0.4375, 0.5, 0.375}, -- NodeBox1
			{0.4375, -0.5, -0.375, 0.5, 0.5, 0.375}, -- NodeBox2
			{-0.375, -0.5, -0.5, 0.375, 0.5, -0.4375}, -- NodeBox3
			{-0.375, -0.5, 0.4375, 0.375, 0.5, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, 0.5, 0.3125, 0.5}, -- NodeBox5
			{-0.125, -0.0625, -0.6875, 0.125, 0.125, -0.4375}, -- NodeBox14
			{-0.125, -0.0625, 0.4375, 0.125, 0.125, 0.6875}, -- NodeBox16
			{-0.6875, -0.0625, -0.125, -0.5, 0.125, 0.125}, -- NodeBox19
			{0.5, -0.0625, -0.125, 0.6875, 0.125, 0.125}, -- NodeBox20
			{1.5, -0.5, -0.5, 2.5, 0.5, 0.5}, -- NodeBox21
			{-2.5, -0.5, -0.5, -1.5, 0.5, 0.5}, -- NodeBox22
			{-0.5, -0.5, -2.5, 0.5, 0.5, -1.5}, -- NodeBox23
			{-0.5, -0.5, 1.5, 0.5, 0.5, 2.5}, -- NodeBox24
			{-0.5, 1.875, -0.5, 0.5, 2.875, 0.5}, -- NodeBox25
		}
	},
        groups = {cracky=1},
})
minetest.register_node("skytest:angel_block", {
    description = "Angel block",
        tiles = {"angel.png^wings_item.png"},
        groups = {cracky=1},
	drop = "skytest:angel_item",
})
minetest.register_craftitem("skytest:angel_item", {
    description = "Angel block",
        inventory_image = "angel.png^wings_item.png",
	range = 1,
        stack_max = 99,
	on_use = function(itemstack, user, pointed_thing)
	local pos=user:getpos()
	pos.y=pos.y-0.5
if minetest.get_node(pos).name == "air" then
				minetest.set_node(pos, {name = "skytest:angel_block"})
				itemstack:take_item()
				return itemstack
			end
end,
})
minetest.register_craft({
        output = "skytest:angel_item",
        recipe = {
            {"skytest:enchanted_crystal","default:obsidian","skytest:enchanted_crystal"},
            }
    })
minetest.register_craft({
        output = "skytest:enchanted_block",
        recipe = {
            {"skytest:enchanted_crystal","skytest:enchanted_crystal","skytest:enchanted_crystal"},
            {"skytest:enchanted_crystal","skytest:enchanted_crystal","skytest:enchanted_crystal"},
            {"skytest:enchanted_crystal","skytest:enchanted_crystal","skytest:enchanted_crystal"},
        }
    })
minetest.register_node(":default:cobble", {
    description = "Cobblestone",
	tiles = {"default_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
	emc = 1,
	drop = { 
        max_items = 1,
        items = {{
            items = {'node "default:gravel" 1'},
	    tools ={"skytest:stone_hammer","skytest:steel_hammer","skytest:diamond_hammer","skytest:mese_hammer","gs_tools:stone_sledge"},
	}, {
	    items = {'node "default:cobble" 1'},
      }}
    }
})
minetest.register_node(":default:gravel", {
	description = "Gravel",
	tiles = {"default_gravel.png"},
	groups = {crumbly = 2, falling_node = 1},
	sounds = default.node_sound_gravel_defaults(),
	emc = 3,
	drop = { 
        max_items = 1,
        items = {{
            items = {'node "default:sand" 1'},
	    tools ={"skytest:stone_hammer","skytest:steel_hammer","skytest:diamond_hammer","skytest:mese_hammer","gs_tools:stone_sledge"},
	}, {
	    items = {'node "default:gravel" 1'},
      }}
    }
})
minetest.register_node(":default:sand", {
	description = "Sand",
	tiles = {"default_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
	emc = 5,
	drop = { 
        max_items = 1,
        items = {{
            items = {'node "skytest:dust" 1'},
	    tools ={"skytest:stone_hammer","skytest:steel_hammer","skytest:diamond_hammer","skytest:mese_hammer","gs_tools:stone_sledge"},
}, {
	    items = {'node "default:sand" 1'},
      }}
    }
})
minetest.register_node(":default:leaves", {
	description = "Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
        drop = {
		max_items = 1,
		items = {{
				items = {'default:sapling'},
				rarity = 20,
			},{
				items = {'skytest:silkworm'},
	                	tools ={"skytest:crook"},
  	                     	rarity = 16,
	
			},{
				items = {'default:sapling'},
	               	 	tools ={"skytest:comp_crook"},
				rarity = 4,
			},{
				items = {'skytest:silkworm'},
	                	tools ={"skytest:comp_crook","skytest:mese_comp_crook"},
  	                     	rarity = 4,
	
			},{
				items = {'default:leaves'},
			}}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})
minetest.register_node("skytest:leaf_weight", {
    description = "Leaf weight",
        tiles = {"default_stone.png"},
        groups = {cracky = 3},

            })
minetest.register_node("skytest:infested_leaves", {
    description = "Infested leaves",
	drawtype = "allfaces_optional",
	waving = 1,
        tiles = {"default_leaves.png^[colorize:white:120"},
        groups = {leaves = 1,snappy = 3},
	paramtype = "light",
	is_ground_content = false,
	drop = {
		max_items = 1,
		items = {{
				items = {'skytest:silk'},
	               	 	tools ={"skytest:crook"},
				rarity = 4,
			},{
				items = {'skytest:silk'},
	                	tools ={"skytest:comp_crook"},
  	                     	rarity = 1,
	
			},{
				items = {'skytest:infested_leaves'},
	
			},}
	},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_abm({
	nodenames = {"group:leaves"},
	neighbors = {"skytest:infested_leaves"},
	interval = 3.0,
	chance = 3,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name = "skytest:infested_leaves"})
	end
})
minetest.register_node("skytest:dense_leaves", {
    description = "Dense Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
        tiles = {"default_pine_needles.png^default_acacia_leaves.png^default_aspen_leaves.png^default_leaves.png"},
        groups = {leaves = 1,snappy = 3},
	paramtype = "light",
	is_ground_content = false,
	drop = {
		max_items = 1,
		items = {{
				items = {'skytest:silkworm_queen'},
	               	 	tools ={"skytest:crook"},
				rarity = 20,
			},{
				items = {'skytest:silkworm_queen'},
	                	tools ={"skytest:comp_crook"},
  	                     	rarity = 5,
	
			},{
				items = {'skytest:skytest:dense_leaves'},
	
			},}
	},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_craft({
        output = "skytest:dense_leaves",
        recipe = {
            {"group:leaves","group:leaves","group:leaves"},
            {"group:leaves","default:dirt","group:leaves"},
            {"group:leaves","group:leaves","group:leaves"},
        }
    })
minetest.register_craft({
        output = "skytest:leaf_weight",
        recipe = {
            {"group:tree","group:tree","group:tree"},
            {"group:tree","skytest:silk_mesh","group:tree"},
            {"group:tree","group:tree","group:tree"},
        }
    })


minetest.register_node("skytest:glowstone_block", {
	description = "Glowstone",
	tiles = {"glowstone_block.png"},
	is_ground_content = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
	light_source = 14,
	drop = 'skytest:glowstone 4',
})
minetest.register_node("skytest:redstone_block", {
	description = "Block of Redstone",
	tiles = {"redstone_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("skytest:lapis_block", {
	description = "Block of Lapis Lazuli",
	tiles = {"lapis_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_stone_defaults(),
})
local function count_items()
   local number = 0
   local file = minetest.get_worldpath() .. "/items"
   local output = io.open(file, "w")
   for name, item in pairs(minetest.registered_items) do
      number = number + 1
      output:write(name.."\n")
   end
   io.close(output)
   print("There are "..number.." registered items.")
   minetest.chat_send_player("singleplayer", "There are "..number.." registered items.")
end
minetest.register_node("skytest:item_counter", {
	description = "Counter of items",
	tiles = {"minimap_overlay_round.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_stone_defaults(),
        on_rightclick = count_items,
})

local function active_formspec(fuel_percent, item_percent)
	local formspec = 
		"size[8,8.5]"..
		default.gui_bg..
		default.gui_bg_img..
		default.gui_slots..
		"list[current_name;src;2.75,0.5;1,1;]"..
		"image[3.75,1.5;1,1;gui_furnace_arrow_bg.png^[lowpart:"..
		(item_percent)..":gui_furnace_arrow_fg.png^[transformR270]"..
		"list[current_name;dst;4.75,0.96;2,2;]"..
		"list[current_player;main;0,4.25;8,1;]"..
		"list[current_player;main;0,5.5;8,3;8]"..
		"listring[current_name;dst]"..
		"listring[current_player;main]"..
		"listring[current_name;src]"..
		"listring[current_player;main]"..
		default.get_hotbar_bg(0, 4.25)
	return formspec
end

local inactive_formspec =
	"size[8,8.5]"..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	"list[current_name;src;2.75,0.5;1,1;]"..
	"image[3.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
	"list[current_name;dst;4.75,0.96;2,2;]"..
	"list[current_player;main;0,4.25;8,1;]"..
	"list[current_player;main;0,5.5;8,3;8]"..
	"listring[current_name;dst]"..
	"listring[current_player;main]"..
	"listring[current_name;src]"..
	"listring[current_player;main]"..
	default.get_hotbar_bg(0, 4.25)

--
-- Node callback functions that are the same for active and inactive furnace
--

local function can_dig(pos, player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	return inv:is_empty("dst") and inv:is_empty("src")
end

local function allow_metadata_inventory_put(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	if listname == "src" then
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
local function swap_node(pos, name)
	local node = minetest.get_node(pos)
	if node.name == name then
		return
	end
	node.name = name
	minetest.swap_node(pos, node)
end

local function freezer_node_timer(pos, elapsed)
	--
	-- Inizialize metadata
	--
	local meta = minetest.get_meta(pos)

	local src_time = meta:get_float("src_time") or 0


	local inv = meta:get_inventory()
	local srclist = inv:get_list("src")

	local dstlist = inv:get_list("dst")

	--
	-- Cooking
	--
local function register_freeze(input, output, leftover)
if inv:contains_item("src", ""..input.."") then
	   inv:remove_item("src", ""..input.."")
	   inv:add_item("dst", ""..output.."")
if leftover ~= false then
	   inv:add_item("src", ""..leftover.."")
	end	
end
end
register_freeze("bucket:bucket_water", "default:ice", false)
register_freeze("skytest:bucket_wood_water", "default:ice", "skytest:bucket_wood_empty")
	   

	      

	-- Check if we have cookable content
	return
end

--
-- Node definitions
--

minetest.register_node("skytest:freezer", {
	description = "Freezer",
	tiles = {
		"freezer_top.png", "freezer_top.png",
		"freezer_side.png", "freezer_side.png",
		"freezer_side.png", "freezer_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2,cools_lava=1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

	can_dig = can_dig,

	on_timer = freezer_node_timer,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", inactive_formspec)
		local inv = meta:get_inventory()
		inv:set_size('src', 1)
		inv:set_size('dst', 4)
	end,

	on_metadata_inventory_move = function(pos)
		local timer = minetest.get_node_timer(pos)
		timer:start(1.0)
	end,
	on_metadata_inventory_put = function(pos)
		-- start timer function, it will sort out whether furnace can burn or not.
		local timer = minetest.get_node_timer(pos)
		timer:start(1.0)
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "src", drops)
		default.get_inventory_drops(pos, "dst", drops)
		drops[#drops+1] = "skytest:freezer"
		minetest.remove_node(pos)
		return drops
	end,

	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
})

minetest.register_craft({
	output = "skytest:freezer",
	recipe = {
		{"default:steel_ingot", "default:mese_crystal", "default:steel_ingot"},
		{"default:steel_ingot", "skytest:bucket_clay_water", "default:steel_ingot"},
		{"default:steel_ingot", "default:mese_crystal", "default:steel_ingot"}
	}
})
minetest.register_craft({
      output = "default:snowblock 3",
      type = "shapeless",
      recipe = {
	 "default:ice"
      }
})

minetest.register_privilege("engrave_long_names", "When using the Engraving Table, Player can set names that contain more than 40 characters and/or newlines")

minetest.register_node("skytest:table", {
	description = "Engraving Table",
	tiles = {"engrave_top.png", "engrave_side.png"},
	groups = {choppy=2,flammable=3, oddly_breakable_by_hand=2},
	sounds = default and default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, player)
		local pname=player:get_player_name()
		local stack=player:get_wielded_item()
		if stack:get_count()==0 then
			minetest.chat_send_player(pname, "Please wield the item you want to name, and then click the engraving table again.")
			return
		end
		local idef=minetest.registered_items[stack:get_name()]
		if not idef then
			minetest.chat_send_player(pname, "You can't name an unknown item!")
			return
		end
		local name=idef.description or stack:get_name()
		local what=name or "whatever"
		if stack:get_count()>1 then
			what="stack of "..what
		end
		
		local meta=stack:get_meta()
		if meta then
			local metaname=meta:get_string("description")
			if metaname~="" then
				name=metaname
			end
		end
		local fieldtype = "field"
		if minetest.check_player_privs(pname, {engrave_long_names=true}) then
			fieldtype = "textarea"
		end
		minetest.show_formspec(pname, "engrave", "size[5.5,2.5]"..fieldtype.."[0.5,0.5;5,1;name;Enter a new name for this "..what..";"..name.."]button_exit[1,1.5;3,1;ok;OK]")
	end,
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname=="engrave" and fields.name and fields.ok then
		local pname=player:get_player_name()
		if (#fields.name>40 or string.match(fields.name, "\n", nil, true)) and not minetest.check_player_privs(pname, {engrave_long_names=true}) then
			minetest.chat_send_player(pname, "Insufficient Privileges: Item names that are longer than 40 characters and/or contain newlines require the 'engrave_long_names' privilege")
			return
		end
		
		local stack=player:get_wielded_item()
		if stack:get_count()==0 then
			minetest.chat_send_player(pname, "Please wield the item you want to name, and then click the engraving table again.")
			return
		end
		local idef=minetest.registered_items[stack:get_name()]
		if not idef then
			minetest.chat_send_player(pname, "You can't name an unknown item!")
			return
		end
		local name=idef.description or stack:get_name()
		
		local meta=stack:get_meta()
		if not meta then
			minetest.chat_send_player(pname, "For some reason, the stack metadata couldn't be acquired. Try again!")
			return
		end
		
		if fields.name==name then
			meta:set_string("description", "")
		else
			meta:set_string("description", fields.name)
		end
		--write back
		player:set_wielded_item(stack)
	end
end)
minetest.register_craft({
	output = "skytest:table",
	recipe = {
		{"group:wood", "skytest:enchanted_crystal", "group:wood"},
		{"group:wood", "default:diamond", "group:wood"},
		{"group:wood", "group:wood", "group:wood"},
	},
})
local _pts = minetest.pos_to_string
function minetest.pos_to_string(pos)
	if not pos then
		return "(-,-,-)"
	end
	return _pts(pos)
end

minetest.register_node("skytest:infinwater", {
    description = "Infinite water source",
    paramtype = "light",
    tiles = {
        "freezer_top.png",
        "freezer_top.png",
        "sieve_auto_sieve_side.png",
        "sieve_auto_sieve_side.png",
        "sieve_auto_sieve_side.png",
        "sieve_auto_sieve_side.png"
    },
    groups = {choppy = 2, oddly_breakable_by_hand = 2,liquid_pipe_connect=1},
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
                {-0.5, 0.1875, -0.5, 0.5, 0.19, 0.5},
                {0.5,0.5,-0.5,-0.5,0,-0.4375},
                {-0.5,0.5,-0.5,-0.4375,0,0.5},
                {0.5,0.5,0.5,-0.5,0,0.4375},
                {0.5,0.5,-0.5,0.4375,0,0.5},
                {-0.5, -0.5, -0.5, -0.4375, 0.5, -0.4375},
                {-0.5, -0.5, 0.5, -0.4375, 0.5, 0.4375},
                {0.5, -0.5, 0.5, 0.4375, 0.5, 0.4375},
                {0.5, -0.5, -0.5, 0.4375, 0.5, -0.4375},
                },
        },
	on_rightclick = function(pos, node, player, itemstack, pointed_thing, clicker)
		minetest.set_node(pos, {name="skytest:infinwater_on"})
    end,
})
minetest.register_node("skytest:infinwater_on", {
    description = "Infinite water source",
    paramtype = "light",
    tiles = {
        "freezer_top.png^water.png",
        "freezer_top.png",
        "sieve_auto_sieve_side.png",
        "sieve_auto_sieve_side.png",
        "sieve_auto_sieve_side.png",
        "sieve_auto_sieve_side.png"
    },
    groups = {choppy = 2, oddly_breakable_by_hand = 2,liquid_pipe_connect=1},
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
                {-0.5, 0.1875, -0.5, 0.5, 0.19, 0.5},
                {0.5,0.5,-0.5,-0.5,0,-0.4375},
                {-0.5,0.5,-0.5,-0.4375,0,0.5},
                {0.5,0.5,0.5,-0.5,0,0.4375},
                {0.5,0.5,-0.5,0.4375,0,0.5},
                {-0.5, -0.5, -0.5, -0.4375, 0.5, -0.4375},
                {-0.5, -0.5, 0.5, -0.4375, 0.5, 0.4375},
                {0.5, -0.5, 0.5, 0.4375, 0.5, 0.4375},
                {0.5, -0.5, -0.5, 0.4375, 0.5, -0.4375},
                },
        },
	on_rightclick = function(pos, node, player, itemstack, pointed_thing, clicker)
		minetest.set_node(pos, {name="skytest:infinwater"})
    end,
})
minetest.register_craft({
	output = "skytest:infinwater",
	recipe = {
		{"skytest:bucket_clay_water", "skytest:lapis_block", "skytest:bucket_clay_water"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"skytest:enchanted_crystal", "default:steel_ingot", "skytest:enchanted_crystal"}
	}
})
minetest.register_craft({
	output = "skytest:infinwater",
	recipe = {
		{"bucket:bucket_water", "skytest:lapis_block", "bucket:bucket_water"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"skytest:enchanted_crystal", "default:steel_ingot", "skytest:enchanted_crystal"}
	}
})
minetest.register_craft({
	output = "skytest:infinwater",
	recipe = {
		{"skytest:bucket_wood_water", "skytest:lapis_block", "skytest:bucket_wood_water"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"skytest:enchanted_crystal", "default:steel_ingot", "skytest:enchanted_crystal"}
	}
})
minetest.register_node("skytest:steel_pontoon", {
		description = "Steel Pontoon",
	        paramtype = "light",
		paramtype2 = "facedir",
		climbable = true,
	        is_ground_content = false,
		tiles = {"pontoon_steel.png"},
		liquids_pointable = true,
		groups = {cracky = 1},
                drawtype = "nodebox",
                node_box = {
		type = "fixed",
		fixed = {
			-- top (Y+)
			{-0.4375, 0.4375, 0.375, -0.3125, 0.5, 0.4375},
			{-0.4375, 0.4375, 0.3125, -0.25, 0.5, 0.375},
			{-0.375, 0.4375, 0.25, -0.1875, 0.5, 0.3125},
			{-0.3125, 0.4375, 0.1875, -0.125, 0.5, 0.25},
			{-0.25, 0.4375, 0.125, -0.0625, 0.5, 0.1875},
			{-0.1875, 0.4375, 0.0625, 0, 0.5, 0.125},
			{-0.125, 0.4375, -0, 0.0625, 0.5, 0.0625},
			{-0.0625, 0.4375, -0.0625, 0.125, 0.5, -0},
			{0, 0.4375, -0.125, 0.1875, 0.5, -0.0625},
			{0.0625, 0.4375, -0.1875, 0.25, 0.5, -0.125},
			{0.125, 0.4375, -0.25, 0.3125, 0.5, -0.1875},
			{0.1875, 0.4375, -0.3125, 0.375, 0.5, -0.25},
			{0.25, 0.4375, -0.375, 0.4375, 0.5, -0.3125},
			{0.3125, 0.4375, -0.4375, 0.4375, 0.5, -0.375},
			{0.375, 0.4375, 0.3125, 0.4375, 0.5, 0.4375},
			{0.3125, 0.4375, 0.25, 0.375, 0.5, 0.4375},
			{0.25, 0.4375, 0.1875, 0.3125, 0.5, 0.375},
			{0.1875, 0.4375, 0.125, 0.25, 0.5, 0.3125},
			{0.125, 0.4375, 0.0625, 0.1875, 0.5, 0.25},
			{0.0625, 0.4375, -0, 0.125, 0.5, 0.1875},
			{-0, 0.4375, -0.0625, 0.0625, 0.5, 0.125},
			{-0.0625, 0.4375, -0.125, -0, 0.5, 0.0625},
			{-0.125, 0.4375, -0.1875, -0.0625, 0.5, -0},
			{-0.1875, 0.4375, -0.25, -0.125, 0.5, -0.0625},
			{-0.25, 0.4375, -0.3125, -0.1875, 0.5, -0.125},
			{-0.3125, 0.4375, -0.375, -0.25, 0.5, -0.1875},
			{-0.375, 0.4375, -0.4375, -0.3125, 0.5, -0.25},
			{-0.4375, 0.4375, -0.4375, -0.375, 0.5, -0.3125},
			-- bottom (Y-)
			{-0.4375, -0.5, -0.4375, -0.3125, -0.4375, -0.375},
			{-0.4375, -0.5, -0.375, -0.25, -0.4375, -0.3125},
			{-0.375, -0.5, -0.3125, -0.1875, -0.4375, -0.25},
			{-0.3125, -0.5, -0.25, -0.125, -0.4375, -0.1875},
			{-0.25, -0.5, -0.1875, -0.0625, -0.4375, -0.125},
			{-0.1875, -0.5, -0.125, 0, -0.4375, -0.0625},
			{-0.125, -0.5, -0.0625, 0.0625, -0.4375, 0},
			{-0.0625, -0.5, 0, 0.125, -0.4375, 0.0625},
			{0, -0.5, 0.0625, 0.1875, -0.4375, 0.125},
			{0.0625, -0.5, 0.125, 0.25, -0.4375, 0.1875},
			{0.125, -0.5, 0.1875, 0.3125, -0.4375, 0.25},
			{0.1875, -0.5, 0.25, 0.375, -0.4375, 0.3125},
			{0.25, -0.5, 0.3125, 0.4375, -0.4375, 0.375},
			{0.3125, -0.5, 0.375, 0.4375, -0.4375, 0.4375},
			{0.375, -0.5, -0.4375, 0.4375, -0.4375, -0.3125},
			{0.3125, -0.5, -0.4375, 0.375, -0.4375, -0.25},
			{0.25, -0.5, -0.375, 0.3125, -0.4375, -0.1875},
			{0.1875, -0.5, -0.3125, 0.25, -0.4375, -0.125},
			{0.125, -0.5, -0.25, 0.1875, -0.4375, -0.0625},
			{0.0625, -0.5, -0.1875, 0.125, -0.4375, 0},
			{-0, -0.5, -0.125, 0.0625, -0.4375, 0.0625},
			{-0.0625, -0.5, -0.0625, -0, -0.4375, 0.125},
			{-0.125, -0.5, 0, -0.0625, -0.4375, 0.1875},
			{-0.1875, -0.5, 0.0625, -0.125, -0.4375, 0.25},
			{-0.25, -0.5, 0.125, -0.1875, -0.4375, 0.3125},
			{-0.3125, -0.5, 0.1875, -0.25, -0.4375, 0.375},
			{-0.375, -0.5, 0.25, -0.3125, -0.4375, 0.4375},
			{-0.4375, -0.5, 0.3125, -0.375, -0.4375, 0.4375},
			-- right (X+)
			{0.4375, 0.375, -0.4375, 0.5, 0.4375, -0.3125},
			{0.4375, 0.3125, -0.4375, 0.5, 0.375, -0.25},
			{0.4375, 0.25, -0.375, 0.5, 0.3125, -0.1875},
			{0.4375, 0.1875, -0.3125, 0.5, 0.25, -0.125},
			{0.4375, 0.125, -0.25, 0.5, 0.1875, -0.0625},
			{0.4375, 0.0625, -0.1875, 0.5, 0.125, 0},
			{0.4375, -0, -0.125, 0.5, 0.0625, 0.0625},
			{0.4375, -0.0625, -0.0625, 0.5, -0, 0.125},
			{0.4375, -0.125, 0, 0.5, -0.0625, 0.1875},
			{0.4375, -0.1875, 0.0625, 0.5, -0.125, 0.25},
			{0.4375, -0.25, 0.125, 0.5, -0.1875, 0.3125},
			{0.4375, -0.3125, 0.1875, 0.5, -0.25, 0.375},
			{0.4375, -0.375, 0.25, 0.5, -0.3125, 0.4375},
			{0.4375, -0.4375, 0.3125, 0.5, -0.375, 0.4375},
			-- left (X-)
			{-0.5, 0.375, 0.3125, -0.4375, 0.4375, 0.4375},
			{-0.5, 0.3125, 0.25, -0.4375, 0.375, 0.4375},
			{-0.5, 0.25, 0.1875, -0.4375, 0.3125, 0.375},
			{-0.5, 0.1875, 0.125, -0.4375, 0.25, 0.3125},
			{-0.5, 0.125, 0.0625, -0.4375, 0.1875, 0.25},
			{-0.5, 0.0625, -0, -0.4375, 0.125, 0.1875},
			{-0.5, -0, -0.0625, -0.4375, 0.0625, 0.125},
			{-0.5, -0.0625, -0.125, -0.4375, -0, 0.0625},
			{-0.5, -0.125, -0.1875, -0.4375, -0.0625, -0},
			{-0.5, -0.1875, -0.25, -0.4375, -0.125, -0.0625},
			{-0.5, -0.25, -0.3125, -0.4375, -0.1875, -0.125},
			{-0.5, -0.3125, -0.375, -0.4375, -0.25, -0.1875},
			{-0.5, -0.375, -0.4375, -0.4375, -0.3125, -0.25},
			{-0.5, -0.4375, -0.4375, -0.4375, -0.375, -0.3125},
			-- back (Z+)
			{0.375, -0.4375, 0.4375, 0.4375, -0.3125, 0.5},
			{0.3125, -0.4375, 0.4375, 0.375, -0.25, 0.5},
			{0.25, -0.375, 0.4375, 0.3125, -0.1875, 0.5},
			{0.1875, -0.3125, 0.4375, 0.25, -0.125, 0.5},
			{0.125, -0.25, 0.4375, 0.1875, -0.0625, 0.5},
			{0.0625, -0.1875, 0.4375, 0.125, 0, 0.5},
			{-0, -0.125, 0.4375, 0.0625, 0.0625, 0.5},
			{-0.0625, -0.0625, 0.4375, -0, 0.125, 0.5},
			{-0.125, 0, 0.4375, -0.0625, 0.1875, 0.5},
			{-0.1875, 0.0625, 0.4375, -0.125, 0.25, 0.5},
			{-0.25, 0.125, 0.4375, -0.1875, 0.3125, 0.5},
			{-0.3125, 0.1875, 0.4375, -0.25, 0.375, 0.5},
			{-0.375, 0.25, 0.4375, -0.3125, 0.4375, 0.5},
			{-0.4375, 0.3125, 0.4375, -0.375, 0.4375, 0.5},
			-- front (Z-)
			{-0.4375, -0.4375, -0.5, -0.375, -0.3125, -0.4375},
			{-0.375, -0.4375, -0.5, -0.3125, -0.25, -0.4375},
			{-0.3125, -0.375, -0.5, -0.25, -0.1875, -0.4375},
			{-0.25, -0.3125, -0.5, -0.1875, -0.125, -0.4375},
			{-0.1875, -0.25, -0.5, -0.125, -0.0625, -0.4375},
			{-0.125, -0.1875, -0.5, -0.0625, 0, -0.4375},
			{-0.0625, -0.125, -0.5, 0, 0.0625, -0.4375},
			{0, -0.0625, -0.5, 0.0625, 0.125, -0.4375},
			{0.0625, 0, -0.5, 0.125, 0.1875, -0.4375},
			{0.125, 0.0625, -0.5, 0.1875, 0.25, -0.4375},
			{0.1875, 0.125, -0.5, 0.25, 0.3125, -0.4375},
			{0.25, 0.1875, -0.5, 0.3125, 0.375, -0.4375},
			{0.3125, 0.25, -0.5, 0.375, 0.4375, -0.4375},
			{0.375, 0.3125, -0.5, 0.4375, 0.4375, -0.4375},
			-- center mass 14px
			{-0.4375, -0.4375, -0.4375, 0.4375, 0.4375, 0.4375},
			-- corner frame
			{-0.4375, 0.4375, 0.4375, 0.4375, 0.5, 0.5},
			{-0.4375, -0.5, 0.4375, 0.4375, -0.4375, 0.5},
			{-0.5, -0.5, 0.4375, -0.4375, 0.5, 0.5},
			{0.4375, -0.5, 0.4375, 0.5, 0.5, 0.5},
			{-0.5, 0.4375, -0.4375, -0.4375, 0.5, 0.4375},
			{-0.5, -0.5, -0.4375, -0.4375, -0.4375, 0.4375},
			{0.4375, 0.4375, -0.4375, 0.5, 0.5, 0.4375},
			{0.4375, -0.5, -0.4375, 0.5, -0.4375, 0.4375},
			{-0.5, 0.4375, -0.5, 0.5, 0.5, -0.4375},
			{-0.5, -0.5, -0.5, 0.5, -0.4375, -0.4375},
			{0.4375, -0.4375, -0.5, 0.5, 0.4375, -0.4375},
			{-0.5, -0.4375, -0.5, -0.4375, 0.4375, -0.4375},
			
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
	})
	

		minetest.register_craft({
			output = 'skytest:steel_pontoon',
			recipe = {
				{"default:steel_ingot","","default:steel_ingot"},
				{"","",""},
				{"default:steel_ingot","","default:steel_ingot"},
			}
		})
minetest.register_craft({
	output = "skytest:massive_sapling",
	recipe = {
		{"group:sapling", "group:sapling", "group:sapling"},
		{"group:sapling", "group:sapling", "group:sapling"},
		{"group:sapling", "group:sapling", "group:sapling"}
	}
})
minetest.register_node("skytest:massive_sapling", {
	description = "Massive tree sapling",
	tiles = {"default_sapling.png^default_pine_sapling.png",},
	paramtype = "light",
	walkable=false,
	drawtype = "plantlike",
	sunlight_propagates = false,
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,attached_node = 1, sapling = 1},
on_construct=function(pos)
		minetest.env:get_node_timer(pos):start(20)
	end,
on_timer=function(pos, elapsed)
		if math.random(3)==1 and minetest.get_node_group(minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name, "soil")>0 and minetest.get_node_light(pos)>10 then
		local tree=minetest.get_modpath("skytest").."/schems/masstree.mts"
		minetest.set_node(pos, {name="air"})
				minetest.place_schematic({x=pos.x-10,y=pos.y,z=pos.z-10}, tree, "random", {}, false)
		end
		return true
end,
})





function string.starts(String, Start)
   return string.sub(String,1,string.len(Start))==Start
end

function string.ends(String, End)
   return End=='' or string.sub(String,-string.len(End))==End
end

function saveToFile(fileName, table)
   local file = io.open(minetest.get_worldpath().."/"..fileName..".txt", "w")
   if file then
      file:write(minetest.serialize(table))
      file:close()
   end
end

function loadFromFile(fileName)
    local file = io.open(minetest.get_worldpath().."/"..fileName..".txt", "r")
    if file then
        local fileContent = file:read("*all")
        file:close()
        local deserTable = minetest.deserialize(fileContent)
        if type(deserTable) == "table" then
            return deserTable
        end
    else
--        print("file was null?")
    end
    return nil
end

function splitStringToTable(inputString, splitter)
    local ret = {};
    local tmp;

    if inputString == nil then return nil; end

    if (splitter == nil) then
        table.insert(ret, inputString);
        return ret;
    end

    -- print("inputString: " .. inputString .. ", splitter:" .. splitter);
    local found = true;
    while found do
        local s,e = inputString:find(splitter);
        if s == nil then
            table.insert(ret, inputString);
            found = false;
        else
            -- print("s/e=" .. s .. "/" .. e);
            tmp = inputString:sub(0,s - 1);
            table.insert(ret, tmp);
            inputString = inputString:sub(e + 1);
        end
    end
    -- for k,v in pairs(ret) do print(k,v) end
    return ret;
end


function tableLength(table)
    if (table == nil) then return 0; end
    local count = 0
    for _ in pairs(table) do count = count + 1 end
    return count
end

function clamp(value, min, max)
    if value == nil then return nil; end
    if max == nil and min == nil then return value; end
    if min == nil then return math.min(value, max); end
    if max == nil then return math.max(value, min); end
    return math.max(math.min(value, max), min);
end

function toNum(number, default)
    default = default or 0;
    return tonumber(number) or default;
end

function randomCheck(normalizedIntProb, minValue, maxValue)
    minValue = toNum(minValue, 1);
    maxValue = toNum(maxValue, 100);
    return math.random(1,100) <= toNum(normalizedIntProb);
end



local metaLiquidType = "liquidType"
local metaLiquidLevel = "liquidLevel"
local metaOwner = "owner"

local liquidNone = "none"

local defaultReservoirDescription = "Reservoir"

local steelName = "skytest:steel_reservoir"
local steelMax = 32
local steelTexture = "skytest_steel_reservoir.png"

local obsidianName="skytest:obsidian_reservoir"
local obsidianMax=128
local obsidianTexture="skytest_obsidian_reservoir.png"

local lavaNameSuffix = "_lava"

local reservoir = {}

----------------------------------------------------------------
-- general helper functions
----------------------------------------------------------------

function reservoir.getReservoirItemStack(metadata, itemName)
    local liquidType = metadata:get_string(metaLiquidType) or liquidNone
    local liquidLevel = metadata:get_int(metaLiquidLevel) or 0
    local newStack = ItemStack({name=itemName, count=1, wear=0})
    local stackMeta = newStack:get_meta()
    stackMeta:set_string(metaLiquidType, liquidType)
    stackMeta:set_int(metaLiquidLevel, liquidLevel)
    if liquidLevel == 0 or liquidType == liquidNone then
        stackMeta:set_string("description", defaultReservoirDescription.."\nEmpty")
    else
        stackMeta:set_string("description", defaultReservoirDescription.."\nContains "..liquidLevel.." buckets of " .. liquidType)
    end
    -- print("returning reservoid? stack = " .. dump(itemMeta))
    return newStack
end

function reservoir.dropItem(pos, stack)
    minetest.add_item(pos, stack)"skytest:steel_reservoir"
end

function reservoir.giveItemToPlayer(pos, player, stack)
    local inv = player:get_inventory()
    local leftover = inv:add_item("main", stack)
    if leftover and not leftover:is_empty() then
        -- print("leftover not empty, size = " .. leftover:get_count())
        minetest.item_drop(leftover, player, player:get_pos())
    end
end

function reservoir.get_param2(val, max)
    local ret = math.floor(63*(val/max))
    if val > 0 and ret == 0 then
        ret = 1     -- this ensures we always have at least 1 visible liquid level
    end
    return ret
end

function reservoir.get_infotext(val, max, type, playername)
    if val == 0 then
        return val.."/"..max.." buckets (Empty) owned by: " .. (playername or "")
    else
        return val.."/"..max.." buckets of "..type .." owned by: " .. (playername or "")
    end

end

----------------------------------------------------------------
-- specific functions
----------------------------------------------------------------

function reservoir.can_dig(pos, player)
    local nodeMeta = minetest.get_meta(pos)
    local nodeOwner = nodeMeta:get_string(metaOwner, "")
    local playerName = player:get_player_name()
    return nodeOwner == "" or playerName == nodeOwner or minetest.check_player_privs(playerName, {protection_bypass=true})
end

function reservoir.after_dig_node(pos, oldnode, oldmetadata, digger, itemName)
    local meta = minetest.get_meta(pos)
    meta:from_table(oldmetadata)
    if not digger:is_player() then
        reservoir.dropItem(pos, reservoir.getReservoirItemStack(meta, itemName));
    else
        reservoir.giveItemToPlayer(pos, digger, reservoir.getReservoirItemStack(meta, itemName))
    end
end

function reservoir.on_construct(pos)
    local meta = minetest.get_meta(pos)
    if meta then
        -- print("on construct setting meta..")
        meta:set_string(metaLiquidType, liquidNone)
        meta:set_int(metaLiquidLevel, 0)
    end
end

function reservoir.after_place_node(pos, placer, itemstack, pointed_thing, maxLevel)

    local nodeMeta = minetest.get_meta(pos)
    local stackMeta = itemstack:get_meta()

    if not stackMeta
        or not stackMeta:get_string(metaLiquidType)
        or string.len(stackMeta:get_string(metaLiquidType)) == 0
        or not stackMeta:get_int(metaLiquidLevel) then
        -- print("after place, defaulting to none/0")
        stackMeta:set_string(metaLiquidType, liquidNone)
        stackMeta:set_int(metaLiquidLevel, 0)
    end

    -- print("after place, stackMeta = " .. dump(stackMeta))

    local num = stackMeta:get_int(metaLiquidLevel);
    local type =  stackMeta:get_string(metaLiquidType)
    nodeMeta:set_string(metaLiquidType, type)
    nodeMeta:set_int(metaLiquidLevel, num)
    local playername = ""
    if (placer:is_player()) then
        playername = placer:get_player_name()
    end
    nodeMeta:set_string(metaOwner, playername)
    if stackMeta:get_int(metaLiquidLevel) == 0 then
        nodeMeta:set_string("infotext", reservoir.get_infotext(0, maxLevel, nil, playername))
    else
        nodeMeta:set_string("infotext", reservoir.get_infotext(num, maxLevel, type, playername))
    end
    local node = minetest.get_node(pos)
    if type == "lava" then
        node["name"] = node["name"]..lavaNameSuffix
    end
    node["param2"] = reservoir.get_param2(stackMeta:get_int(metaLiquidLevel), maxLevel)
    minetest.swap_node(pos, node)
end

function reservoir.on_rightclick(pos, node, player, itemstack, pointed_thing, max)
    -- print("on_rightclick_called")
    local itemName = itemstack:get_name()
    local metadata = minetest.get_meta(pos)
    local nodeLiquid = metadata:get_string(metaLiquidType)
    local nodeLiquidLevel = metadata:get_int(metaLiquidLevel)
    local nodeOwner = metadata:get_string(metaOwner, "");
    local playername = ""
    if player:is_player() then
       playername = player:get_player_name()
       if not minetest.check_player_privs(playername, {protection_bypass="true"}) and
        string.len(nodeOwner) > 0 and playername ~= nodeOwner then
           return itemstack -- Not owned, return
       end
    end
    -- print("node param2 was = ".. (nodeLiquidLevel or "nil"))
    if itemName == "bucket:bucket_empty" then
        -- print("empty bucket... must fill if possible")
        if nodeLiquid == liquidNone or nodeLiquidLevel == 0 then
            return itemstack
        end
        nodeLiquidLevel = nodeLiquidLevel - 1
        local nodeName = node["name"]
        if nodeLiquidLevel == 0 and string.ends(nodeName, lavaNameSuffix) then
            node["name"] = string.sub(nodeName, 0, -string.len(lavaNameSuffix)-1)
        end
        node["param2"] = reservoir.get_param2(nodeLiquidLevel, max)
        minetest.swap_node(pos, node)
        if nodeLiquidLevel == 0 then
            metadata:set_string(metaLiquidType, liquidNone)
            metadata:set_string("infotext", reservoir.get_infotext(0, max, nil, playername))
        else
            metadata:set_string(metaLiquidType, nodeLiquid)
            metadata:set_string("infotext", reservoir.get_infotext(nodeLiquidLevel, max, nodeLiquid, playername))
        end
        metadata:set_int(metaLiquidLevel, nodeLiquidLevel)

        local newItemStack = ItemStack("bucket:bucket_"..nodeLiquid)
        if itemstack:get_count() == 1 then
            return newItemStack
        else
            reservoir.giveItemToPlayer(pos, player, newItemStack)
            itemstack:take_item(1)
            return itemstack
        end

    end

    local bucketPrefix = "bucket:bucket_"
    if string.starts(itemName, bucketPrefix) then
        local liquidType = string.sub(itemName,string.len(bucketPrefix)+1,string.len(itemName))
        -- print("liquid type was = "..liquidType)
        if nodeLiquidLevel == max or (liquidType ~= nodeLiquid and not (nodeLiquid == liquidNone)) then
            -- print("can't add, node full or contains another liquid. Node liquid = "..(liquidNode or "nil"))
            return itemstack
        end

        nodeLiquidLevel = nodeLiquidLevel + 1
        node["param2"] = reservoir.get_param2(nodeLiquidLevel, max)
        if liquidType == "lava" and nodeLiquidLevel == 1 then
            node["name"] = node["name"] .. lavaNameSuffix
        end
        minetest.swap_node(pos, node)
        metadata:set_string(metaLiquidType, liquidType)
        metadata:set_int(metaLiquidLevel, nodeLiquidLevel)

        if nodeLiquidLevel == 0 then
            metadata:set_string("infotext", reservoir.get_infotext(0, maxLevel, nil, playername))
        else
            metadata:set_string("infotext", reservoir.get_infotext(nodeLiquidLevel, max, liquidType, playername))
        end

        -- silly, but in case full buckets (aka the ones we're trying to add) were stacked, lets not destroy the stack
        local newItemStack = ItemStack("bucket:bucket_empty")
        if itemstack:get_count() == 1 then
            return newItemStack
        else
            reservoir.giveItemToPlayer(pos, player, newItemStack)
            itemstack:take_item(1)
            return itemstack
        end
    end
end
function reservoir.on_abm_in_water(pos, node, max)
    local metadata = minetest.get_meta(pos)
    local nodeLiquid = metadata:get_string(metaLiquidType)
    local nodeLiquidLevel = metadata:get_int(metaLiquidLevel)
        local liquidType = "water"
        -- print("liquid type was = "..liquidType)
        if nodeLiquidLevel == max or (liquidType ~= nodeLiquid and not (nodeLiquid == liquidNone)) then
            -- print("can't add, node full or contains another liquid. Node liquid = "..(liquidNode or "nil"))
            return
        end

        nodeLiquidLevel = nodeLiquidLevel + 1
        node["param2"] = reservoir.get_param2(nodeLiquidLevel, max)
        minetest.swap_node(pos, node)
        metadata:set_string(metaLiquidType, liquidType)
        metadata:set_int(metaLiquidLevel, nodeLiquidLevel)

end
function reservoir.on_abm_out_water(pos, node, max)
    local metadata = minetest.get_meta(pos)
    local nodeLiquid = metadata:get_string(metaLiquidType)
    local nodeLiquidLevel = metadata:get_int(metaLiquidLevel)
        local liquidType = "water"
        -- print("liquid type was = "..liquidType)
        if nodeLiquidLevel == max or (liquidType ~= nodeLiquid and not (nodeLiquid == liquidNone)) then
            -- print("can't add, node full or contains another liquid. Node liquid = "..(liquidNode or "nil"))
            return
        end

        nodeLiquidLevel = nodeLiquidLevel - 1
        node["param2"] = reservoir.get_param2(nodeLiquidLevel, max)
        minetest.swap_node(pos, node)
        metadata:set_string(metaLiquidType, liquidType)
        metadata:set_int(metaLiquidLevel, nodeLiquidLevel)
end
----------------------------------------------------------------
-- minetest registration
----------------------------------------------------------------

minetest.register_node(steelName, {
	description = defaultReservoirDescription.."\nEmpty",
	drawtype = "glasslike_framed_optional",
	tiles = {steelTexture},
    special_tiles = {"skytest_reservoir_liquid.png"},
	paramtype = "light",
	paramtype2 = "glasslikeliquidlevel",
	is_ground_content = false,
	sunlight_propagates = false,
	sounds = default.node_sound_metal_defaults(),
	groups = {cracky = 3, level = 1,liquid_pipe_connect = 1},
    drop = "",

    can_dig = reservoir.can_dig,

    after_dig_node = function (pos, oldnode, oldmetadata, digger)
        return reservoir.after_dig_node(pos, oldnode, oldmetadata, digger, steelName)
    end,

    on_construct = reservoir.on_construct,

    after_place_node = function (pos, placer, itemstack, pointed_thing)
        return reservoir.after_place_node(pos, placer, itemstack, pointed_thing, steelMax)
    end,

    on_rightclick = function(pos, node, player, itemstack, pointed_thing, max)
        return reservoir.on_rightclick(pos, node, player, itemstack, pointed_thing, steelMax)
    end
})

minetest.register_node(obsidianName, {
	description = defaultReservoirDescription.."\nEmpty",
	drawtype = "glasslike_framed_optional",
	tiles = {obsidianTexture},
    special_tiles = {"skytest_reservoir_liquid.png"},
	paramtype = "light",
	paramtype2 = "glasslikeliquidlevel",
	is_ground_content = false,
	sunlight_propagates = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 3, level = 2,liquid_pipe_connect = 1},
    drop = "",

    can_dig = reservoir.can_dig,

    after_dig_node = function (pos, oldnode, oldmetadata, digger)
        return reservoir.after_dig_node(pos, oldnode, oldmetadata, digger, obsidianName)
    end,

    on_construct = reservoir.on_construct,

    after_place_node = function (pos, placer, itemstack, pointed_thing)
        return reservoir.after_place_node(pos, placer, itemstack, pointed_thing, obsidianMax)
    end,

    on_rightclick = function(pos, node, player, itemstack, pointed_thing, max)
        return reservoir.on_rightclick(pos, node, player, itemstack, pointed_thing, obsidianMax)
    end
})

minetest.register_abm({
	nodenames = {obsidianName},
	neighbors = {"skytest:water_pipe_insert"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
				return reservoir.on_abm_in_water(pos, node, obsidianMax)
	end
})
minetest.register_abm({
	nodenames = {steelName},
	neighbors = {"skytest:water_pipe_insert"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		return reservoir.on_abm_in_water(pos, node, steelMax)
	end
})
minetest.register_abm({
	nodenames = {obsidianName},
	neighbors = {"skytest:empty_pipe_extract"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
				return reservoir.on_abm_out_water(pos, node, obsidianMax)
	end
})
minetest.register_abm({
	nodenames = {steelName},
	neighbors = {"skytest:empty_pipe_extract"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		return reservoir.on_abm_out_water(pos, node, steelMax)
	end
})
-- special lava versions

minetest.register_node(steelName..lavaNameSuffix, {
	description = defaultReservoirDescription.."\nEmpty",
	drawtype = "glasslike_framed_optional",
	tiles = {steelTexture},
    special_tiles = {"skytest_reservoir_liquid_lava.png"},
	paramtype = "light",
	paramtype2 = "glasslikeliquidlevel",
    light_source = default.LIGHT_MAX - 2,
	is_ground_content = false,
	sunlight_propagates = false,
	sounds = default.node_sound_metal_defaults(),
	groups = {cracky = 3, level = 1},
    drop = "",

    can_dig = reservoir.can_dig,

    after_dig_node = function (pos, oldnode, oldmetadata, digger)
        return reservoir.after_dig_node(pos, oldnode, oldmetadata, digger, steelName)
    end,

    on_construct = reservoir.on_construct,

    after_place_node = function (pos, placer, itemstack, pointed_thing)
        return reservoir.after_place_node(pos, placer, itemstack, pointed_thing, steelMax)
    end,

    on_rightclick = function(pos, node, player, itemstack, pointed_thing, max)
        return reservoir.on_rightclick(pos, node, player, itemstack, pointed_thing, steelMax)
    end
})

minetest.register_node(obsidianName..lavaNameSuffix, {
	description = defaultReservoirDescription.."\nEmpty",
	drawtype = "glasslike_framed_optional",
	tiles = {obsidianTexture},
    special_tiles = {"skytest_reservoir_liquid_lava.png"},
	paramtype = "light",
	paramtype2 = "glasslikeliquidlevel",
    light_source = default.LIGHT_MAX - 2,
	is_ground_content = false,
	sunlight_propagates = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 3, level = 2},
    drop = "",

    can_dig = reservoir.can_dig,

    after_dig_node = function (pos, oldnode, oldmetadata, digger)
        return reservoir.after_dig_node(pos, oldnode, oldmetadata, digger, obsidianName)
    end,

    on_construct = reservoir.on_construct,

    after_place_node = function (pos, placer, itemstack, pointed_thing)
        return reservoir.after_place_node(pos, placer, itemstack, pointed_thing, obsidianMax)
    end,

    on_rightclick = function(pos, node, player, itemstack, pointed_thing, max)
        return reservoir.on_rightclick(pos, node, player, itemstack, pointed_thing, obsidianMax)
    end
})

-- Crafting Recipes

minetest.register_craft({
	output = "skytest:steel_reservoir 1",
	recipe = {
		{"default:glass", "default:steel_ingot", "default:glass"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:glass", "default:steel_ingot", "default:glass"}
	}
})

minetest.register_craft({
	output = "skytest:obsidian_reservoir 1",
	recipe = {
		{"default:obsidian_glass", "default:obsidian", "default:obsidian_glass"},
		{"default:obsidian", "default:obsidian", "default:obsidian"},
		{"default:obsidian_glass", "default:obsidian", "default:obsidian_glass"}
	}
})



local cobble_gen_formspec =
	"size[8,6]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	"list[current_player;main;0,1.85;8,1;]" ..
	"list[current_player;main;0,3.08;8,3;8]" ..
	"listring[current_player;main]" ..
	"listring[current_player;main]" ..
	'label[4.5,-0.2;Output]' ..
	"list[context;take_from;4.5,0.3;1,1;]" ..
	"listring[context;take_from]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0,1.85)

local function get_cobble_gen_formspec(inv)
	local formspec = cobble_gen_formspec
	return formspec
end

for name, data in pairs({
    tier1 = {
    desc = "Tier 1",
	int = 15,
	num = 1,
	craft1 = "bucket:bucket_lava",
    },
    tier2 = {
    desc = "Tier 2",
	int = 15,
	num = 4,
	craft1 = "skytest:cobble_gentier1",
    },
	tier3 = {
    desc = "Tier 3",
	int = 10,
	num = 4,
	craft1 = "skytest:cobble_gentier2",
    },
	tier4 = {
    desc = "Tier 4",
	int = 10,
	num = 8,
	craft1 = "skytest:cobble_gentier3",
    },
	tier5 = {
    desc = "Tier 5",
	int = 5,
	num = 8,
	craft1 = "skytest:cobble_gentier4",
    },
	tier6 = {
    desc = "Tier 6",
	int = 5,
	num = 16,
	craft1 = "skytest:cobble_gentier5",
    },
	tier7 = {
    desc = "Tier 7",
	int = 4,
	num = 32,
	craft1 = "skytest:cobble_gentier6",
    },
	tier8 = {
    desc = "Tier 8",
	int = 2,
	num = 64,
	craft1 = "skytest:cobble_gentier7",
    },
	tier9 = {
    desc = "Tier 9",
	int = 1,
	num = 99,
	craft1 = "skytest:cobble_gentier8",
    },
}) do
minetest.register_node("skytest:cobble_gen"..name, {
	description = "Cobble Gen "..data.desc,
	tiles = {"default_lava.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_cobble_gen_formspec(nil))
		meta:set_string( 'infotext', ('Cobble gen '..data.desc))
		local inv = meta:get_inventory()
		inv:set_size('take_from', 1 * 1)
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_cobble_gen_formspec(meta:get_inventory()))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_cobble_gen_formspec(meta:get_inventory()))
	end,
})

minetest.register_abm({
	nodenames = {'skytest:cobble_gen'..name},
	interval = data.int,
	chance = 1,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
			inv:add_item('take_from', "default:cobble "..data.num)
	end
})

if minetest.get_modpath("hopper") and hopper ~= nil and hopper.add_container ~= nil then
	hopper:add_container({
		{"top", "skytest:cobble_gen"..name, "take_from"},
	})
	
end
minetest.register_craft({
	output = "skytest:cobble_gen"..name,
	recipe = {
		{"default:cobble", "default:cobble", "default:cobble"},
		{"bucket:bucket_water", data.craft1, "bucket:bucket_water"},
		{"default:cobble", "default:cobble", "default:cobble"}
	}
})
minetest.register_craft({
	output = "skytest:cobble_gen"..name,
	recipe = {
		{"default:cobble", "default:cobble", "default:cobble"},
		{"skytest:bucket_wood_water", data.craft1, "skytest:bucket_wood_water"},
		{"default:cobble", "default:cobble", "default:cobble"}
	}
})
minetest.register_craft({
	output = "skytest:cobble_gen"..name,
	recipe = {
		{"default:cobble", "default:cobble", "default:cobble"},
		{"skytest:bucket_clay_water", data.craft1, "skytest:bucket_clay_water"},
		{"default:cobble", "default:cobble", "default:cobble"}
	}
})
end



local infinite_chest_formspec =
	"size[8,6]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	'label[2.5,-0.2;Input]' ..
	"list[context;put_in;2.5,0.3;1,1;]" ..
	"list[current_player;main;0,1.85;8,1;]" ..
	"list[current_player;main;0,3.08;8,3;8]" ..
	"listring[current_player;main]" ..
	"listring[context;put_in]" ..
	"listring[current_player;main]" ..
	'label[4.5,-0.2;Output]' ..
	"list[context;take_from;4.5,0.3;1,1;]" ..
	"listring[context;take_from]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0,1.85)

local function get_infinite_chest_formspec(inv)
	local formspec = infinite_chest_formspec
	return formspec
end

for name, data in pairs({
    tier1 = {
    desc = "Tier 1",
	int = 18,
	chan = 5,
	craft1 = "skytest:cosmic_crystal",
	craft2 = "skytest:cosmic_ingot",
	craft3 = "skytest:specdisrupter",
    },
    tier2 = {
    desc = "Tier 2",
	int = 15,
	chan = 5,
	craft1 = "skytest:asem_chest_tier1",
	craft2 = "skytest:cosmic_ingot",
	craft3 = "skytest:cosmic_crystal",
    },
	tier3 = {
    desc = "Tier 3",
	int = 10,
	chan = 4,
	craft1 = "skytest:asem_chest_tier2",
	craft2 = "skytest:cosmic_ingot",
	craft3 = "skytest:cosmic_crystal",
    },
	tier4 = {
    desc = "Tier 4",
	int = 10,
	chan = 3,
	craft1 = "skytest:asem_chest_tier3",
	craft2 = "skytest:cosmic_ingot",
	craft3 = "skytest:cosmic_crystal",
    },
	tier5 = {
    desc = "Tier 5",
	int = 8,
	chan = 2,
	craft1 = "skytest:asem_chest_tier4",
	craft2 = "skytest:cosmic_ingot",
	craft3 = "skytest:cosmic_crystal",
    },
	tier6 = {
    desc = "Tier 6",
	int = 6,
	chan = 2,
	craft1 = "skytest:asem_chest_tier5",
	craft2 = "skytest:cosmic_ingot",
	craft3 = "skytest:cosmic_crystal",
    },
	tier7 = {
    desc = "Tier 7",
	int = 4,
	chan = 2,
	craft1 = "skytest:asem_chest_tier6",
	craft2 = "skytest:cosmic_ingot",
	craft3 = "skytest:cosmic_crystal",
    },
	tier8 = {
    desc = "Tier 8",
	int = 2,
	chan = 1,
	craft1 = "skytest:asem_chest_tier7",
	craft2 = "skytest:cosmic_ingot",
	craft3 = "skytest:cosmic_crystal",
    },
	tier9 = {
    desc = "Tier 9",
	int = 1,
	chan = 1,
	craft1 = "skytest:asem_chest_tier8",
	craft2 = "skytest:cosmic_ingot",
	craft3 = "skytest:cosmic_crystal",
    },
}) do
minetest.register_node("skytest:asem_chest_"..name, {
	description = "Molecular Creation Chest "..data.desc,
	tiles = {"default_chest_top.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2},
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_infinite_chest_formspec(nil))
		meta:set_string( 'infotext', ('Molecular Creation Chest '..data.desc))
		local inv = meta:get_inventory()
		inv:set_size('put_in', 1 * 1)
		inv:set_size('take_from', 1 * 1)
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_infinite_chest_formspec(meta:get_inventory()))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_infinite_chest_formspec(meta:get_inventory()))
	end,
})

minetest.register_abm({
	nodenames = {'skytest:asem_chest_'..name},
	interval = data.int,
	chance = data.chan,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack('put_in', 1)
		local item = stack:get_name('put_in')
		if inv:is_empty('take_from') and not inv:is_empty('put_in') then
			inv:add_item('take_from', stack)
		end
	end
})

if minetest.get_modpath("hopper") and hopper ~= nil and hopper.add_container ~= nil then
	hopper:add_container({
		{"top", "skytest:asem_chest_"..name, "take_from"},
	})
end
minetest.register_craft({
	output = "skytest:asem_chest_"..name,
	recipe = {
		{data.craft2, data.craft3, data.craft2},
		{data.craft3, data.craft1, data.craft3},
		{data.craft2, data.craft3, data.craft2}
	}
})
end

minetest.register_craftitem("skytest:factory_set1", {
	description = "factory set 1",
    inventory_image = "dsu_front.png",
	})
minetest.register_craft({
        output = "skytest:factory_set1",
        recipe = {
            {"","skytest:cobble_factory_tier8",""},
            {"skytest:gravel_factory_tier8","skytest:dust_factory_tier8","skytest:sand_factory_tier8"},
            {"","skytest:dirt_factory_tier8",""},
        }
    })

minetest.register_craftitem("skytest:factory_set2", {
	description = "factory set 2",
    inventory_image = "dsu_front.png",
	})
minetest.register_craft({
        output = "skytest:factory_set2",
        recipe = {
            {"","skytest:terumet_factory_tier8",""},
            {"skytest:flint_factory_tier8","skytest:enchanted_factory_tier8","skytest:clay_factory_tier8"},
            {"","skytest:silk_factory_tier8",""},
        }
    })
	minetest.register_craftitem("skytest:factory_set3", {
	description = "factory set 3",
    inventory_image = "dsu_front.png",
	})
minetest.register_craft({
        output = "skytest:factory_set3",
        recipe = {
            {"","skytest:diamond_factory_tier8",""},
            {"skytest:mese_factory_tier8","skytest:steel_factory_tier8","skytest:tin_factory_tier8"},
            {"","skytest:gold_factory_tier8",""},
        }
    })


minetest.register_craftitem("skytest:factory_full_set", {
	description = "Factory full set",
    inventory_image = "dsu_front.png",
	})
	minetest.register_craft({
        output = "skytest:factory_full_set",
        recipe = {
            {"skytest:factory_set1","skytest:neptonium_ingot","skytest:factory_set2"},
            {"skytest:neptonium_ingot","skytest:factory_set3","skytest:neptonium_ingot"},
        }
    })
local nep_gen_formspec =
	"size[8,6]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	"list[current_player;main;0,1.85;8,1;]" ..
	"list[current_player;main;0,3.08;8,3;8]" ..
	"listring[current_player;main]" ..
	"listring[current_player;main]" ..
	'label[4.5,-0.2;Output]' ..
	"list[context;take_from;4.5,0.3;1,1;]" ..
	"listring[context;take_from]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0,1.85)

local function get_nep_gen_formspec(inv)
	local formspec = nep_gen_formspec
	return formspec
end

minetest.register_node("skytest:neptonium_collector", {
	description = "Neptonium Collector",
	tiles = {
		"collector_top.png",
		"collector_top.png",
		"collector_side.png",
		"collector_side.png",
		"collector_side.png",
		{image = "collector_front.png",animation = {type = "vertical_frames",aspect_w = 16,aspect_h = 16,length = 4},
		}
	},
	paramtype2 = "facedir",
	light_source = 6,
	legacy_facedir_simple = true,
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2},
		on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_nep_gen_formspec(nil))
		meta:set_string( 'infotext', ('Neptonium Collector'))
		local inv = meta:get_inventory()
		inv:set_size('take_from', 1 * 1)
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_nep_gen_formspec(meta:get_inventory()))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_nep_gen_formspec(meta:get_inventory()))
	end,
})
minetest.register_abm({
	nodenames = {'skytest:neptonium_collector'},
	interval = 10,
	chance = 1,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
			inv:add_item('take_from', "skytest:neptonium_nugget")
	end
})

if minetest.get_modpath("hopper") and hopper ~= nil and hopper.add_container ~= nil then
	hopper:add_container({
		{"top", "skytest:neptonium_collector", "take_from"},
	})
end
minetest.register_craft({
	output = "skytest:neptonium_collector",
	recipe = {
		{"skytest:cobble_gentier9", "skytest:star_fuel", "skytest:cobble_gentier9"},
		{"skytest:machine_frame", "skytest:power_core", "skytest:machine_frame"},
		{"skytest:cobble_gentier9", "skytest:machine_frame", "skytest:cobble_gentier9"},
	}
})
--[[

local percentore = {
    "default:dirt",
}
local percentore2 = {
    1,
}
local numofores = 1
for _, ore in pairs(minetest.registered_ores) do
local id = minetest.get_content_id(ore.ore)
table.insert(percentore,id)
table.insert(percentore2,numofores)
numofores = numofores + 1
end
function getore()
    local chance = math.random(numofores)
    for _,v in pairs(percentore) do
		local po1 = percentore[v]
		local po2 = percentore2[v]
         if chance<percentore2[v] then
            return ItemStack(percentore[v])
        end
    end
    return nil
end
minetest.register_node("skytest:ore_crate", {
    description = "Ore Crate\nRight click to place then right click again to open\nCan drop anything from minetest.registered_ores",
    tiles = {"a_standtb.png"},
    on_rightclick = function(pos, node)
    minetest.add_item(pos, getore())
    minetest.add_item(pos, getore())
    minetest.add_item(pos, getore())
	minetest.add_item(pos, getore())
    minetest.add_item(pos, getore())
    minetest.add_item(pos, getore())
    minetest.add_item(pos, getore())
    minetest.add_item(pos, getore())
    minetest.add_item(pos, getore())
	minetest.set_node(pos, {name="air"})
    end,
})
minetest.register_craft({
        output = "skytest:ore_crate",
        recipe = {
            {"default:diamond","default:mese_crystal","default:bronze_ingot"},
            {"default:gold_lump","default:gold_ingot","default:copper_lump"},
            {"default:iron_lump","default:steel_ingot","default:copper_ingot"},
        }

local register_fluid_conduit = function(size,id,description,texture,drops)
minetest.register_node("skytest:"..id, {
	description = description,
	tiles = {texture},
	groups = {choppy = 3, liquid_pipe_connect = 1},
	sounds =  default.node_sound_glass_defaults(),
	paramtype = "light",
	drawtype = "nodebox",
  node_box = {
    type = "connected",
		fixed          = {-size, -size, -size, size,  size, size},
		connect_top    = {-size, -size, -size, size,  0.5,  size}, -- y+
		connect_bottom = {-size, -0.5,  -size, size,  size, size}, -- y-
		connect_front  = {-size, -size, -0.5,  size,  size, size}, -- z-
		connect_back   = {-size, -size,  size, size,  size, 0.5 }, -- z+
		connect_left   = {-0.5,  -size, -size, size,  size, size}, -- x-
		connect_right  = {-size, -size, -size, 0.5,   size, size}, -- x+
  },
	connects_to = {"group:liquid_pipe_connect"},
	drop = drop,
})

end
register_fluid_conduit(4/16,"empty_pipe","Fluid Conduit","automation_pipe.png","skytest:empty_pipe")
register_fluid_conduit(4/16,"water_pipe","Fluid Conduit (water)","automation_pipe_water.png","skytest:empty_pipe")
register_fluid_conduit(4/16,"lava_pipe","Fluid Conduit (lava)","automation_pipe_lava.png","skytest:empty_pipe")
register_fluid_conduit(4/16,"empty_pipe_clearing","Fluid Conduit (clearing)","automation_pipe.png","skytest:empty_pipe")

register_fluid_conduit(4/16,"empty_pipe_extract","Fluid Conduit (extract)","automation_pipe.png^[colorize:black:220","skytest:empty_pipe")
register_fluid_conduit(4/16,"water_pipe_extract","Fluid Conduit (water,extract)","automation_pipe_water.png^[colorize:black:220","skytest:empty_pipe")
register_fluid_conduit(4/16,"lava_pipe_extract","Fluid Conduit (lava,extract)","automation_pipe_lava.png^[colorize:black:220","skytest:empty_pipe")
register_fluid_conduit(4/16,"empty_pipe_clearing_extract","Fluid Conduit (clearing,extract)","automation_pipe.png^[colorize:black:220","skytest:empty_pipe")

register_fluid_conduit(4/16,"empty_pipe_insert","Fluid Conduit (insert)","automation_pipe.png^[colorize:blue:50","skytest:empty_pipe")
register_fluid_conduit(4/16,"water_pipe_insert","Fluid Conduit (water,insert)","automation_pipe_water.png^[colorize:blue:50","skytest:empty_pipe")
register_fluid_conduit(4/16,"lava_pipe_insert","Fluid Conduit (lava,insert)","automation_pipe_lava.png^[colorize:blue:50","skytest:empty_pipe")
register_fluid_conduit(4/16,"empty_pipe_clearing_insert","Fluid Conduit (clearing,insert)","automation_pipe.png^[colorize:blue:50","skytest:empty_pipe")


--fill empty pipes
minetest.register_abm({
	nodenames = {"skytest:empty_pipe"},
	neighbors = {"skytest:water_pipe","skytest:water_pipe_extract"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		minetest.set_node(pos, {name = "skytest:water_pipe"})
	end,
})
minetest.register_abm({
	nodenames = {"skytest:empty_pipe_extract"},
	neighbors = {"skytest:infinwater_on"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		minetest.set_node(pos, {name = "skytest:water_pipe_extract"})
	end,
})



--water pipes

minetest.register_abm({
	nodenames = {"skytest:water_pipe"},
	neighbors = {"skytest:empty_pipe_clearing","skytest:empty_pipe_clearing_extract","skytest:empty_pipe_extract"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		minetest.set_node(pos, {name = "skytest:empty_pipe_clearing"})
	end,
})
minetest.register_abm({
	nodenames = {"skytest:empty_pipe_clearing"},
	interval = 3,
	chance = 1,
	action = function(pos, node)
		minetest.set_node(pos, {name = "skytest:empty_pipe"})
	end,
})

--extract pipes


minetest.register_abm({
	nodenames = {"skytest:water_pipe_extract"},
	neighbors = {"skytest:infinwater","skytest:empty_pipe_clearing"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		minetest.set_node(pos, {name = "skytest:empty_pipe_clearing_extract"})
	end,
})

minetest.register_abm({
	nodenames = {"skytest:empty_pipe_extract"},
	neighbors = {steelName,obsidianName},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		--minetest.set_node(pos, {name = "skytest:water_pipe_extract"})
		local toppos = { pos.x, pos.y+1, pos.z }
		local bottompos = { pos.x, pos.y-1, pos.z }
		local frontpos = { pos.x+1, pos.y, pos.z }
		local backpos = { pos.x-1, pos.y, pos.z }
		local leftpos = { pos.x, pos.y, pos.z+1}
		local rightpos = { pos.x, pos.y, pos.z-1}
		
	local metadatatop = minetest.get_meta(toppos)
	local metadatabottom = minetest.get_meta(bottompos)
	local metadatafront = minetest.get_meta(frontpos)
	local metadataback = minetest.get_meta(backpos)
	local metadataleft = minetest.get_meta(leftpos)
	local metadataright = minetest.get_meta(rightpos)
	
	local nodetop = minetest.get_node(toppos)
	local nodebottom = minetest.get_node(bottompos)
	local nodefront = minetest.get_node(frontpos)
	local nodeback = minetest.get_node(backpos)
	local nodeleft = minetest.get_node(leftpos)
	local noderight = minetest.get_node(rightpos)
	
	local nodeLiquidtop = metadatatop:get_string(metaLiquidType)
	local nodeLiquidbottom = metadatabottom:get_string(metaLiquidType)
	local nodeLiquidfront = metadatafront:get_string(metaLiquidType)
	local nodeLiquidback = metadataback:get_string(metaLiquidType)
	local nodeLiquidleft = metadataleft:get_string(metaLiquidType)
	local nodeLiquidright = metadataright:get_string(metaLiquidType)

	local nodeLiquidLeveltop = metadatatop:get_string(metaLiquidLevel)
	local nodeLiquidLevelbottom = metadatabottom:get_string(metaLiquidLevel)
	local nodeLiquidLevelfront = metadatafront:get_string(metaLiquidLevel)
	local nodeLiquidLevelback = metadataback:get_string(metaLiquidLevel) 
	local nodeLiquidLevelleft = metadataleft:get_string(metaLiquidLevel) 
	local nodeLiquidLevelright = metadataright:get_string(metaLiquidLevel)
	
	local liquidType = "water"
	
	
	--reservoir on top of pipe
	
	
	if nodetop == steelName or nodetop == obsidianName then
		if nodeLiquidLeveltop == obsidianMax or nodeLiquidLeveltop == steelMax or (liquidType ~= nodeLiquidtop and not (nodeLiquidtop == liquidNone)) then
		return
		end
		
		if nodeLiquidLeveltop <= 1 then
		minetest.set_node(pos, {name = "skytest:empty_pipe_extract"})
		else
		minetest.set_node(pos, {name = "skytest:water_pipe_extract"})
		end
	end	
	
		--reservoir on bottem of pipe
	if nodebottom == steelName or nodebottom == obsidianName then
		if nodeLiquidLevelbottom == obsidianMax or nodeLiquidLevelbottom == steelMax or (liquidType ~= nodeLiquidbottom and not (nodeLiquidbottom == liquidNone)) then
		return
		end
		
		if nodeLiquidLevelbottom >= 1 then
		minetest.set_node(pos, {name = "skytest:empty_pipe_extract"})
		else
		minetest.set_node(pos, {name = "skytest:water_pipe_extract"})
		end
	end
	
	
			--reservoir on front of pipe
	if nodefront == steelName or nodefront == obsidianName then
		if nodeLiquidLevelfront == obsidianMax or nodeLiquidLevelfront == steelMax or (liquidType ~= nodeLiquidfront and not (nodeLiquidfront == liquidNone)) then
		return
		end
		
		if nodeLiquidLevelfront >= 1 then
		minetest.set_node(pos, {name = "skytest:empty_pipe_extract"})
		else
		minetest.set_node(pos, {name = "skytest:water_pipe_extract"})
		end
	end
	
	
	
			--reservoir on back of pipe
	if nodeback == steelName or nodeback == obsidianName then
		if nodeLiquidLevelback == obsidianMax or nodeLiquidLevelback == steelMax or (liquidType ~= nodeLiquidback and not (nodeLiquidback == liquidNone)) then
		return
		end
		
		if nodeLiquidLevelback >= 1 then
		minetest.set_node(pos, {name = "skytest:empty_pipe_extract"})
		else
		minetest.set_node(pos, {name = "skytest:water_pipe_extract"})
		end
	end
	
			--reservoir on left of pipe
	if nodeleft == steelName or nodeleft == obsidianName then
		if nodeLiquidLevelleft == obsidianMax or nodeLiquidLevelleft == steelMax or (liquidType ~= nodeLiquidleft and not (nodeLiquidback == liquidNone)) then
		return
		end
		
		if nodeLiquidLevelback >= 1 then
		minetest.set_node(pos, {name = "skytest:empty_pipe_extract"})
		else
		minetest.set_node(pos, {name = "skytest:water_pipe_extract"})
		end
	end
	
			--reservoir on right of pipe
	if noderight == steelName or noderight == obsidianName then
		if nodeLiquidLevelright == obsidianMax or nodeLiquidLevelright == steelMax or (liquidType ~= nodeLiquidright and not (nodeLiquidright == liquidNone)) then
		return
		end
		
		if nodeLiquidLevelright >= 1 then
		minetest.set_node(pos, {name = "skytest:empty_pipe_extract"})
		else
		minetest.set_node(pos, {name = "skytest:water_pipe_extract"})
		end
	end
	
	end,
})

minetest.register_abm({
	nodenames = {"skytest:empty_pipe_clearing_extract"},
	interval = 3,
	chance = 1,
	action = function(pos, node)
		minetest.set_node(pos, {name = "skytest:empty_pipe_extract"})
	end,
})

--insert pipes


minetest.register_abm({
	nodenames = {"skytest:water_pipe_insert"},
	neighbors = {"skytest:empty_pipe_clearing_extract","skytest:empty_pipe_clearing"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		minetest.set_node(pos, {name = "skytest:empty_pipe_clearing_insert"})
	end,
})
minetest.register_abm({
	nodenames = {"skytest:empty_pipe_clearing_insert"},
	interval = 3,
	chance = 1,
	action = function(pos, node)
		minetest.set_node(pos, {name = "skytest:empty_pipe_insert"})
	end,
})

minetest.register_abm({
	nodenames = {"skytest:empty_pipe_insert"},
	neighbors = {"skytest:water_pipe","skytest:water_pipe_extract"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		minetest.set_node(pos, {name = "skytest:water_pipe_insert"})
	end,
})

minetest.register_craft({
	output = 'skytest:empty_pipe 6',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'skytest:silicon', '', 'skytest:silicon'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})




minetest.register_node("skytest:empty_pipe", {
	description = "Fluid Conduit",
	tiles = {"automation_pipe.png"},
	groups = {choppy = 3, liquid_pipe_connect = 1},
	sounds =  default.node_sound_glass_defaults(),
	paramtype = "light",
	drawtype = "nodebox",
  node_box = {
    type = "connected",
		fixed          = {-size, -size, -size, size,  size, size},
		connect_top    = {-size, -size, -size, size,  0.5,  size}, -- y+
		connect_bottom = {-size, -0.5,  -size, size,  size, size}, -- y-
		connect_front  = {-size, -size, -0.5,  size,  size, size}, -- z-
		connect_back   = {-size, -size,  size, size,  size, 0.5 }, -- z+
		connect_left   = {-0.5,  -size, -size, size,  size, size}, -- x-
		connect_right  = {-size, -size, -size, 0.5,   size, size}, -- x+
  },
	connects_to = {"group:liquid_pipe_connect"},
})
minetest.register_node("skytest:empty_pipe_clearing", {
	description = "Fluid Conduit(clearing)",
	tiles = {"automation_pipe.png"},
	groups = {choppy = 3, liquid_pipe_connect = 1},
	sounds =  default.node_sound_glass_defaults(),
	paramtype = "light",
	drawtype = "nodebox",
  node_box = {
    type = "connected",
		fixed          = {-size, -size, -size, size,  size, size},
		connect_top    = {-size, -size, -size, size,  0.5,  size}, -- y+
		connect_bottom = {-size, -0.5,  -size, size,  size, size}, -- y-
		connect_front  = {-size, -size, -0.5,  size,  size, size}, -- z-
		connect_back   = {-size, -size,  size, size,  size, 0.5 }, -- z+
		connect_left   = {-0.5,  -size, -size, size,  size, size}, -- x-
		connect_right  = {-size, -size, -size, 0.5,   size, size}, -- x+
  },
	connects_to = {"group:liquid_pipe_connect"},
})
minetest.register_craft({
	output = 'skytest:empty_pipe 6',
	recipe = {
		{'default:glass', 'default:glass', 'default:glass'},
		{'skytest:silicon', '', 'skytest:silicon'},
		{'default:glass', 'default:glass', 'default:glass'},
	}
})

minetest.register_node("skytest:pipe_water", {
	description = "Pipe with Water",
	tiles = {"automation_pipe_water.png"},
	groups = {choppy = 3, liquid_pipe_connect = 1},
	sounds =  default.node_sound_glass_defaults(),
	paramtype = "light",
	drawtype = "nodebox",
  node_box = {
    type = "connected",
		fixed          = {-size, -size, -size, size,  size, size},
		connect_top    = {-size, -size, -size, size,  0.5,  size}, -- y+
		connect_bottom = {-size, -0.5,  -size, size,  size, size}, -- y-
		connect_front  = {-size, -size, -0.5,  size,  size, size}, -- z-
		connect_back   = {-size, -size,  size, size,  size, 0.5 }, -- z+
		connect_left   = {-0.5,  -size, -size, size,  size, size}, -- x-
		connect_right  = {-size, -size, -size, 0.5,   size, size}, -- x+
  },
	connects_to = {"group:liquid_pipe_connect"},
	drop = "skytest:empty_pipe",
})
minetest.register_node("skytest:pipe_water_exit", {
	description = "Pipe with Water(exit)",
	tiles = {"automation_pipe_water.png^[colorize:black:220"},
	groups = {choppy = 3, liquid_pipe_connect = 1},
	sounds =  default.node_sound_glass_defaults(),
	paramtype = "light",
	drawtype = "nodebox",
  node_box = {
    type = "connected",
		fixed          = {-size, -size, -size, size,  size, size},
		connect_top    = {-size, -size, -size, size,  0.5,  size}, -- y+
		connect_bottom = {-size, -0.5,  -size, size,  size, size}, -- y-
		connect_front  = {-size, -size, -0.5,  size,  size, size}, -- z-
		connect_back   = {-size, -size,  size, size,  size, 0.5 }, -- z+
		connect_left   = {-0.5,  -size, -size, size,  size, size}, -- x-
		connect_right  = {-size, -size, -size, 0.5,   size, size}, -- x+
  },
	connects_to = {"group:liquid_pipe_connect"},
	drop = "skytest:empty_pipe",
})
minetest.register_node("skytest:empty_pipe_exit", {
	description = "Fluid Conduit(exit)",
	tiles = {"automation_pipe.png^[colorize:black:220"},
	groups = {choppy = 3, liquid_pipe_connect = 1},
	sounds =  default.node_sound_glass_defaults(),
	paramtype = "light",
	drawtype = "nodebox",
  node_box = {
    type = "connected",
		fixed          = {-size, -size, -size, size,  size, size},
		connect_top    = {-size, -size, -size, size,  0.5,  size}, -- y+
		connect_bottom = {-size, -0.5,  -size, size,  size, size}, -- y-
		connect_front  = {-size, -size, -0.5,  size,  size, size}, -- z-
		connect_back   = {-size, -size,  size, size,  size, 0.5 }, -- z+
		connect_left   = {-0.5,  -size, -size, size,  size, size}, -- x-
		connect_right  = {-size, -size, -size, 0.5,   size, size}, -- x+
  },
	connects_to = {"group:liquid_pipe_connect"},
	drop = "skytest:empty_pipe",
})

minetest.register_node("skytest:pipe_water_insert", {
	description = "Pipe with Water(insert)",
	tiles = {"automation_pipe_water.png^[colorize:blue:220"},
	groups = {choppy = 3, liquid_pipe_connect = 1},
	sounds =  default.node_sound_glass_defaults(),
	paramtype = "light",
	drawtype = "nodebox",
  node_box = {
    type = "connected",
		fixed          = {-size, -size, -size, size,  size, size},
		connect_top    = {-size, -size, -size, size,  0.5,  size}, -- y+
		connect_bottom = {-size, -0.5,  -size, size,  size, size}, -- y-
		connect_front  = {-size, -size, -0.5,  size,  size, size}, -- z-
		connect_back   = {-size, -size,  size, size,  size, 0.5 }, -- z+
		connect_left   = {-0.5,  -size, -size, size,  size, size}, -- x-
		connect_right  = {-size, -size, -size, 0.5,   size, size}, -- x+
  },
	connects_to = {"group:liquid_pipe_connect"},
	drop = "skytest:empty_pipe",
})
minetest.register_node("skytest:empty_pipe_insert", {
	description = "Fluid Conduit(insert)",
	tiles = {"automation_pipe.png^[colorize:blue:220"},
	groups = {choppy = 3, liquid_pipe_connect = 1},
	sounds =  default.node_sound_glass_defaults(),
	paramtype = "light",
	drawtype = "nodebox",
  node_box = {
    type = "connected",
		fixed          = {-size, -size, -size, size,  size, size},
		connect_top    = {-size, -size, -size, size,  0.5,  size}, -- y+
		connect_bottom = {-size, -0.5,  -size, size,  size, size}, -- y-
		connect_front  = {-size, -size, -0.5,  size,  size, size}, -- z-
		connect_back   = {-size, -size,  size, size,  size, 0.5 }, -- z+
		connect_left   = {-0.5,  -size, -size, size,  size, size}, -- x-
		connect_right  = {-size, -size, -size, 0.5,   size, size}, -- x+
  },
	connects_to = {"group:liquid_pipe_connect"},
	drop = "skytest:empty_pipe",
})
minetest.register_abm({
	nodenames = {"skytest:empty_pipe"},
	neighbors = {"skytest:pipe_water","skytest:pipe_water_exit"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		minetest.set_node(pos, {name = "skytest:pipe_water"})
	end
})
minetest.register_abm({
	nodenames = {"skytest:empty_pipe_exit"},
	neighbors = {"skytest:infinwater_on"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		minetest.set_node(pos, {name = "skytest:pipe_water_exit"})
	end
})
minetest.register_abm({
	nodenames = {"skytest:pipe_water"},
	neighbors = {"skytest:empty_pipe_clearing","skytest:infinwater"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		minetest.set_node(pos, {name = "skytest:empty_pipe_clearing"})
	end
})
minetest.register_abm({
	nodenames = {"skytest:pipe_water"},
	interval = 3,
	chance = 1,
	action = function(pos, node)
		minetest.set_node(pos, {name = "skytest:empty_pipe"})
	end
})
minetest.register_abm({
	nodenames = {"skytest:pipe_water_exit"},
	neighbors = {"skytest:empty_pipe_clearing","skytest:infinwater"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		minetest.set_node(pos, {name = "skytest:empty_pipe_exit"})
	end
})
minetest.register_abm({
	nodenames = {"skytest:pipe_water_exit"},
	interval = 3,
	chance = 1,
	action = function(pos, node)
		minetest.set_node(pos, {name = "skytest:empty_pipe_exit"})
	end
})
minetest.register_abm({
	nodenames = {"skytest:pipe_water","skytest:pipe_water_exit"},
	interval = 3,
	chance = 1,
	action = function(pos, node)
		minetest.set_node(pos, {name = "skytest:empty_pipe"})
	end
})
minetest.register_abm({
	nodenames = {"skytest:empty_pipe_clearing"},
	interval = 3,
	chance = 1,
	action = function(pos, node)
		minetest.set_node(pos, {name = "skytest:empty_pipe"})
	end
})


minetest.register_tool("skytest:pipe_wrench", {
	description = "Conduit Config Wrench",
	inventory_image = "moremesecons_luacontroller_tool.png",
	on_use = function(item, user, pointed_thing)
		pos = pointed_thing.under
			if (minetest.get_node(pos).name == "skytest:empty_pipe") then
			minetest.set_node(pos, {name = "skytest:empty_pipe_extract"})
			elseif (minetest.get_node(pos).name == "skytest:empty_pipe_extract") then
			minetest.set_node(pos, {name = "skytest:empty_pipe_insert"})
			elseif (minetest.get_node(pos).name == "skytest:empty_pipe_insert") then
			minetest.set_node(pos, {name = "skytest:empty_pipe"})
			elseif (minetest.get_node(pos).name == "skytest:water_pipe") then
			minetest.set_node(pos, {name = "skytest:water_pipe_extract"})
			elseif (minetest.get_node(pos).name == "skytest:water_pipe_extract") then
			minetest.set_node(pos, {name = "skytest:water_pipe_insert"})
			elseif (minetest.get_node(pos).name == "skytest:water_pipe_insert") then
			minetest.set_node(pos, {name = "skytest:water_pipe"})
			end
	end,
})

minetest.register_craft({
	output = 'skytest:pipe_wrench',
	recipe = {
		{'default:gold_ingot', '', 'default:gold_ingot'},
		{'', 'skytest:silicon', ''},
		{'', 'skytest:silicon', ''},
	}
})


]]--