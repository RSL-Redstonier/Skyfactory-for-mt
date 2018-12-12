local function register_liquid_wood(source, itemname, inventory_image, name, groups)
	if not (source and itemname and inventory_image and name and type(source) == 'string' and type(itemname) == 'string' and type(inventory_image) == 'string') then
		return
	end

	inventory_image = inventory_image..'^wooden_bucket_overlay.png'
	minetest.register_craftitem(itemname, {
		description = name,
		inventory_image = inventory_image,
		stack_max = 1,
		liquids_pointable = true,
		groups = groups,

		on_place = function(itemstack, user, pointed_thing)
			if not (user and pointed_thing) then
				return
			end

			-- Must be pointing to node
			if pointed_thing.type ~= "node" then
				return
			end

			local node = minetest.get_node_or_nil(pointed_thing.under)
			local ndef = node and minetest.registered_nodes[node.name]

			-- Call on_rightclick if the pointed node defines it
			if ndef and ndef.on_rightclick and
				user and not user:get_player_control().sneak then
				return ndef.on_rightclick(pointed_thing.under, node, user, itemstack)
			end

			local lpos

			-- Check if pointing to a buildable node
			if ndef and ndef.buildable_to then
				-- buildable; replace the node
				lpos = pointed_thing.under
			else
				-- not buildable to; place the liquid above
				-- check if the node above can be replaced
				lpos = pointed_thing.above
				local node = minetest.get_node_or_nil(lpos)
				if not node then
					return
				end

				local above_ndef = node and minetest.registered_nodes[node.name]

				if not above_ndef or not above_ndef.buildable_to then
					-- do not remove the bucket with the liquid
					return itemstack
				end
			end

			if minetest.is_protected(lpos, user and user:get_player_name() or "") then
				return
			end

			minetest.set_node(lpos, {name = source})
			return ItemStack("skytest:bucket_wood_empty")
		end
	})
end

for fluid, def in pairs(bucket.liquids) do
	if not fluid:find('flowing') and not fluid:find('lava') and not fluid:find('molten') and not fluid:find('weightless') then
		local item_name = def.itemname:gsub('[^:]+:bucket', 'skytest:bucket_wood')
		local original = minetest.registered_items[def.itemname]
		if original and item_name and item_name ~= def.itemname then
			local new_name = original.description:gsub('Bucket', 'Wooden Bucket')
			local new_image = original.inventory_image
			register_liquid_wood(fluid, item_name, new_image, new_name, original.groups)
		end
	end
end


minetest.register_craft({
	output = 'skytest:bucket_wood_empty 1',
	recipe = {
		{'group:wood', '', 'group:wood'},
		{'default:stick', 'group:wood', 'default:stick'},
	}
})

minetest.register_craftitem("skytest:bucket_wood_empty", {
	description = "Empty Wooden Bucket",
	inventory_image = "wooden_bucket.png",
	stack_max = 99,
	liquids_pointable = true,
	on_use = function(itemstack, user, pointed_thing)
		-- Must be pointing to node
		if not (user and pointed_thing and pointed_thing.type == "node") then
			return
		end

		-- Check if pointing to a liquid source
		local node = minetest.get_node(pointed_thing.under)
		if not node then
			return
		end

		local liquiddef = bucket.liquids[node.name]
		if not liquiddef or node.name ~= liquiddef.source then
			return
		end

		if minetest.is_protected(pointed_thing.under, user:get_player_name()) then
			return
		end

		if node and node.name:find('lava') or node.name:find('molten') then
			itemstack:set_count(itemstack:get_count() - 1)
			return itemstack
		end

		local item_count = user:get_wielded_item():get_count()

		-- default set to return filled bucket
		local giving_back = liquiddef.itemname:gsub('^[^:]+:bucket', 'skytest:bucket_wood')

		-- check if holding more than 1 empty bucket
		if item_count > 1 then

			-- if space in inventory add filled bucket, otherwise drop as item
			local inv = user:get_inventory()
			if inv:room_for_item("main", {name=giving_back}) then
				inv:add_item("main", giving_back)
			else
				local pos = user:getpos()
				pos.y = math.floor(pos.y + 0.5)
				minetest.add_item(pos, giving_back)
			end

			-- set to return empty buckets minus 1
			giving_back = "skytest:bucket_wood_empty "..tostring(item_count-1)

		end

		minetest.add_node(pointed_thing.under, {name="air"})

		return ItemStack(giving_back)
	end,
})



local function register_liquid_clay(source, itemname, inventory_image, name, groups)
	if not (source and itemname and inventory_image and name and type(source) == 'string' and type(itemname) == 'string' and type(inventory_image) == 'string') then
		return
	end

	inventory_image = inventory_image..'^wooden_bucket_overlay.png^[colorize:red:120'
	minetest.register_craftitem(itemname, {
		description = name,
		inventory_image = inventory_image,
		stack_max = 1,
		liquids_pointable = true,
		groups = groups,

		on_place = function(itemstack, user, pointed_thing)
			if not (user and pointed_thing) then
				return
			end

			-- Must be pointing to node
			if pointed_thing.type ~= "node" then
				return
			end

			local node = minetest.get_node_or_nil(pointed_thing.under)
			local ndef = node and minetest.registered_nodes[node.name]

			-- Call on_rightclick if the pointed node defines it
			if ndef and ndef.on_rightclick and
				user and not user:get_player_control().sneak then
				return ndef.on_rightclick(pointed_thing.under, node, user, itemstack)
			end

			local lpos

			-- Check if pointing to a buildable node
			if ndef and ndef.buildable_to then
				-- buildable; replace the node
				lpos = pointed_thing.under
			else
				-- not buildable to; place the liquid above
				-- check if the node above can be replaced
				lpos = pointed_thing.above
				local node = minetest.get_node_or_nil(lpos)
				if not node then
					return
				end

				local above_ndef = node and minetest.registered_nodes[node.name]

				if not above_ndef or not above_ndef.buildable_to then
					-- do not remove the bucket with the liquid
					return itemstack
				end
			end

			if minetest.is_protected(lpos, user and user:get_player_name() or "") then
				return
			end

			minetest.set_node(lpos, {name = source})
			return ItemStack("skytest:bucket_clay_empty")
		end
	})
end

for fluid, def in pairs(bucket.liquids) do
	if not fluid:find('flowing') then
		local item_name = def.itemname:gsub('[^:]+:bucket', 'skytest:bucket_clay')
		local original = minetest.registered_items[def.itemname]
		if original and item_name and item_name ~= def.itemname then
			local new_name = original.description:gsub('Bucket', 'clay Bucket')
			local new_image = original.inventory_image
			register_liquid_clay(fluid, item_name, new_image, new_name, original.groups)
		end
	end
end
minetest.register_craft({
	type = "cooking",
	output = "skytest:bucket_clay_empty",
	recipe = "skytest:bucket_clay_raw",
})
minetest.register_craft({
	output = 'skytest:bucket_clay_raw',
	recipe = {
		{'skytest:porcelain', '', 'skytest:porcelain'},
		{'', 'skytest:porcelain', ''},
	}
})

