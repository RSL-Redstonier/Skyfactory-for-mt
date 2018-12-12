local modname = "gemeric"

function math.sign(v)
	return (v >= 0 and 1) or -1
end
function math.round(v, bracket)
	bracket = bracket or 1
	return math.floor(v/bracket + math.sign(v) * 0.5) * bracket
end
local get_chopped = function(pos, group)
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
local drop_node = function(pos, digger, wielded, rank)
	-- check if we can drop this node
	local node = minetest.get_node(pos)
	local def = ItemStack({name=node.name}):get_definition()

	if not def.diggable or (def.can_dig and not def.can_dig(pos,digger)) then return end
	if minetest.is_protected(pos, digger:get_player_name()) then return end

	local level = minetest.get_item_group(node.name, "level")
	if rank >= level then

		-- note that get_node_drops() is not future-safe
		-- though no alternative currently exists
		local drops = minetest.get_node_drops(node.name, wielded:get_name())
		minetest.handle_node_drops(pos, drops, digger)
		minetest.remove_node(pos)
	end
end
local after_axe = function(pos, oldnode, digger)
	if digger then
		local wielded = digger:get_wielded_item()
		local rank = minetest.get_item_group(wielded:get_name(), "gem_lumberaxe")
		if rank > 0 then
			for _,k in ipairs(get_chopped(pos, "tree")) do
				drop_node(k, digger, wielded, rank)
			end
			for _,k in ipairs(get_chopped(pos, "leaves")) do
				drop_node(k, digger, wielded, rank)
			end
		end
	end
end
minetest.register_on_dignode(after_axe)
local hoe_on_use2 = function(itemstack, user, pointed_thing, uses)
	local pt = pointed_thing
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end

	local under = minetest.get_node(pt.under)
	local p = {x=pt.under.x, y=pt.under.y+1, z=pt.under.z}
	local above = minetest.get_node(p)

	-- return if any of the nodes is not registered
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end

	-- check if the node above the pointed thing is air
	if above.name ~= "air" then
		return
	end

	-- check if pointing at soil
	if minetest.get_item_group(under.name, "soil") ~= 1 then
		return
	end
	-- turn the node into soil and play sound
	minetest.set_node(pt.under, {name = "farming:soil"})
	minetest.sound_play("default_dig_crumbly", {
		pos = pt.under,
		gain = 0.5,
	})

	if not (creative and creative.is_enabled_for
			and creative.is_enabled_for(user:get_player_name())) then
		-- wear tool
		local wdef = itemstack:get_definition()
		itemstack:add_wear(65535/(uses-1))
	end
	return itemstack
end
local register_hoe2 = function(name, def)
	if def.max_uses == nil then
		def.max_uses = 30
	end
	minetest.register_tool(name, {
		description = def.description,
		inventory_image = def.inventory_image,
		on_use = function(itemstack, user, pointed_thing)
			return hoe_on_use2(itemstack, user, pointed_thing, def.max_uses)
		end,
		groups = def.groups,
		sound = {breaks = "default_tool_breaks"},
	})
end
local hoe_on_use3 = function(itemstack, user, pointed_thing, uses)
	local pt = pointed_thing
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end

	local under = minetest.get_node(pt.under)
	local p = {x=pt.under.x, y=pt.under.y+1, z=pt.under.z}
	local above = minetest.get_node(p)

	-- return if any of the nodes is not registered
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end

	-- check if the node above the pointed thing is air
	if above.name ~= "air" then
		return
	end

	-- check if pointing at soil
local pos = pointed_thing.under
local radius = 1
local nodes, count = minetest.find_nodes_in_area_under_air({x=pos.x-radius,y=pos.y,z=pos.z-radius},{x=pos.x+radius,y=pos.y,z=pos.z+radius}, "group:soil")
for i in pairs(nodes) do
    minetest.set_node(nodes[i], {name = "farming:soil"})
