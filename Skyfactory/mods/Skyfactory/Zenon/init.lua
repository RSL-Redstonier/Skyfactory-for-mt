minetest.register_privilege("can_see_magic_nodes", {
	description = "Allows player to see and interact with magic nodes",
	give_to_singleplayer = false
})

for name, data in pairs({
    envious = {
        desc = "Envious",
        tex = "envious_soul_fragment.png",
		color = "[colorize:green:89",
    },
    gluttonous = {
        desc = "Gluttonous",
        tex = "gluttonous_soul_fragment.png",
		color = "[colorize:black:200",
    },
    greedy = {
        desc = "Greedy",
        tex = "greedy_soul_fragment.png",
		color = "[colorize:orange:89",
    },
    proud = {
        desc = "Proud",
        tex = "proud_soul_fragment.png",
		color = "[colorize:purple:189",
    },
    wrathful = {
        desc = "Wrathful",
        tex = "wrathful_soul_fragment.png",
		color = "[colorize:red:89",
    },
    slothful = {
        desc = "Slothful",
        tex = "slothful_soul_fragment.png",
		color = "[colorize:gray:189",
    },
}) do
minetest.register_node("zenon:troubled_spirit_"..name, {
	description = data.desc.." Troubled Spirit",
	drawtype = "plantlike",
	tiles = {{
		name = "fireflies_firefly_animated.png^"..data.color,
		animation = {
			type = "vertical_frames",
			aspect_w = 16,
			aspect_h = 16,
			length = 1.5
		},
	}},
	inventory_image = "fireflies_firefly.png^"..data.color,
	wield_image =  "fireflies_firefly.png^"..data.color,
	waving = 1,
	paramtype = "light",
	sunlight_propagates = true,
	buildable_to = true,
	walkable = false,
	groups = {catchable = 1},
	selection_box = {
		type = "fixed",
		fixed = {-0.1, -0.1, -0.1, 0.1, 0.1, 0.1},
	},
	light_source = 6,
})
minetest.register_craft({
	output = "zenon:spirit_essence_"..name,
	recipe = {
		{"zenon:troubled_spirit_"..name,"zenon:troubled_spirit_"..name},
		{"zenon:troubled_spirit_"..name,"zenon:troubled_spirit_"..name},
	},
})
minetest.register_craftitem("zenon:spirit_essence_"..name, {
    description = data.desc.." Spirit Essence",
    inventory_image = data.tex,
    stack_max = 96,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "zenon:troubled_spirit_"..name,
	wherein        = "air",
	clust_scarcity = 5*5*5,
	clust_num_ores = 30,
	clust_size     = 40,
	height_min     = 1,
	height_max     = 10,
	--flags          = "absheight",
})
end
minetest.register_craftitem("zenon:catching_item", {
	description = "Catching item",
	inventory_image = "fireflies_bugnet.png",
	        stack_max = 1,
	on_use = function(itemstack, player, pointed_thing)
		if not pointed_thing or 
		pointed_thing.type ~= "node" or 
		minetest.is_protected(pointed_thing.under, player:get_player_name()) then
			return
		end
		local node_name = minetest.get_node(pointed_thing.under).name
		local inv = player:get_inventory()
		if minetest.get_item_group(node_name, "catchable") == 1 and minetest.check_player_privs(player:get_player_name(), {can_see_magic_nodes=true}) then
			minetest.set_node(pointed_thing.under, {name = "air"})
			local stack = ItemStack(node_name.." 1")
			local leftover = inv:add_item("main", stack)
			if leftover:get_count() > 0 then
				minetest.add_item(pointed_thing.under, node_name.." 1")
			end	
		end
	end
})
minetest.register_craftitem("zenon:goggles", {
	description = "Magic goggles\nlets the player interact\nwith magic nodes\nwhile wearing",
	inventory_image = "zenon_texture.png",
	stack_max = 1,
})
minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		local inv = player:get_inventory()
		for i=1, 6 do
			local stack = inv:get_stack("armor", i)
			local item = stack:get_name()
            if item == "zenon:goggles" then
				local playername = player:get_player_name()
				local privs = minetest.get_player_privs(playername)
				privs.can_see_magic_nodes = true
				minetest.set_player_privs(playername, privs)
				return
			else 
				local playername = player:get_player_name()
				local privs = minetest.get_player_privs(playername)
		privs.can_see_magic_nodes = nil
		minetest.set_player_privs(playername, privs)
end
		end
	end
end)