minetest.register_craftitem("skytest:bucket_clay_raw", {
	description = "Raw clay Bucket",
	inventory_image = "clay_bucket_raw.png^[colorize:white:120",
	stack_max = 99,
})
minetest.register_craftitem("skytest:bucket_clay_empty", {
	description = "Empty clay Bucket",
	inventory_image = "clay_bucket_raw.png^[colorize:red:120",
	stack_max = 99,
	liquids_pointable = true,
	on_use = function(itemstack, user, pointed_thing)
		-- Must be pointing to node
		if not (user and pointed_thing and pointed_thing.type == "node") then
			return
		end

		-- Check if pointing to a liquid source
		local node = minetest.get_node(pointed_thing.under)
		if not node then
			return
		end

		local liquiddef = bucket.liquids[node.name]
		if not liquiddef or node.name ~= liquiddef.source then
			return
		end

		if minetest.is_protected(pointed_thing.under, user:get_player_name()) then
			return
		end
		local item_count = user:get_wielded_item():get_count()

		-- default set to return filled bucket
		local giving_back = liquiddef.itemname:gsub('^[^:]+:bucket', 'skytest:bucket_clay')

		-- check if holding more than 1 empty bucket
		if item_count > 1 then

			-- if space in inventory add filled bucket, otherwise drop as item
			local inv = user:get_inventory()
			if inv:room_for_item("main", {name=giving_back}) then
				inv:add_item("main", giving_back)
			else
				local pos = user:getpos()
				pos.y = math.floor(pos.y + 0.5)
				minetest.add_item(pos, giving_back)
			end

			-- set to return empty buckets minus 1
			giving_back = "skytest:bucket_clay_empty "..tostring(item_count-1)

		end

		minetest.add_node(pointed_thing.under, {name="air"})

		return ItemStack(giving_back)
	end,
})
minetest.register_craftitem("skytest:philosophers_stone", {
	description = "Philosopher's Stone",
	inventory_image = "ee_philosophers_stone.png",
	stack_max = 1,
	on_use = function(itemstack, user, pointed_thing)
			if user == nil or pointed_thing == nil or pointed_thing.type ~= "node" then
			return nil
		end
			  if minetest.get_node(pointed_thing.under).name == "default:cobble" then
				minetest.set_node(pointed_thing.under, {name = "default:gravel"})
				return itemstack
			end
			  if minetest.get_node(pointed_thing.under).name == "default:stone" then
				minetest.set_node(pointed_thing.under, {name = "default:desert_stone"})
				return itemstack
			end
			  if minetest.get_node(pointed_thing.under).name == "default:desert_stone" then
				minetest.set_node(pointed_thing.under, {name = "default:desert_sand"})
				return itemstack
			end
			if minetest.get_node(pointed_thing.under).name == "default:gravel" then
				minetest.set_node(pointed_thing.under, {name = "default:sand"})
				return itemstack
			end
			if minetest.get_node(pointed_thing.under).name == "default:sand" then
				minetest.set_node(pointed_thing.under, {name = "skytest:dust"})
				return itemstack
			end
			if minetest.get_node(pointed_thing.under).name == "default:acacia_leaves" then
				minetest.set_node(pointed_thing.under, {name = "default:aspen_leaves"})
				return itemstack
			end
			if minetest.get_node(pointed_thing.under).name == "default:aspen_leaves" then
				minetest.set_node(pointed_thing.under, {name = "default:jungleleaves"})
				return itemstack
			end
			if minetest.get_node(pointed_thing.under).name == "default:jungleleaves" then
				minetest.set_node(pointed_thing.under, {name = "default:leaves"})
				return itemstack
			end
			if minetest.get_node(pointed_thing.under).name == "default:leaves" then
				minetest.set_node(pointed_thing.under, {name = "default:pine_needles"})
				return itemstack
			end
			if minetest.get_node(pointed_thing.under).name == "default:pine_needles" then
				minetest.set_node(pointed_thing.under, {name = "default:acacia_leaves"})
				return itemstack
			end
	end,
})

-- Registering Crafts -- 

minetest.register_craft({
	output = "skytest:philosophers_stone",
	recipe = {
		{"default:dirt", "default:dirt", "default:dirt"},
		{"default:dirt", "group:tree", "default:dirt"},
		{"default:dirt", "default:dirt", "default:dirt"}
	}
})
minetest.register_tool("skytest:stone_hammer", {
        description = "Stone Hand Hammer",
        inventory_image = "skytest_hammer_stone.png",
        tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[3]=1.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
    })


minetest.register_craft({
        output = "skytest:stone_hammer",
        recipe = {
            {"","group:stone",""},
            {"","default:stick","group:stone"},
            {"default:stick","",""},
        }
    })
 -----
minetest.register_tool("skytest:steel_hammer", {
        description = "Steel Hand Hammer",
        inventory_image = "skytest_hammer_steel.png",
        tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=2.0, [3]=1.00}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	},
        sound = {breaks = "default_tool_breaks"},
    })
minetest.register_craft({
        output = "skytest:steel_hammer",
        recipe = {
            {"","default:steel_ingot",""},
            {"","default:stick","default:steel_ingot"},
            {"default:stick","",""},
        }
    })
	
	
minetest.register_tool("skytest:mese_hammer", {
        description = "Mese Hand Hammer",
        inventory_image = "skytest_hammer_mese.png",
        tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=30, maxlevel=2},
			crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
        on_use = function(itemstack, user, pointed_thing)
				if user == nil or pointed_thing == nil or pointed_thing.type ~= "node" then
			return nil
		end
				local posch = pointed_thing.under
			local nodech = minetest.get_node(posch)
			  if nodech.name == "skytest:compressed_cobblestone_9c" then
				minetest.add_item(posch, "default:gravel 9")
				minetest.set_node(posch, {name = "air"})
			elseif nodech.name == "skytest:compressed_gravel_9c" then
				minetest.add_item(posch, "default:sand 9")
				minetest.set_node(posch, {name = "air"})
			elseif nodech.name == "skytest:compressed_sand_9c" then
				minetest.add_item(posch, "skytest:dust 9")
				minetest.set_node(posch, {name = "air"})
			end
			return itemstack
	end,
    })
	
				
minetest.register_craft({
        output = "skytest:mese_hammer",
        recipe = {
            {"","default:mese_crystal","default:mese_crystal"},
            {"","default:stick","default:mese_crystal"},
            {"default:stick","",""},
        }
    })
minetest.register_tool("skytest:diamond_hammer", {
        description = "Diamond Hand Hammer",
        inventory_image = "skytest_hammer_diamond.png",
        tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=20, maxlevel=3},
			crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
    })
minetest.register_craft({
        output = "skytest:diamond_hammer",
        recipe = {
            {"","default:diamond",""},
            {"","default:stick","default:diamond"},
            {"default:stick","",""},
        }
    })
minetest.register_craft({
        output = "skytest:crook",
        recipe = {
            {"default:stick","default:stick",""},
            {"","default:stick",""},
            {"","default:stick",""},
        }
    })
minetest.register_craft({
        output = "skytest:comp_crook",
        recipe = {
            {"skytest:crook","skytest:crook",""},
            {"","skytest:crook",""},
            {"","skytest:crook",""},
        }
    })
	minetest.register_craft({
        output = "skytest:mese_comp_crook",
        recipe = {
            {"","default:mese_crystal","default:mese_crystal"},
            {"","skytest:comp_crook",""},
            {"","",""},
        }
    })
minetest.register_craft({
        output = "skytest:leaf_collector",
        recipe = {
            {"","","skytest:crook"},
            {"","default:stick",""},
            {"default:stick","",""},
        }
    })
minetest.register_tool("skytest:crook", {
        description = "Crook",
        inventory_image = "crook.png",
        tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps = {
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=25, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=25, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=25}
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
    })
minetest.register_tool("skytest:comp_crook", {
        description = "Compressed Crook",
        inventory_image = "compressed_crook.png",
        tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps = {
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=100, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=100, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=100}
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
    })
	minetest.register_tool("skytest:mese_comp_crook", {
        description = "Mese Tipped Compressed Crook",
        inventory_image = "compressed_crook.png^[colorize:yellow:60",
        tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps = {
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=100, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=100, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=100}
		},
		damage_groups = {fleshy=6},
	},
on_use = function(itemstack, user, pointed_thing)
		if user == nil or pointed_thing == nil or pointed_thing.type ~= "node" then
			return nil
		end
			local posch = pointed_thing.under
			local nodech = minetest.get_node(posch)
			  if nodech.name == "skytest:infested_leaves" then
				minetest.add_item(posch, "skytest:silk 3")
				minetest.set_node(posch, {name = "air"})
			elseif nodech.name == "default:leaves" then
				minetest.add_item(posch, "skytest:silkworm")
				minetest.set_node(posch, {name = "air"})
			end
			return itemstack
	end,
	sound = {breaks = "default_tool_breaks"},
    })
minetest.register_craftitem("skytest:silkworm", {
        description = "Silkworm",
        inventory_image = "silkworm.png",
        on_use = function(itemstack, user, pointed_thing)
				if user == nil or pointed_thing == nil or pointed_thing.type ~= "node" then
			return nil
		end
			  if minetest.get_node(pointed_thing.under).name == "default:leaves" then
				minetest.set_node(pointed_thing.under, {name = "skytest:infested_leaves"})
				itemstack:take_item()
				return itemstack
			end
	end,
		on_place = minetest.item_eat(1),
    })