end
	minetest.sound_play("default_dig_crumbly", {
		pos = pt.under,
		gain = 0.5,
	})
		-- wear tool
		local wdef = itemstack:get_definition()
		itemstack:add_wear(65535/(uses-1))
	return itemstack
end
local register_hoe3 = function(name, def)
	if def.max_uses == nil then
		def.max_uses = 30
	end
	minetest.register_tool(name, {
		description = def.description,
		inventory_image = def.inventory_image,
		on_use = function(itemstack, user, pointed_thing)
			return hoe_on_use3(itemstack, user, pointed_thing, def.max_uses)
		end,
		groups = def.groups,
		sound = {breaks = "default_tool_breaks"},
	})
end
for number3 = 1,4 do
local nl3 = gemeric.rod_name_list[number3]
local nl4 = gemeric.rod_id_list[number3]
local nl7 = gemeric.shovel_rod_id_list[number3]
local nl6 = gemeric.rod_durability_list[number3]
local nl9 = gemeric.rod_speed_list[number3]
for number2 = 1, 48 do
local nl2 = gemeric.gem_name_list[number2]
local nl5 = gemeric.gem_stats_list_durability[number2]
local nl8 = gemeric.gem_stats_list_speed[number2]
register_hoe2(modname..":"..nl4.."_hoe_"..number2, {
	description = nl2.." Hoe\n"..nl3.."\nDurability "..math.round(nl5+nl6),
	inventory_image = nl4..".png^hoe"..number2..".png",
	max_uses = math.round(nl5+nl6),
	groups = {gem_hoe = 1},
})
minetest.register_craft({
    output = modname..":"..nl4.."_hoe_"..number2,
    recipe = {
		{modname..":gem_"..number2,modname..":gem_"..number2,""},
		{"",modname..":"..nl4,""},
		{"",modname..":"..nl4,""},
    }
})
minetest.register_craft({
    output = modname..":"..nl4.."_hoe_"..number2,
    recipe = {
		{"",modname..":gem_"..number2,modname..":gem_"..number2},
		{"",modname..":"..nl4,""},
		{"",modname..":"..nl4,""},
    }
})
register_hoe2(modname..":"..nl4.."_hoe_supercharged_"..number2, {
	description = nl2.." Hoe\n"..nl3.."\nSupercharged\nDurability "..math.round((nl5*1.2)+nl6),
	inventory_image = nl4..".png^hoe"..number2..".png^hoe_supercharged.png",
	max_uses = math.round((nl5*1.2)+nl6),
	groups = {gem_hoe = 1},
})
minetest.register_craft({
    output = modname..":"..nl4.."_hoe_supercharged_"..number2,
    recipe = {
		{modname..":super_gem_"..number2,modname..":super_gem_"..number2,""},
		{"",modname..":"..nl4,""},
		{"",modname..":"..nl4,""},
    }
})
minetest.register_craft({
    output = modname..":"..nl4.."_hoe_supercharged_"..number2,
    recipe = {
		{"",modname..":super_gem_"..number2,modname..":super_gem_"..number2},
		{"",modname..":"..nl4,""},
		{"",modname..":"..nl4,""},
    }
})






--shovel
minetest.register_tool(modname..":"..nl4.."_shovel_"..number2, {
	description = nl2.." Shovel\n"..nl3.."\nDurability "..math.round(nl5+nl6).."\nMining Speed "..math.round((nl8*1.2)/nl9,0.0001),
	inventory_image = nl7..".png^shovel"..number2..".png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=(nl8*1.2)/nl9, [2]=(nl8*1.2)/nl9, [3]=(nl8*1.2)/nl9}, uses=math.round(nl5+nl6), maxlevel=0},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {gem_shovel = 1},
})
minetest.register_craft({
    output = modname..":"..nl4.."_shovel_"..number2,
    recipe = {
		{"",modname..":gem_"..number2,""},
		{"",modname..":"..nl4,""},
		{"",modname..":"..nl4,""},
    }
})
minetest.register_tool(modname..":"..nl4.."_shovel_supercharged_"..number2, {
	description = nl2.." Shovel\n"..nl3.."\nSupercharged\nDurability "..math.round((nl5*1.2)+nl6).."\nMining Speed "..math.round((nl8/1.2)/nl9,0.0001),
	inventory_image = nl7..".png^shovel"..number2..".png^shovel_supercharged.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=(nl8/1.2)/nl9, [2]=(nl8/1.2)/nl9, [3]=(nl8/1.2)/nl9}, uses=math.round((nl5*1.2)+nl6), maxlevel=0},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {gem_shovel = 1},
})
minetest.register_craft({
    output = modname..":"..nl4.."_shovel_supercharged_"..number2,
    recipe = {
		{"",modname..":super_gem_"..number2,""},
		{"",modname..":"..nl4,""},
		{"",modname..":"..nl4,""},
    }
})