minetest.register_tool("skytest:leaf_collector_normal", {
        description = "leaf collector(extra reach)",
        inventory_image = "spears_spear_bronze.png",
        tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps = {
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=30, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=30, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=30}
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
	range = 12,
    })


skytest = {}
skytest.player_inv_width = 8
skytest.get_player_inv_width = function()
	local p = minetest.get_connected_players()
	if p and #p > 0 then
		local i,v = next(p)
		-- I'm kind of assuming that the player inventory has 4 rows, here
		skytest.player_inv_width = math.floor( v:get_inventory():get_size("main") / 4 )
	else
		-- just keep waiting till we get this info
		minetest.after(1.5, skytest.get_player_inv_width)
	end
end

minetest.after(1.5, skytest.get_player_inv_width)

-- break a node and give the default drops

function skytest.drop_node(pos, digger, wielded, rank)
	-- check if we can drop this node
	local node = minetest.get_node(pos)
	local def = ItemStack({name=node.name}):get_definition()

	if not def.diggable or (def.can_dig and not def.can_dig(pos,digger)) then return end
	if minetest.is_protected(pos, digger:get_player_name()) then return end
	if minetest.get_item_group(node.name, "leaves") == 0 then return end
	local level = minetest.get_item_group(node.name, "level")
	if rank >= level then
		local drops = minetest.get_node_drops(node.name, wielded:get_name())
		minetest.handle_node_drops(pos, drops, digger)
		minetest.remove_node(pos)
	end
end
function skytest.get_3x3s(pos, digger)
	local r = {}
	
	local a = 0		-- forward/backward
	if math.abs(pos.x - digger:getpos().x) > 
		math.abs(pos.z - digger:getpos().z) then a = 1 end -- sideways

	local b = 0		-- horizontal (default)
	local q = digger:get_look_pitch()
	if q < -0.78 or q > 0.78 then b = 1 end  -- vertical

	local c = 1
	for x=-1,1 do
	for y=-1,1 do
		if x ~= 0 or y ~= 0 then
			-- determine next perpendicular node
			local k = {x=0, y=0, z=0}
			if a > 0 then
				k.z = pos.z + x
				if b > 0 then
					k.x = pos.x + y
					k.y = pos.y
				else
					k.x = pos.x
					k.y = pos.y + y
				end
			else
				k.x = pos.x + x
				if b > 0 then
					k.y = pos.y
					k.z = pos.z + y
				else
					k.y = pos.y + y
					k.z = pos.z
				end
			end

			r[c] = {x=k.x, y=k.y, z=k.z}
			c = c + 1
		end
	end
	end

	return r
end

-- make a list of supported nodes that a chopped node has just dropped

function skytest.get_chopped(pos, group)
	local r = {}

	-- did the chopped pos have a neighboring log node?
	local b = 0
	local p = {x=pos.x - 1,y=pos.y,z=pos.z}
	if minetest.get_item_group(minetest.get_node(p).name, group) > 0 then b = 1 end
	p.x = p.x + 2
	if minetest.get_item_group(minetest.get_node(p).name, group) > 0 then b = 1 end
	p.x = p.x - 1
	p.z = p.z - 1
	if minetest.get_item_group(minetest.get_node(p).name, group) > 0 then b = 1 end
	p.z = p.z + 2
	if minetest.get_item_group(minetest.get_node(p).name, group) > 0 then b = 1 end

	-- if not, then proceed
	local c = 1
	while b == 0 do
		p.y = p.y + 1
		b = -1

		-- 3x3s upward till we run out of tree
		for x=-1,1 do
		for z=-1,1 do
			p.x = pos.x + x
			p.z = pos.z + z
			if minetest.get_item_group(minetest.get_node(p).name, group) > 0 then
				b = 0
				r[c] = {x=p.x, y=p.y, z=p.z}
				c = c + 1
			end
		end
		end
	end
	return r
end
function skytest.after_collector(pos, oldnode, digger)
	if digger then
		local wielded = digger:get_wielded_item()
		local rank = minetest.get_item_group(wielded:get_name(), "collector")
		if rank > 0 then
			for _,k in ipairs(skytest.get_3x3s(pos, digger)) do
				skytest.drop_node(k, digger, wielded, rank)
			end
		end
	end
end

-- register_on_dignode is used here because after_use does not provide position
-- which is somewhat annoying
minetest.register_on_dignode(skytest.after_collector)

minetest.register_tool("skytest:leaf_collector_3x3x1", {
        description = "leaf collector(3x3x1)",
        inventory_image = "spears_spear_bronze.png",
	groups = {collector=1},
        tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps = {
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=70, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=70, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=70}
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
	range = 12,
    })

minetest.register_craft({
        output = "skytest:leaf_collector_normal",
        recipe = {
            {"skytest:crook","",""},
            {"","default:stick",""},
            {"","","default:stick"},
        }
    })
minetest.register_craft({
        output = "skytest:leaf_collector_3x3x1",
        recipe = {
            {"skytest:crook","skytest:crook","skytest:crook"},
            {"skytest:crook","skytest:leaf_collector_normal","skytest:crook"},
            {"skytest:crook","skytest:crook","skytest:crook"},
        }
    })
minetest.register_craft({
        output = "skytest:leaf_collector_3x3x1",
        recipe = {
            {"","",""},
            {"skytest:comp_crook","skytest:leaf_collector_normal","skytest:comp_crook"},
            {"","",""},
        }
    })

minetest.register_tool("skytest:mba", {
	description = "Mouth breather assembly",
	range = 1,
	inventory_image = "hook_mba.png",
on_use=function(itemstack, user, pointed_thing)
	local pos=user:getpos()
	pos.y=pos.y+1.5
	if minetest.registered_nodes[minetest.get_node(pos).name].drowning==0 then
		itemstack:set_wear(1)
	else
		local use=itemstack:get_wear()+(65536/10)
		if use<65536 then
			itemstack:set_wear(use)
			user:set_breath(11)
		end
	end
	return itemstack
end,
})

minetest.register_craft({
	output = "skytest:mba",
	recipe = {
		{"","default:steel_ingot",""},
		{"default:steel_ingot","default:steel_ingot","default:steel_ingot"},
		{"default:steel_ingot","","default:steel_ingot"},
	}
})

minetest.register_tool("skytest:snorkle", {
	description = "snorkle",
	inventory_image = "airtanks_breathing_tube.png",
	range = 1,
	on_use = function(itemstack, user, pointed_thing)
		local pos=user:getpos()
		pos.y=pos.y+10.5
		if minetest.registered_nodes[minetest.get_node(pos).name].drowning==0 then
		user:set_breath(11)
		minetest.sound_play("airtanks_gasp", {pos = pos, gain = 0.3, max_hear_distance = 10})
		end
	end,
})

minetest.register_craft({
	output = 'skytest:snorkle',
	recipe = {
		{"","","pipeworks:tube_1"},
		{"pipeworks:tube_1","","pipeworks:tube_1"},
		{"pipeworks:tube_1","pipeworks:tube_1","pipeworks:tube_1"},
	}
})


minetest.register_craft({
    output = "skytest:ultimate_pick",
    recipe = {
            {"skytest:spectral_ingot","skytest:neptonium_crystal","skytest:spectral_ingot"},
            {"","skytest:power_core",""},
            {"","skytest:cosmic_ingot",""},
}
})
minetest.register_craft({
    output = "skytest:ultimate_axe",
    recipe = {
            {"skytest:spectral_ingot","skytest:neptonium_crystal",""},
            {"skytest:spectral_ingot","skytest:power_core",""},
            {"","skytest:cosmic_ingot",""},
}
})
minetest.register_craft({
    output = "skytest:ultimate_shovel",
    recipe = {
            {"","skytest:neptonium_crystal",""},
            {"","skytest:power_core",""},
            {"","skytest:cosmic_ingot",""},
}
})

minetest.register_tool("skytest:ultimate_pick", {
	description = "Cosmic Pickaxe",
	inventory_image = "infinity_pickaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=0.001, [2]=0.01, [3]=0.01}, uses=450, maxlevel=10},
		},
		damage_groups = {fleshy=24},
	},
})

minetest.register_tool("skytest:ultimate_shovel", {
	description = "Cosmic Shovel",
	inventory_image = "infinity_shovel.png",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
                 crumbly = {times={[1]=0.001, [2]=0.01, [3]=0.01}, uses=450, maxlevel=10},			
                  },
		damage_groups = {fleshy=15},
	},
})

minetest.register_tool("skytest:ultimate_axe", {
	description = "Cosmic Axe",
	inventory_image = "infinity_axe.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=0.01, [2]=0.01, [3]=0.01}, uses=450, maxlevel=10},
		},
		damage_groups = {fleshy=24},
	},
})


minetest.register_tool("skytest:disrupter", {
	description = "Node Disrupter",
	inventory_image = "disrupter.png",
	on_use = function (itemstack, user, pointed_thing)
		if pointed_thing.under ~= nil then
			local node = minetest.env:get_node(pointed_thing.under)
			local nodedat = minetest.registered_nodes[node.name]
			if nodedat.groups.undisruptable ~= nil or nodedat.diggable == false then
				--
			else
				itemstack:add_wear(65535/15000)
				if nodedat.on_disrupt == nil then
					minetest.remove_node(pointed_thing.under)
					minetest.add_item(pointed_thing.under, node.name)
				else
					itemstack = nodedat.on_disrupt(itemstack, user, pointed_thing)
				end
			end

			return itemstack
		end
	end
})

minetest.register_tool("skytest:specdisrupter", {
	description = "Node Enhancer",
	inventory_image = "extracter.png",
	liquids_pointable = true,
	on_use = function (itemstack, user, pointed_thing)
		if pointed_thing.under ~= nil then
			local node = minetest.env:get_node(pointed_thing.under)
			local nodedat = minetest.registered_nodes[node.name]
				itemstack:add_wear(65535/15000)
				if nodedat.on_disrupt == nil then
				minetest.remove_node(pointed_thing.under)
					minetest.add_item(pointed_thing.under, node.name)
                                        minetest.add_item(pointed_thing.under, node.name)
				else
					itemstack = nodedat.on_disrupt(itemstack, user, pointed_thing)
				end
			return itemstack
		end
	end
})


minetest.register_craft({
	output = 'skytest:disrupter',
	recipe = {
		{'default:steel_ingot', 'default:obsidian_shard', 'default:steel_ingot'},
		{'', 'default:steel_ingot', ''},
		{'', 'default:steel_ingot', ''},
	}
})
minetest.register_craft({
	output = 'skytest:specdisrupter',
	recipe = {
		{'skytest:disrupter', 'skytest:neptonium_crystal', 'skytest:disrupter'},
		{'skytest:power_core', 'skytest:disrupter', 'skytest:power_core'},
		{'skytest:disrupter', 'skytest:neptonium_crystal', 'skytest:disrupter'},
	}
})


minetest.register_craft({
	output = "skytest:ultimate_paxel",
	recipe = {
		{"skytest:ultimate_pick", "skytest:ultimate_shovel","skytest:ultimate_axe"},
		{"skytest:neptonium_crystal", "skytest:cosmic_crystal","skytest:neptonium_crystal"},
		{"", "skytest:spectral_block",""},
	}
})
minetest.register_tool("skytest:ultimate_paxel_on", {
	description = "Cosmic Annihilation",
	inventory_image = "infinity_tool2.png",
	tool_capabilities = {
		full_punch_interval = 0.01,
		max_drop_level=3,
		groupcaps={
			choppy = {times={[1]=0.01, [2]=0.01, [3]=0.01}, uses=50, maxlevel=10},
			crumbly = {times={[1]=0.01, [2]=0.01, [3]=0.01}, uses=50, maxlevel=10},
			cracky = {times={[1]=0.01, [2]=0.01, [3]=0.01}, uses=50, maxlevel=10},
		},
		damage_groups = {fleshy=1000000},
	},
			range = 50,
       on_place = function(itemstack, user, pointed_thing)
		itemstack:replace("skytest:ultimate_paxel")
		return itemstack
	end
})
minetest.register_tool("skytest:ultimate_paxel", {
	description = "Cosmic Hammer",
	inventory_image = "infinity_tool1.png",
	tool_capabilities = {
		full_punch_interval = 0.01,
		max_drop_level=3,
		groupcaps={
			choppy={times={[1]=2.10, [2]=0.90, [3]=0.50}, uses=30, maxlevel=3},
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=30, maxlevel=3},
			cracky = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=100},
	},
			range = 25,
   on_place = function(itemstack, user, pointed_thing)
		itemstack:replace("skytest:ultimate_paxel_on")
		return itemstack
	end
})
local hook_tmp_throw={}
local hook_tmp_throw_timer=0
local hook_tmp_time= tonumber(minetest.setting_get("item_entity_ttl"))
hook={}
if hook_tmp_time=="" or hook_tmp_time==nil then
	hook_tmp_time=890
else
	hook_tmp_time=hook_tmp_time-10
end

local function slingshot_onuse(itemstack, user)
	local veloc=15
	local pos = user:getpos()
	local upos={x=pos.x,y=pos.y+2,z=pos.z}
	local dir = user:get_look_dir()
	local item=itemstack:to_table()
	local mode=minetest.deserialize(item["metadata"])
	if mode==nil then mode=1 else mode=mode.mode end

	local item=user:get_inventory():get_stack("main", user:get_wield_index()+mode):get_name()
	if item=="" then return itemstack end
	local e=minetest.add_item({x=pos.x,y=pos.y+2,z=pos.z},item)
	e:setvelocity({x=dir.x*veloc, y=dir.y*veloc, z=dir.z*veloc})
	e:setacceleration({x=dir.x*-3, y=-5, z=dir.z*-3})
	e:get_luaentity().age=hook_tmp_time
	table.insert(hook_tmp_throw,{ob=e,timer=2,user=user:get_player_name()})

	if item=="hook:slingshot" then
	itemstack:set_wear(9999999)
	end

	user:get_inventory():remove_item("main", item)
	minetest.sound_play("hook_throw", {pos=pos, gain = 1.0, max_hear_distance = 5,})
	return itemstack
end



minetest.register_tool("skytest:slingshot", {
	description = "Slingshot",
	range = 4,
	inventory_image = "hook_slingshot.png",
        on_use=function(itemstack, user, pointed_thing)
	if pointed_thing.ref and pointed_thing.ref:is_player()==false and pointed_thing.ref:get_luaentity().name=="__builtin:item" then
		pointed_thing.ref:punch(user, {full_punch_interval=1.0,damage_groups={fleshy=4}}, "default:bronze_pick", nil)
		return itemstack
	end
	slingshot_onuse(itemstack, user)
	return itemstack
end,
on_place=function(itemstack, user, pointed_thing)
	local item=itemstack:to_table()
	local meta=minetest.deserialize(item["metadata"])
	local mode=0
	if meta==nil then meta={} mode=1 end
	if meta.mode==nil then meta.mode=1 end
	mode=(meta.mode)
	if mode==1 then
		mode=-1
		minetest.chat_send_player(user:get_player_name(), "Use stack to left")
	else
		mode=1
		minetest.chat_send_player(user:get_player_name(), "Use stack to right ")
	end
	meta.mode=mode
	item.metadata=minetest.serialize(meta)
	itemstack:replace(item)
	return itemstack
end

})

minetest.register_craft({
	output = "skytest:slingshot",
	recipe = {
		{"default:steel_ingot","","default:steel_ingot"},
		{"","default:steelblock",""},
		{"","default:steel_ingot",""},
	}
})

local enable_chat_warn="YES"  --set to "NO" to turn off all chat error messages from this mod


local bridgetool = {
  --set this value to something higher than zero if you want bridge tool to wear out
	WEAR_PER_USE=1
}

local mode_text = {
	{"Forward"},
	{"Down"},
	{"Up"}
  }


function yaw_in_degrees(player)
  local yaw = player:get_look_yaw()*180/math.pi-90
  while yaw < 0 do yaw=yaw+360 end
  while yaw >360 do yaw=yaw-360 end
  return yaw
  end

function rotate_yaw(yaw,rotate)
  local newyaw=yaw+rotate
  if newyaw>360 then newyaw=newyaw-360 end
  if newyaw<0 then newyaw=newyaw+360 end
  return newyaw
end --rotate_yaw