--pickaxe

minetest.register_tool(modname..":"..nl4.."_pickaxe_"..number2, {
	description = nl2.." Pickaxe\n"..nl3.."\nDurability "..math.round(nl5+nl6).."\nMining Speed "..math.round((nl8*1.2)/nl9,0.0001),
	inventory_image = nl4..".png^pickaxe"..number2..".png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=(nl8*1.2)/nl9, [2]=(nl8*1.2)/nl9, [3]=(nl8*1.2)/nl9}, uses=math.round(nl5+nl6), maxlevel=0},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {gem_pickaxe = 1},
})
minetest.register_craft({
    output = modname..":"..nl4.."_pickaxe_"..number2,
    recipe = {
		{modname..":gem_"..number2,modname..":gem_"..number2,modname..":gem_"..number2},
		{"",modname..":"..nl4,""},
		{"",modname..":"..nl4,""},
    }
})
minetest.register_tool(modname..":"..nl4.."_pickaxe_supercharged_"..number2, {
	description = nl2.." Pickaxe\n"..nl3.."\nSupercharged\nDurability "..math.round((nl5*1.2)+nl6).."\nMining Speed "..math.round((nl8/1.2)/nl9,0.0001),
	inventory_image = nl4..".png^pickaxe"..number2..".png^pickaxe_supercharged.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=(nl8/1.2)/nl9, [2]=(nl8/1.2)/nl9, [3]=(nl8/1.2)/nl9}, uses=math.round((nl5/1.2)+nl6), maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {gem_pickaxe = 1},
})
minetest.register_craft({
    output = modname..":"..nl4.."_pickaxe_supercharged_"..number2,
    recipe = {
		{modname..":super_gem_"..number2,modname..":super_gem_"..number2,modname..":super_gem_"..number2},
		{"",modname..":"..nl4,""},
		{"",modname..":"..nl4,""},
    }
})





--axe
minetest.register_tool(modname..":"..nl4.."_axe_"..number2, {
	description = nl2.." Axe\n"..nl3.."\nDurability "..math.round(nl5+nl6).."\nMining Speed "..math.round((nl8*1.2)/nl9,0.0001),
	inventory_image = nl4..".png^axe"..number2..".png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			choppy = {times={[1]=(nl8*1.2)/nl9, [2]=(nl8*1.2)/nl9, [3]=(nl8*1.2)/nl9}, uses=math.round(nl5+nl6), maxlevel=0},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {gem_axe = 1},
})
minetest.register_craft({
    output = modname..":"..nl4.."_axe_"..number2,
    recipe = {
		{modname..":gem_"..number2,modname..":gem_"..number2,""},
		{modname..":gem_"..number2,modname..":"..nl4,""},
		{"",modname..":"..nl4,""},
    }
})
minetest.register_tool(modname..":"..nl4.."_axe_supercharged_"..number2, {
	description = nl2.." Axe\n"..nl3.."\nSupercharged\nDurability "..math.round((nl5*1.2)+nl6).."\nMining Speed "..math.round((nl8/1.2)/nl9,0.0001),
	inventory_image = nl4..".png^axe"..number2..".png^axe_supercharged.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			choppy = {times={[1]=(nl8/1.2)/nl9, [2]=(nl8/1.2)/nl9, [3]=(nl8/1.2)/nl9}, uses=math.round((nl5*1.2)+nl6), maxlevel=0},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {gem_axe = 1},
})
minetest.register_craft({
    output = modname..":"..nl4.."_axe_supercharged_"..number2,
    recipe = {
		{modname..":super_gem_"..number2,modname..":super_gem_"..number2,""},
		{modname..":super_gem_"..number2,modname..":"..nl4,""},
		{"",modname..":"..nl4,""},
    }
})