--returns a node that has been offset in the indicated direction
--0+z,90-x,180-z,270+x: and <0 down -y,    >360 up +y
--I really could have, and probably should have, done this in radians.
--But I've always liked degrees better.
function offset_pos(posin,yaw)
  --print("** offset_pos yaw=",yaw," posin=",pos_to_string(posin))
  local posout = {x=posin.x,y=posin.y,z=posin.z}
  if yaw<0 then                  --DOWN
    posout.y=posout.y-1
  elseif yaw>360 then            --UP
    posout.y=posout.y+1
  elseif yaw>315 or yaw<45 then  --FORWARD
    posout.z=posout.z+1
  elseif yaw<135 then            --RIGHT
    posout.x=posout.x-1
  elseif yaw<225 then            --BACK
    posout.z=posout.z-1
  else                           --LEFT
    posout.x=posout.x+1
  end --yaw
  return posout
end --offset_pos



--because built in pos_to_string doesn't handle nil
function pos_to_string(pos)
  if pos==nil then return "(nil)"
  else return minetest.pos_to_string(pos)
  end --poss==nill
end --pos_to_string


--attempts to place the item and update inventory
function item_place(stack,player,pointed,inv,idx,mode,firststairface)
  if firststairface==nil then firststairface=-2 end
  local player_name = player:get_player_name()
  --minetest.chat_send_player(player_name,"--placing pointed.type="..pointed.type.." above "..pos_to_string(pointed.above).." under "..pos_to_string(pointed.under).." stack="..stack:to_string())
  local success
  stack, success = minetest.item_place(stack, player, pointed)
  if success then  --if item was placed, put modified stack back in inv
    inv:set_stack("main", idx, stack)
    --also check for rotation of stairs
    local itemname=stack:get_name()
    --minetest.chat_send_player(player_name,"name="..itemname.." gig="..minetest.get_item_group(itemname,"stairs"))
    --should be able to do this with get_item_group but I cant make it work
    if itemname~=nil and string.len(itemname)>7 and
         string.sub(itemname,1,7)=="stairs:" then      --and item is stairs
      local node = minetest.get_node(pointed.above)
      --if firststairface is set, then make all other stairs match same direction
      if firststairface>-1 and node.param2~=firststairface then
        node.param2=firststairface
        minetest.swap_node(pointed.above, node)
      elseif mode~=nil and mode==1 or mode==2 then   -- if mode=1(fwd) or 2(down) need to rotate stair
        node.param2=node.param2+2
        if node.param2>3 then node.param2=node.param2-4 end
        minetest.swap_node(pointed.above, node)
      end
      firststairface=node.param2
    end --stair
  end --success
  return stack,success,firststairface
end --item_place


-- add wear and tear to the bridge tool
function bridgetool_wear(item)
  if bridgetool.WEAR_PER_USE > 0 then
    local item_wear = tonumber(item:get_wear())
  	item_wear = item_wear + bridgetool.WEAR_PER_USE
    if item_wear > 65535 then
  		item:clear()
  		return item
  	end
  	item:set_wear(item_wear)
  	return item
  else
    return item
  end
end --bridgetool_wear


--This function is for use when the bridge tool is right clicked
--it finds the inventory item stack immediatly to the right of the bridge tool
--and then places THAT stack (if possible)
function bridgetool_place(item, player, pointed)
   local player_name = player:get_player_name()  --for chat messages
  --find index of item to right of wielded tool
  --(could have gotten this directly from item I suppose, but this works fine)
  local idx = player:get_wield_index() + 1
  local inv = player:get_inventory()
  local stack = inv:get_stack("main", idx) --stack=stack to right of tool
  if stack:is_empty() then
    if enable_chat_warn=="YES" then
      minetest.chat_send_player(player_name,"bridge tool: no more material to place in stack to right of bridge tool")
    end --chat_warn
  end --stack:is_empty
  if stack:is_empty()==false and pointed ~= nil then
    local success
    local yaw = yaw_in_degrees(player)  --cause degrees just work better for my brain
    --------------
    local mode
    local width
    mode,width=get_bridgetool_meta(item)
    if not mode then
      item=bridgetool_switchmode(item,player,pointed)
      mode,width=get_bridgetool_meta(item)
    end

    --minetest.chat_send_player(player_name, "pointed.type="..pointed.type.." above "..pos_to_string(pointed.above).." under "..pos_to_string(pointed.under).." yaw="..yaw.." mode="..mode)
    if pointed.type=="node" and pointed.under ~= nil then
      --all three modes start by placing a block forward in the yaw direction
      --under does not change, but above is altered to point to node forward(yaw) from under
      pointed.above=offset_pos(pointed.under,yaw)
      local holdforward=pointed.above   --store for later deletion in mode 2 and 3
      local firststairface
      stack,success,firststairface=item_place(stack,player,pointed,inv,idx,mode,-1)  --place the forward block
      if not success then
        if enable_chat_warn=="YES" then
          minetest.chat_send_player(player_name, "bridge tool: unable to place Forward at "..pos_to_string(pointed.above))
        end --chat_warn
      elseif mode==2 or mode==3 then --elseif means successs=true, check Mode up or down
        --mode 2 and 3 then add another block either up or down from the forward block
        --and remove the forward block
        ---move pointed under to the new block you just placed
        pointed.under=pointed.above
        if mode==2 then
          --try to place beneath the new block
          pointed.above=offset_pos(pointed.under,-1)
        else --mode==3
          --try to place above the new block
          pointed.above=offset_pos(pointed.under,999)
        end --mode 2 - 3
        stack,success=item_place(stack,player,pointed,inv,idx,mode,firststairface)
        if not success then
          if enable_chat_warn=="YES" then
            minetest.chat_send_player(player_name, "bridge tool: unable to place "..mode_text[mode][1].." at "..pos_to_string(pointed.above))
          end --chat_warn
        end --if not success block 2
        --remove the extra stone whether success on block 2 or not
        minetest.node_dig(holdforward,minetest.get_node(holdforward),player)
      end -- if not success block 1 elseif succes block 1 and mode 2 or 3

      --now try for the width
      if success then  --only proceed with width if last block placed was a success
        item=bridgetool_wear(item)
        for w=2,width do
          pointed.under=pointed.above --block 2 is now the under block
          local right90=rotate_yaw(yaw,-90)
          pointed.above=offset_pos(pointed.under,right90)
          --minetest.chat_send_player(player_name, " yaw="..yaw.." right90="..right90.." under="..pos_to_string(pointed.under).." above="..pos_to_string(pointed.above))
          stack,success=item_place(stack,player,pointed,inv,idx,mode,firststairface)
          if not success then
            if enable_chat_warn=="YES" then
              minetest.chat_send_player(player_name, "bridge tool: unable to place width "..w.." at "..pos_to_string(pointed.above))
            end --chat_warn
            break
          else
            item=bridgetool_wear(item)
          end --if not success
        end --for
      end --if success

    end --pointed.type="node" and pointed.under~=nil
  end --pointed ~= nil
return item
end --function bridgetool_place


--returns mode and width
function get_bridgetool_meta(item)
  local metadata = item:get_metadata()
  if not metadata or string.len(metadata)<3 then
    --not metadata means mode and width have never been set
    --metadata<3 means tool was created with a bridgetool 1.0 and doesn't have width set
    return nil, nil
  else --valid metadata
    local mode=tonumber(string.sub(metadata,1,1))
    local width=tonumber(string.sub(metadata,3,3))
    return mode, width
  end  -- if not metadata
end --get_bridgetool_meta


--on left click switch the mode of the bridge tool
--also deals with sneak-leftclick which sets width
function bridgetool_switchmode(item, player, pointed) --pointed is ignored
  local player_name = player:get_player_name()  --for chat messages
  local mode
  local width
  mode,width=get_bridgetool_meta(item)
  if mode==nil or width==nil then
    --if item has not been used and mode not set yet,
    --or a pre-width item that needs to have width added
    minetest.chat_send_player(player_name, "Left click to change mode between 1:Forward, 2:Down, 3:Up,  Leftclick+Sneak to change width, Right click to place, uses inventory stack directly to right of bridge tool")
    mode=1
    width=1
  else --valid mode and width
  	local keys = player:get_player_control()
    if keys["sneak"] == true then
      width=width+1
      if width>3 then width=1 end
    else
      mode=mode+1
      if mode>3 then mode=1 end
    end --if sneak
  end --not mode==nil
  --minetest.chat_send_player(player_name, "bridge tool mode : "..mode.." - "..mode_text[mode][1].."  width="..width)
	item:set_name("skytest:bridge_tool"..mode..width)
  item:set_metadata(mode..":"..width)
  return item
  end --bridgetool_switchmode


--we put the recipie inside an if checking for default so that
--in the unlikely case someone is running this without default,
--they still could.  they would just have to use /giveme or creative
--mode to get the tools
if minetest.get_modpath("default") then
  minetest.register_craft({
          output = 'skytest:bridge_tool',
    recipe = {
      {'default:steel_ingot', '', 'default:steel_ingot'},
      {'', 'default:steel_ingot', ''},
      {'', 'default:mese_crystal_fragment', ''},
    }
  })
end --if default


--this one appears in crafting lists and when you first craft the item
  minetest.register_tool("skytest:bridge_tool", {
    description = "Bridge Tool",
    inventory_image = "bridgetool_wield.png",
    wield_image = "bridgetool_wield.png^[transformR90",
    on_place = bridgetool_place,
    on_use = bridgetool_switchmode
  })

--these are the different tools for all 3 differen modes and widths
--skytest:bridge_tool11 12 13 21 22 23 31 32 33
--the reason for having different tools defined is so they can have
--an inventory image telling which mode/width the tool is in
--note that we set these to NOT show up in the creative inventory (Thanks Topywo for that advice!)
for m = 1, 3 do
  for w = 1, 3 do
    minetest.register_tool("skytest:bridge_tool"..m..w, {
      description = "Bridge Tool mode "..m.." width "..w,
      inventory_image = "bridgetool_m"..m..".png^bridgetool_w"..w..".png",
      wield_image = "bridgetool_wield.png^[transformR90",
      groups = {not_in_creative_inventory=1},
      on_place = bridgetool_place,
      on_use = bridgetool_switchmode
    })
  end --for w
end --for m


--temporary for backwards compatibility, remove this after a version or two
--since previously made tools will be named bridgetool_1 2 or 3, leaving this
--here ensures they will load and switch to bridgetool_11 etc on the first left click
for m = 1, 3 do
    minetest.register_tool("skytest:bridge_tool"..m, {
      description = "Bridge Tool mode "..m,
      inventory_image = "bridgetool_m"..m..".png",
      wield_image = "bridgetool_wield.png^[transformR90",
      groups = {not_in_creative_inventory=1},
      on_place = bridgetool_place,
      on_use = bridgetool_switchmode
    })
end --for m


minetest.register_craftitem("skytest:bone", {
	description = "Bone",
	inventory_image = "bone.png",
})