--paxel


minetest.register_craft({
    output = modname..":"..nl4.."_paxel_"..number2,
    recipe = {
		{modname..":gem_"..number2,modname..":gem_"..number2,modname..":gem_"..number2},
		{modname..":gem_"..number2,modname..":"..nl4,""},
		{modname..":gem_"..number2,modname..":"..nl4,""},
    }
})
minetest.register_tool(modname..":"..nl4.."_paxel_"..number2, {
	description = nl2.." Paxel\n"..nl3.."\nDurability "..math.round(nl5+nl6).."\nMining Speed "..math.round((nl8*1.2)/nl9,0.0001),
	inventory_image = nl4..".png^paxel"..number2..".png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=(nl8*1.2)/nl9, [2]=(nl8*1.2)/nl9, [3]=(nl8*1.2)/nl9}, uses=math.round(nl5+nl6), maxlevel=0},
			choppy = {times={[1]=(nl8*1.2)/nl9, [2]=(nl8*1.2)/nl9, [3]=(nl8*1.2)/nl9}, uses=math.round(nl5+nl6), maxlevel=0},
			crumbly = {times={[1]=(nl8*1.2)/nl9, [2]=(nl8*1.2)/nl9, [3]=(nl8*1.2)/nl9}, uses=math.round(nl5+nl6), maxlevel=0},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {gem_paxel = 1},
})
minetest.register_craft({
    output = modname..":"..nl4.."_paxel_supercharged_"..number2,
    recipe = {
		{modname..":super_gem_"..number2,modname..":super_gem_"..number2,modname..":super_gem_"..number2},
		{modname..":super_gem_"..number2,modname..":"..nl4,""},
		{modname..":super_gem_"..number2,modname..":"..nl4,""},
    }
})
minetest.register_tool(modname..":"..nl4.."_paxel_supercharged_"..number2, {
	description = "Supercharged "..nl2.." Paxel\n"..nl3.."\nDurability "..math.round((nl5*1.2)+nl6).."\nMining Speed "..math.round(nl8/nl9,0.0001),
	inventory_image = nl4..".png^paxel"..number2..".png^paxel_supercharged.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=nl8/nl9, [2]=nl8/nl9, [3]=nl8/nl9}, uses=math.round((nl5*1.2)+nl6), maxlevel=0},
			choppy = {times={[1]=nl8/nl9, [2]=nl8/nl9, [3]=nl8/nl9}, uses=math.round((nl5*1.2)+nl6), maxlevel=0},
			crumbly = {times={[1]=nl8/nl9, [2]=nl8/nl9, [3]=nl8/nl9}, uses=math.round((nl5*1.2)+nl6), maxlevel=0},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {gem_paxel = 1},
	on_place = function(itemstack, user, pointed_thing)
		itemstack:replace(modname..":"..nl4.."_paxel_supercharged_active_"..number2)
		return itemstack
	end
	})
	minetest.register_tool(modname..":"..nl4.."_paxel_supercharged_active_"..number2, {
	description = "Activated Supercharged "..nl2.." Paxel\n"..nl3.."\nDurability "..math.round((nl5*1.2)+nl6).."\nMining Speed "..math.round((nl8/1.5)/nl9,0.0001),
	inventory_image = nl4..".png^paxel"..number2..".png^paxel_supercharged_activated.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=(nl8/1.5)/nl9, [2]=(nl8/1.5)/nl9, [3]=(nl8/1.5)/nl9}, uses=math.round((nl5/1.2)+nl6), maxlevel=3},
			choppy = {times={[1]=(nl8/1.5)/nl9, [2]=(nl8/1.5)/nl9, [3]=(nl8/1.5)/nl9}, uses=math.round((nl5*1.2)+nl6), maxlevel=0},
			crumbly = {times={[1]=(nl8/1.5)/nl9, [2]=(nl8/1.5)/nl9, [3]=(nl8/1.5)/nl9}, uses=math.round((nl5*1.2)+nl6), maxlevel=0},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {gem_paxel = 1},
	on_place = function(itemstack, user, pointed_thing)
		itemstack:replace(modname..":"..nl4.."_paxel_supercharged_"..number2)
		return itemstack
	end
})