-- bonemeal recipes
minetest.register_craft({
	type = "shapeless",
	output = 'skytest:bonemeal 2',
	recipe = {'skytest:bone'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'skytest:bone 4',
	recipe = {'bones:bones'},
})

minetest.register_craft( {
	type = "shapeless",
	output = "dye:white 2",
	recipe = {"skytest:bonemeal"},
})

-- add bones to dirt
minetest.override_item("default:dirt", {
	drop = {
		max_items = 1,
		items = {
			{
				items = {'skytest:bone', 'default:dirt'},
				rarity = 5,
			},
			{
				items = {'default:dirt'},
			}
		}
	},
})

local plants = {
	"flowers:dandelion_white",
	"flowers:dandelion_yellow",
	"flowers:geranium",
	"flowers:rose",
	"flowers:tulip",
	"flowers:viola",
}


local crops = {	
{"farming:pumpkin_", 8},
{"farming:raspberry_", 4},
{"farming:rhubarb_", 3},
{"farming:tomato_", 8},
{"farming:wheat_", 8},
{"farming:barley_", 7},
{"farming:blueberry_", 4},
{"farming:carrot_", 8},
{"farming:chili_", 8},
{"farming:coffee_", 5},
{"farming:corn_", 8},
{"farming:cotton_", 8},
{"farming:cucumber_", 4},
{"farming:garlic_", 5},
{"farming:hemp_", 8},
{"farming:melon_", 8},
{"farming:potato_", 4},
{"farming:pepper_", 5},
{"farming:onion_", 5},
}

-- check if sapling has enough height room to grow
local function enough_height(pos, height)

	local nod = minetest.line_of_sight(
		{x = pos.x, y = pos.y + 1, z = pos.z},
		{x = pos.x, y = pos.y + height, z = pos.z})

	if not nod then
		return false -- obstructed
	else
		return true -- can grow
	end
end

-- growing routine
local function growth(pointed_thing)

	local pos = pointed_thing.under
	local node = minetest.get_node(pos)

	if node.name == "ignore" then
		return
	end

	minetest.add_particlespawner({
		amount = 4,
		time = 0.15,
		minpos = pos,
		maxpos = pos,
		minvel = {x = -1, y = 2, z = -1},
		maxvel = {x = 1, y = 4, z = 1},
		minacc = {x = -1, y = -1, z = -1},
		maxacc = {x = 1, y = 1, z = 1},
		minexptime = 1,
		maxexptime = 1,
		minsize = 1,
		maxsize = 3,
		texture = "bonemeal_particle.png",
	})

	-- 50/50 chance of growing a sapling
	if minetest.get_item_group(node.name, "sapling") > 0 then

		if math.random(1, 2) == 1 then
			return
		end

		local under =  minetest.get_node({
			x = pos.x,
			y = pos.y - 1,
			z = pos.z
		})

		local height = minetest.registered_nodes[node.name].grown_height

		-- do we have enough height to grow sapling into tree?
		if height and not enough_height(pos, height) then
			return
		end

		-- check for soil under sapling
		if minetest.get_item_group(under.name, "soil") == 0 then
			return
		end
		if node.name == "default:sapling"
		and enough_height(pos, 7) then
			default.grow_new_apple_tree(pos)

		elseif node.name == "default:junglesapling"
		and enough_height(pos, 15) then
			default.grow_new_jungle_tree(pos)

		elseif node.name == "default:pine_sapling"
		and enough_height(pos, 11) then

			if #minetest.find_nodes_in_area(
				{x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
				{x = pos.x + 1, y = pos.y + 1, z = pos.z + 1},
				{"default:snow", "default:snowblock", "default:dirt_with_snow"}) > 0 then

				default.grow_new_snowy_pine_tree(pos)
			else
				default.grow_new_pine_tree(pos)
			end

		elseif node.name == "default:acacia_sapling"
		and enough_height(pos, 7) then
			default.grow_new_acacia_tree(pos)

		elseif node.name == "default:aspen_sapling"
		and enough_height(pos, 11) then
			default.grow_new_aspen_tree(pos)
		elseif node.name == "skytest:massive_sapling"
		and enough_height(pos, 30) then
		local tree=minetest.get_modpath("skytest").."/schems/masstree.mts"
		minetest.set_node(pos, {name="air"})
		minetest.place_schematic({x=pos.x-10,y=pos.y,z=pos.z-10}, tree, "random", {}, false)
		end

		return
	end

	local stage = ""

	-- grow registered crops
	for n = 1, #crops do

		if string.find(node.name, crops[n][1]) then

			stage = tonumber( node.name:split("_")[2] )
			stage = math.min(stage + math.random(1, 4), crops[n][2])

			minetest.set_node(pos, {name = crops[n][1] .. stage})

			return

		end

	end

	-- grow grass and flowers
	if minetest.get_item_group(node.name, "soil") > 0 then

		local dirt = minetest.find_nodes_in_area_under_air(
			{x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
			{x = pos.x + 2, y = pos.y + 1, z = pos.z + 2},
			{"group:soil"})

		for _,n in pairs(dirt) do

			local pos2 = n

			pos2.y = pos2.y + 1

			if math.random(0, 5) > 3 then

				minetest.swap_node(pos2,
					{name = plants[math.random(1, #plants)]})
			else

				if node.name == "default:dirt_with_dry_grass" then
					minetest.swap_node(pos2,
						{name = "default:dry_grass_" .. math.random(1, 5)})
				else
					minetest.swap_node(pos2,
						{name = "default:grass_" .. math.random(1, 5)})
				end

			end
		end
	end
end

-- bonemeal item
minetest.register_craftitem("skytest:bonemeal", {
	description = "Bone Meal",
	inventory_image = "bonemeal.png",

	on_use = function(itemstack, user, pointed_thing)

		if pointed_thing.type == "node" then

			-- Check if node protected
			if minetest.is_protected(pointed_thing.under, user:get_player_name()) then
				return
			end
				local item = user:get_wielded_item()
				item:take_item()
				user:set_wielded_item(item)
			if minetest.get_node(pointed_thing.under).name == "default:cactus" then
			minetest.set_node(pointed_thing.above, {name = "default:cactus"})
			elseif minetest.get_node(pointed_thing.under).name == "default:papyrus" then
			minetest.set_node(pointed_thing.above, {name = "default:papyrus"})
			else
			growth(pointed_thing)
			end

			itemstack:take_item()

			return itemstack
		end
	end,
})


-----Light Wand-----
local addvectors = function (v1, v2)
	return {x=v1.x+v2.x, y=v1.y+v2.y, z=v1.z+v2.z}
end

minetest.register_node("skytest:light_node", {
	description = "Light of Essences",
	tiles ={"bubble.png"},
	inventory_image = "bubble.png",
	drop = "",
	light_source = 14,
	buildable_to = true,
	sunlight_propagates = true,
	groups = {dig_immediate=3, falling_node=1},
	walkable = false,
	paramtype = "light",
	selection_box = {
		type = "fixed",
                -- but how to specify the dimensions for curved and sideways rails?
                fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	drawtype = "raillike",
	stack_max = 999,
})

minetest.register_tool("skytest:light_wand", {
    description = "Wand of Essences' Light",
    inventory_image = "wand.png",

	on_use = function(itemstack, user, pointed_thing)
			if user == nil or pointed_thing == nil or pointed_thing.type ~= "node" then
			return nil
		end
		local pos = user:getpos()
		pos.x = math.floor(pos.x+0.5)
		pos.y = math.floor(pos.y+0.5)
		pos.z = math.floor(pos.z+0.5)

		itemstack:add_wear(262)
		minetest.place_node({x=pos.x, y=pos.y, z=pos.z}, {name="skytest:light_node"})
		return itemstack
	end
})

minetest.register_tool("skytest:spectral_wand", {
    description = "Spectral Wand",
    inventory_image = "wand2.png",
	on_use = function(item, user, pointed_thing)
			if user == nil or pointed_thing == nil or pointed_thing.type ~= "node" then
			return nil
		end
		pos = pointed_thing.under
		if (minetest.get_node(pos).name == "default:bookshelf") then
			minetest.remove_node(pos)
			minetest.add_item(pos, "skytest:spectral_book")
		end
	end
})
minetest.register_tool("skytest:dragonbreath_wand", {
    description = "Wand of dragons breath",
    inventory_image = "wand3.png",
    on_use = function (itemstack, player, pointed_thing)
		-- Throw fire
		local pos = player:getpos()
		local vel = player:get_look_dir()

		local rshift = {x = vel.z/8, z = -vel.x/8, y = 0}

		local minp = {x=pos.x, y=pos.y+1.6, z=pos.z}
		local maxp = {x=pos.x, y=pos.y+1.6, z=pos.z}
		minp = addvectors(minp, rshift)
		maxp = addvectors(maxp, rshift)

		local minvel = {x=vel.x*6-0.5, y=vel.y*6-0.5, z=vel.z*6-0.5}
		local maxvel = {x=vel.x*6+0.5, y=vel.y*6+0.5, z=vel.z*6+0.5}

		minetest.add_particlespawner(300, 0.2,
			minp, maxp,
			minvel, maxvel,
			{x=0, y=0, z=0}, {x=0, y=1, z=0},
			1.2, 2,
			0.1, 1,
			false, "fire_basic_flame.png")

		-- Make stuff burn
		local np = minp
		for i = 0, 5 do
			np = addvectors(np, vel)
			local node = minetest.env:get_node(np)
			if minetest.get_item_group(node.name, "flammable") ~= 0 then
				minetest.env:set_node(np, {name="fire:basic_flame"})
			end

			if node.name == "default:dirt_with_grass" then
				minetest.env:set_node(np, {name="default:dirt"})
			end
                        if node.name == "default:sand" then
				minetest.env:set_node(np, {name="default:glass"})
			end
                        if node.name == "default:obsidian" then
				minetest.env:set_node(np, {name="default:lava_source"})
			end
                        if node.name == "default:stone" then
				minetest.env:set_node(np, {name="default:desert_stone"})
			end
                        if node.name == "default:gravel" then
				minetest.env:set_node(np, {name="technic:granite"})
			end
			                        if node.name == "default:sandstone" then
				minetest.env:set_node(np, {name="technic:marble"})
			end
                  if node.name == "skytest:crucible8_8" then
				minetest.env:set_node(np, {name="skytest:crucible_full"})
			end
		end
	end
	
})

minetest.register_craft({
	output = "skytest:light_wand",
	recipe = {
		{"skytest:spectral_book"},
		{"default:stick"}
	}
})
minetest.register_craft({
	output = "skytest:spectral_wand",
	recipe = {
		{"skytest:enchanted_fiber","default:obsidian"},
		{"default:stick","skytest:enchanted_fiber"}
	}
})
minetest.register_craft({
	output = "skytest:dragonbreath_wand",
	recipe = {
		{"skytest:spectral_book","fire:flint_and_steel","skytest:spectral_book"},
		{"fire:flint_and_steel","skytest:light_wand","fire:flint_and_steel"},
                {"skytest:spectral_book","skytest:light_wand","skytest:spectral_book"}
	}
})
minetest.register_craftitem("skytest:spectral_book", {
	description = "Spectral book",
	inventory_image = "default_bookshelf_slot.png",
	stack_max = 4,
})



minetest.register_tool("skytest:leaf_collector_vm", {
        description = "leaf collector(vein mine leaves)",
        inventory_image = "spears_spear_bronze.png",
        tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps = {
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=120, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=120, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=120}
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
	range = 24,
    })



minetest.register_on_dignode(function(pos, oldnode, digger)
	local item = digger:get_wielded_item():to_string()
	if string.match(item, "skytest:leaf_collector_vm") then
		if minetest.get_item_group(oldnode.name, "leaves") ~= 0 then
			leaffeller_loop(pos,digger)
		end
	end
end)


--have this recursively check for tree/leaves around it (1 node radius)
leaffeller_loop = function(pos,digger)

	local min = {x=pos.x-1,y=pos.y-1,z=pos.z-1}
	local max = {x=pos.x+1,y=pos.y+1,z=pos.z+1}
	local vm = minetest.get_voxel_manip()	
	local emin, emax = vm:read_from_map(min,max)
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	local data = vm:get_data()
	
	local air = minetest.get_content_id("air")
	for x = -1,1  do
		for z = -1,1  do
			for y = -1,1  do
				local p_pos = area:index(pos.x+x,pos.y+y,pos.z+z)
				local pos2 = {x=pos.x+x,y=pos.y+y,z=pos.z+z}
				local name = minetest.get_name_from_content_id(data[p_pos])
					if minetest.get_item_group(name, "leaves") ~= 0 then
						data[p_pos] = air
						minetest.after(0,function(pos2)
					        leaffeller_loop(pos2)
						end, pos2)
						minetest.add_item({x=pos.x+x,y=pos.y+y,z=pos.z+z}, name)	
				end
			end
		end
	end
	vm:update_liquids()
	vm:set_data(data)
	vm:calc_lighting()
	vm:write_to_map()
	vm:update_map()
end


minetest.register_craft({
        output = "skytest:leaf_collector_vm",
        recipe = {
            {"skytest:comp_crook","skytest:leaf_collector_3x3x1","skytest:comp_crook"}
        }
    })


minetest.register_craftitem("skytest:1disrupter", {
	description = "Node Disrupter 1 Time",
	inventory_image = "dsu_front.png^disrupter.png",
	on_use = function (itemstack, user, pointed_thing)
		if pointed_thing.under ~= nil then
			local node = minetest.env:get_node(pointed_thing.under)
			local nodedat = minetest.registered_nodes[node.name]
			if nodedat.groups.undisruptable ~= nil or nodedat.diggable == false then
				--
			else
				itemstack:take_item()
				if nodedat.on_disrupt == nil then
					minetest.remove_node(pointed_thing.under)
					minetest.add_item(pointed_thing.under, node.name)
				else
					itemstack = nodedat.on_disrupt(itemstack, user, pointed_thing)
				end
			end

			return itemstack
		end
	end
})
minetest.register_craftitem("skytest:1specdisrupter", {
	description = "Node Enhancer 1 Time",
	inventory_image = "dsu_front.png^extracter.png",
	liquids_pointable = true,
	on_use = function (itemstack, user, pointed_thing)
		if pointed_thing.under ~= nil then
			local node = minetest.env:get_node(pointed_thing.under)
			local nodedat = minetest.registered_nodes[node.name]
				itemstack:take_item()
				if nodedat.on_disrupt == nil then
				minetest.remove_node(pointed_thing.under)
					minetest.add_item(pointed_thing.under, node.name)
                    minetest.add_item(pointed_thing.under, node.name)
				else
					itemstack = nodedat.on_disrupt(itemstack, user, pointed_thing)
				end
			return itemstack
		end
	end
})


minetest.register_craft({
	output = 'skytest:1disrupter',
	recipe = {
		{'default:obsidian_shard'},
		{'skytest:silk'},
		{'default:steel_ingot'},
	}
})
minetest.register_craft({
	output = 'skytest:1disrupter 96',
	recipe = {
		{'skytest:disrupter'},
	}
})
minetest.register_craft({
	output = 'skytest:1specdisrupter',
	recipe = {
		{'skytest:1disrupter', 'skytest:spectral_book', 'skytest:1disrupter'},
		{'skytest:spectral_book', 'skytest:1disrupter', 'skytest:spectral_book'},
		{'skytest:1disrupter', 'skytest:spectral_book', 'skytest:1disrupter'},
	}
})







-- constant subspace size
local c_subspacesize = 5

-- chance for node restoral per second (No worries, all nodes will be restored, but not immediately)
local c_randomize_restore = 1

-- transform compatible nodes only
local c_restricted_mode = false

local compatible_nodes = {
	"default:stone",
	"default:dirt"
}

-- Check if the subspace still enabled for user (or can be disabled)
local function ssw_get_wielded(playername)
	local user = minetest.get_player_by_name(playername)
	-- if user leave the game, disable them
	if not user then
		return false
	end
	-- user does not hold the walker in the hand
	local item = user:get_wielded_item()
	if not item or item:get_name() ~= "skytest:walker" then
		return false
	end
	-- all ok, still active
	return item
end

-- subspacewalker runtime data
local subspacewalker = {
	users_in_subspace = {},
}

-- tool definition
minetest.register_tool("skytest:walker", {
	description = "Subspace Walker",
	inventory_image = "subspace_walker.png",
	wield_image = "subspace_walker.png",
	tool_capabilities = {},
	range = 0,
	on_use = function(itemstack, user, pointed_thing)
		subspacewalker.users_in_subspace[user:get_player_name()] = {timer = 1}
	end,
	on_place = function(itemstack, user, pointed_thing)
		subspacewalker.users_in_subspace[user:get_player_name()] = nil
	end,
	on_secondary_use = function(itemstack, user, pointed_thing)
		subspacewalker.users_in_subspace[user:get_player_name()] = nil
	end
})

-- Globalstep check for nodes to hide
minetest.register_globalstep(function(dtime)
	-- check each player with walker active
	for playername, ssw in pairs(subspacewalker.users_in_subspace) do
		ssw.timer = ssw.timer + dtime
		local ssw_stack = ssw_get_wielded(playername)
		if not ssw_stack then
			subspacewalker.users_in_subspace[playername] = nil
		else
			local user = minetest.get_player_by_name(playername)
			local control = user:get_player_control()
			local userpos = user:getpos()

			--regular step, once each second
			if ssw.timer > 0.2 or --0.5
					--sneaking but not in air
					(control.sneak and userpos.y - 0.5 == math.floor(userpos.y)) then
				ssw.timer = 0

				-- set offset for jump or sneak
				userpos.y = math.floor(userpos.y+0.5)
				if control.jump then
					userpos.y = userpos.y + 1
				elseif control.sneak then
					userpos.y = userpos.y -1
				end
				userpos = vector.round(userpos)

				--voxel_manip magic
				local pos1 = {x=userpos.x-c_subspacesize, y=userpos.y, z=userpos.z-c_subspacesize}
				local pos2 = {x=userpos.x+c_subspacesize, y=userpos.y+c_subspacesize, z=userpos.z+c_subspacesize}

				local manip = minetest.get_voxel_manip()
				local min_c, max_c = manip:read_from_map(pos1, pos2)
				local area = VoxelArea:new({MinEdge=min_c, MaxEdge=max_c})

				local data = manip:get_data()
				local changed = false

				local ssw_id = minetest.get_content_id("skytest:subspace")
				local air_id = minetest.get_content_id("air")

				local transform_count = 0

				-- check each node in the area
				for i in area:iterp(pos1, pos2) do
					local nodepos = area:position(i)
--					if math.random(0, vector.distance(userpos, nodepos)) < 2 then
						local cur_id = data[i]
						if cur_id and cur_id ~= ssw_id and cur_id ~= air_id then
							local cur_name = minetest.get_name_from_content_id(cur_id)
							if c_restricted_mode then
								for _, compat in ipairs(compatible_nodes) do
									if compat == cur_name then
										data[i] = ssw_id
										minetest.get_meta(area:position(i)):set_string("subspacewalker", cur_name)
										changed = true
										transform_count = transform_count + 1
									end
								end
							else
								data[i] = ssw_id
								minetest.get_meta(area:position(i)):set_string("subspacewalker", cur_name)
								changed = true
								transform_count = transform_count + 1
							end
						end
--					end
				end
				-- save changes if needed
				if changed then
					manip:set_data(data)
					manip:write_to_map()
					local wear = ssw_stack:get_wear()
					ssw_stack:add_wear(transform_count)
					user:set_wielded_item(ssw_stack)
				end
			end

			-- jump special handling. Restore node under the player
			if control.jump then
				local userpos = user:getpos()
				userpos.y = math.floor(userpos.y-0.5)
				local node = minetest.get_node(userpos)
				local meta = minetest.get_meta(userpos)
				local data = meta:to_table()
				if data.fields.subspacewalker then
					node.name = data.fields.subspacewalker
					data.fields.subspacewalker = nil
					meta:from_table(data)
					minetest.swap_node(userpos, node)
				end
			end
		end
	end
end)

-- node to hide the original one
minetest.register_node("skytest:subspace", {
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 5,
	diggable = false,
	walkable = false,
	groups = {not_in_creative_inventory=1},
	pointable = false,
	drop = ""
})
-- ABM on hidden blocks checks if there can be restored again
minetest.register_abm({
	nodenames = { "skytest:subspace" },
	interval = 0.5,
	chance = c_randomize_restore,
	action = function(pos, node)
		if node.name == 'ignore' then 
			return 
		end

		local can_be_restored = true
		-- check if the node can be restored
		for playername, _ in pairs(subspacewalker.users_in_subspace) do
			local ssw_stack = ssw_get_wielded(playername)
			if not ssw_stack then
				subspacewalker.users_in_subspace[playername] = nil
			else
				local user = minetest.get_player_by_name(playername)
				local userpos = user:getpos()
				userpos.y = math.floor(userpos.y+0.5)
				if ( pos.x >= userpos.x-c_subspacesize-1 and pos.x <= userpos.x+c_subspacesize+1) and  -- "+1" is to avoid flickering of nodes. restoring range is higher then the effect range
						( pos.y >= userpos.y and pos.y <= userpos.y+c_subspacesize+1 ) and
						( pos.z >= userpos.z-c_subspacesize-1 and pos.z <= userpos.z+c_subspacesize+1) then
					can_be_restored = false --active user in range
				end
			end
		end

		--restore them
		if can_be_restored then
			local node = minetest.get_node(pos)
			local meta = minetest.get_meta(pos)
			local data = meta:to_table()
			node.name = data.fields.subspacewalker
			data.fields.subspacewalker = nil
			meta:from_table(data)
			minetest.swap_node(pos, node)
		end
	end
})
--[[
minetest.register_abm({
	nodenames = { "skytest:subspace" },
	interval = 0.5,
	chance = 1,
	action = function(pos, node)
	minetest.set_node(pos, {name = "air"})
	end
})
]]--
minetest.register_craft({
	output = "skytest:walker",
	recipe = {
			{"","","skytest:neptonium_crystal"},
			{"","skytest:power_core",""},
			{"skytest:spectral_ingot","",""}
	}
})