--lumber axe
minetest.register_tool(modname..":"..nl4.."_lumberaxe_"..number2, {
	description = nl2.." Lumber Axe\n"..nl3.."\nDurability "..math.round(nl5+nl6).."\nMining Speed "..math.round((nl8*1.2)/nl9,0.0001),
	inventory_image = nl4..".png^tomahawk"..number2..".png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			choppy = {times={[1]=(nl8*1.2)/nl9, [2]=(nl8*1.2)/nl9, [3]=(nl8*1.2)/nl9}, uses=math.round(nl5+nl6), maxlevel=0},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {gem_lumberaxe = 1},
})
minetest.register_craft({
    output = modname..":"..nl4.."_lumberaxe_"..number2,
    recipe = {
		{modname..":gem_"..number2,modname..":gem_"..number2,""},
		{modname..":gem_"..number2,modname..":"..nl4.."_axe_"..number2,""},
		{"","",""},
    }
})
minetest.register_craft({
    output = modname..":"..nl4.."_lumberaxe_supercharged_"..number2,
    recipe = {
		{modname..":super_gem_"..number2,modname..":super_gem_"..number2,""},
		{modname..":super_gem_"..number2,modname..":"..nl4.."_axe_"..number2,""},
		{"","",""},
    }
})
minetest.register_tool(modname..":"..nl4.."_lumberaxe_supercharged_"..number2, {
	description = nl2.." Lumber Axe\n"..nl3.."\nSupercharged\nDurability "..math.round((nl5*1.2)+nl6).."\nMining Speed "..math.round((nl8/1.2)/nl9,0.0001),
	inventory_image = nl4..".png^tomahawk"..number2..".png^tomahawk_supercharged.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			choppy = {times={[1]=(nl8/1.2)/nl9, [2]=(nl8/1.2)/nl9, [3]=(nl8/1.2)/nl9}, uses=math.round((nl5*1.2)+nl6), maxlevel=0},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {gem_lumberaxe = 1},
})
















--AOE--area of effect
register_hoe3(modname..":"..nl4.."_hoe_"..number2.."_aoe", {
	description = nl2.." Hoe\n"..nl3.."\nDurability "..math.round(nl5+nl6).."\n3x3 AOE",
	inventory_image = nl4..".png^hoe"..number2..".png",
	max_uses = math.round(nl5+nl6),
	groups = {gem_hoe = 1},
})
minetest.register_craft({
    output = modname..":"..nl4.."_hoe_"..number2.."_aoe",
    recipe = {
		{modname..":aoe_rune",modname..":"..nl4.."_hoe_"..number2},
    }
})
register_hoe3(modname..":"..nl4.."_hoe_supercharged_"..number2.."_aoe", {
	description = nl2.." Hoe\n"..nl3.."\nSupercharged\nDurability "..math.round((nl5*1.2)+nl6).."\n3x3 AOE",
	inventory_image = nl4..".png^hoe"..number2..".png^hoe_supercharged.png",
	max_uses = math.round((nl5*1.2)+nl6),
	groups = {gem_hoe = 1},
})
minetest.register_craft({
    output = modname..":"..nl4.."_hoe_supercharged_"..number2.."_aoe",
    recipe = {
		{modname..":aoe_rune",modname..":"..nl4.."_hoe_supercharged_"..number2},
    }
})
end
end