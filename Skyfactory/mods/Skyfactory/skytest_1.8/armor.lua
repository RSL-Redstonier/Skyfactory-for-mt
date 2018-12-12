--todo: air tank

scuba = {
  huds = {}
}

scuba.set = function(defs)
	--set the scuba hud
	if scuba.huds[defs.player][1] == nil then
		local hud_id=defs.player:hud_add({
		hud_elem_type = "image",
		position = {x = 0.5, y = 0.5},
		scale = {
			x = -101,
			y = -101
			},
			text = "scuba.png"
		})
		scuba.huds[defs.player][1] = hud_id;
	elseif not string.match(armor["textures"][defs.player:get_player_name()].armor, "scuba_helmet.png") then
		local player = defs.player
		local armor_texture = armor["textures"][player:get_player_name()].armor
		armor_texture = armor_texture.."^scuba_helmet.png"
		armor["textures"][player:get_player_name()].armor = armor_texture
		armor.update_player_visuals(armor,player)
		
		--attempt to update the preview
		local preview = armor["textures"][player:get_player_name()].preview
		print(dump(armor["textures"][player:get_player_name()]))
		
		preview = preview.."^scuba_preview.png"
		
		armor["textures"][player:get_player_name()].preview = preview
		
		
	end
	
end

scuba.add = function (defs)
  defs.darkness = math.max(defs.darkness + #scuba.huds[defs.player], 0)
  scuba.set(defs)
end
scuba.del = function(defs)
	if scuba.huds[defs.player][1] ~= nil then
		-- removing huds
		defs.player:hud_remove(scuba.huds[defs.player][1])
		scuba.huds[defs.player][1] = nil
	end
end
scuba.remove = function (defs)
  defs.darkness = math.max(defs.darkness + #scuba.huds[defs.player], 0)
  scuba.del(defs)
end

--make this do something more efficient
minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		local inv = player:get_inventory()
		for i=1, 6 do
			local stack = inv:get_stack("armor", i)
			local item = stack:get_name()
			if item == "skytest:scuba_helmet" then
				scuba.set({player = player})
				player:set_breath(10)
				return
			end
		end
		scuba.del({player = player})
	end
end)

minetest.register_on_joinplayer(function (player)
  scuba.huds[player] = {}
end)

minetest.register_craftitem("skytest:scuba_helmet", {
	description = "Scuba Helmet",
	inventory_image = "scuba_item.png",
        stack_max = 1,
})



minetest.register_craft({
	output = "skytest:scuba_helmet",
	recipe = {
		{"default:steelblock", "default:steelblock", "default:steelblock"},
		{"default:steelblock", "skytest:mba", "default:steelblock"},
		{"default:steelblock", "default:glass", "default:steelblock"}
	}
})

nvg = {
  huds = {}
}

nvg.set = function(defs)
	--set the nvg hud
	if nvg.huds[defs.player][1] == nil then
		local hud_id=defs.player:hud_add({
		hud_elem_type = "image",
		position = {x = 0.5, y = 0.5},
		scale = {
			x = -101,
			y = -101
			},
			text = "nvg.png",
		})
		nvg.huds[defs.player][1] = hud_id;
end
end

nvg.add = function (defs)
  defs.darkness = math.max(defs.darkness + #nvg.huds[defs.player], 0)
  nvg.set(defs)
end
nvg.del = function(defs)
	if nvg.huds[defs.player][1] ~= nil then
		-- removing huds
		defs.player:hud_remove(nvg.huds[defs.player][1])
		nvg.huds[defs.player][1] = nil
	end
end
nvg.remove = function (defs)
  defs.darkness = math.max(defs.darkness + #nvg.huds[defs.player], 0)
  nvg.del(defs)
end

--make this do something more efficient
minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		local inv = player:get_inventory()
		for i=1, 6 do
			local stack = inv:get_stack("armor", i)
			local item = stack:get_name()
			if item == "skytest:nvg_helmet" then
				nvg.set({player = player})
			player:override_day_night_ratio(10)
				return
			else 
			player:override_day_night_ratio(nil)
end
		end
		nvg.del({player = player})
	end
end)

minetest.register_on_joinplayer(function (player)
  nvg.huds[player] = {}
end)

minetest.register_craftitem("skytest:nvg_helmet", {
	description = "Night Vision Goggles",
	inventory_image = "nvg_item.png",
        stack_max = 1,
})



minetest.register_craft({
	output = "skytest:nvg_helmet",
	recipe = {
		{"default:meselamp", "default:steelblock", "default:meselamp"},
		{"dye:green", "default:obsidian_glass", "dye:green"},
		{"default:meselamp", "", "default:meselamp"}
	}
})
boots = {
  huds = {}
}

boots.set = function(defs)
	if not string.match(armor["textures"][defs.player:get_player_name()].armor, "speed_boots.png") then
		local player = defs.player
		local armor_texture = armor["textures"][player:get_player_name()].armor
		armor_texture = armor_texture.."^speed_boots.png"
		armor["textures"][player:get_player_name()].armor = armor_texture
		armor.update_player_visuals(armor,player)
		
		--attempt to update the preview
		local preview = armor["textures"][player:get_player_name()].preview
		print(dump(armor["textures"][player:get_player_name()]))
		
		preview = preview.."^speed_boots_preview.png"
		
		armor["textures"][player:get_player_name()].preview = preview
		
		
	end
	
end

boots.add = function (defs)
  defs.darkness = math.max(defs.darkness + #boots.huds[defs.player], 0)
  boots.set(defs)
end
boots.del = function(defs)
	if boots.huds[defs.player][1] ~= nil then
		-- removing huds
		defs.player:hud_remove(boots.huds[defs.player][1])
		boots.huds[defs.player][1] = nil
	end
end
boots.remove = function (defs)
  defs.darkness = math.max(defs.darkness + #boots.huds[defs.player], 0)
  boots.del(defs)
end

--make this do something more efficient
minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		local inv = player:get_inventory()
		for i=1, 6 do
			local stack = inv:get_stack("armor", i)
			local item = stack:get_name()
                        if item == "skytest:speed_boots" or item == "skytest:neptonium_armor_set" then
				boots.set({player = player})
				local playername = player:get_player_name()
				local privs = minetest.get_player_privs(playername)
				privs.fast = true
				minetest.set_player_privs(playername, privs)
				return
			else 
				local playername = player:get_player_name()
				local privs = minetest.get_player_privs(playername)
		privs.fast = nil
		minetest.set_player_privs(playername, privs)
end
		end
		boots.del({player = player})
	end
end)

minetest.register_on_joinplayer(function (player)
  boots.huds[player] = {}
end)

minetest.register_craftitem("skytest:speed_boots", {
	description = "Running shoes",
	inventory_image = "speed_boots_item.png",
        stack_max = 1,
})
minetest.register_craft({
	output = "skytest:speed_boots",
	recipe = {
		{"skytest:redstone", "", "skytest:redstone"},
		{"bucket:bucket_lava", "", "bucket:bucket_lava"}
	}
})
jump_leggings = {
  huds = {}
}

jump_leggings.set = function(defs)
	if not string.match(armor["textures"][defs.player:get_player_name()].armor, "jump_leggings.png") then
		local player = defs.player
		local armor_texture = armor["textures"][player:get_player_name()].armor
		armor_texture = armor_texture.."^jump_leggings.png"
		armor["textures"][player:get_player_name()].armor = armor_texture
		armor.update_player_visuals(armor,player)
		
		--attempt to update the preview
		local preview = armor["textures"][player:get_player_name()].preview
		print(dump(armor["textures"][player:get_player_name()]))
		
		preview = preview.."^jump_leggings_preview.png"
		
		armor["textures"][player:get_player_name()].preview = preview
		
		
	end
	
end

jump_leggings.add = function (defs)
  defs.darkness = math.max(defs.darkness + #jump_leggings.huds[defs.player], 0)
  jump_leggings.set(defs)
end
jump_leggings.del = function(defs)
	if jump_leggings.huds[defs.player][1] ~= nil then
		-- removing huds
		defs.player:hud_remove(jump_leggings.huds[defs.player][1])
		jump_leggings.huds[defs.player][1] = nil
	end
end
jump_leggings.remove = function (defs)
  defs.darkness = math.max(defs.darkness + #jump_leggings.huds[defs.player], 0)
  jump_leggings.del(defs)
end

--make this do something more efficient
minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		local inv = player:get_inventory()
		for i=1, 6 do
			local stack = inv:get_stack("armor", i)
			local item = stack:get_name()
                        if item == "skytest:jump_leggings" then
				jump_leggings.set({player = player})
		player:set_physics_override({jump=2})
				return
			else 
		player:set_physics_override({jump=1})
end
		end
		jump_leggings.del({player = player})
	end
end)

minetest.register_on_joinplayer(function (player)
  jump_leggings.huds[player] = {}
end)

minetest.register_craftitem("skytest:jump_leggings", {
	description = "Jump leggings",
	inventory_image = "jump_leggings_item.png",
        stack_max = 1,
})
minetest.register_craft({
	output = "skytest:jump_leggings",
	recipe = {
		{"default:ladder_steel", "3d_armor:leggings_cactus", "default:ladder_steel"},
		{"default:ladder_steel", "", "default:ladder_steel"},
		{"default:ladder_steel", "3d_armor:leggings_cactus", "default:ladder_steel"}
	}
})

wings = {
  huds = {}
}

wings.set = function(defs)
	--set the wings hud
	if wings.huds[defs.player][1] == nil then
                local hud_id=defs.player:hud_add({
		hud_elem_type = "image",
		position = {x = 0.5, y = 0.5},
		scale = {
			x = -1,
			y = -1
			},
			text = "wings.png"
		})
		wings.huds[defs.player][1] = hud_id;
	elseif not string.match(armor["textures"][defs.player:get_player_name()].armor, "wings_helmet.png") then
		local player = defs.player
		local armor_texture = armor["textures"][player:get_player_name()].armor
		armor_texture = armor_texture.."^wings_helmet.png"
		armor["textures"][player:get_player_name()].armor = armor_texture
		armor.update_player_visuals(armor,player)
		
		--attempt to update the preview
		local preview = armor["textures"][player:get_player_name()].preview
		print(dump(armor["textures"][player:get_player_name()]))
		
		preview = preview.."^wings_preview.png"
		
		armor["textures"][player:get_player_name()].preview = preview
		
		
	end
	
end

wings.add = function (defs)
  defs.darkness = math.max(defs.darkness + #wings.huds[defs.player], 0)
  wings.set(defs)
end
wings.del = function(defs)
	if wings.huds[defs.player][1] ~= nil then
		-- removing huds
		defs.player:hud_remove(wings.huds[defs.player][1])
		wings.huds[defs.player][1] = nil
	end
end
wings.remove = function (defs)
  defs.darkness = math.max(defs.darkness + #wings.huds[defs.player], 0)
  wings.del(defs)
end

--make this do something more efficient
minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		local inv = player:get_inventory()
		for i=1, 6 do
			local stack = inv:get_stack("armor", i)
			local item = stack:get_name()
            if item == "skytest:wings" or item == "skytest:neptonium_armor_set" then
				wings.set({player = player})
				local playername = player:get_player_name()
				local privs = minetest.get_player_privs(playername)
				privs.fly = true
				minetest.set_player_privs(playername, privs)
				return
			else 
				local playername = player:get_player_name()
				local privs = minetest.get_player_privs(playername)
		privs.fly = nil
		minetest.set_player_privs(playername, privs)
end
		end
		wings.del({player = player})
	end
end)

minetest.register_on_joinplayer(function (player)
  wings.huds[player] = {}
end)
minetest.register_craftitem("skytest:wings", {
	description = "A pair o' wings",
	inventory_image = "wings_item.png",
        stack_max = 1,
})
minetest.register_craft({
	output = "skytest:wings",
	recipe = {
		{"dye:white", "", "dye:white"},
		{"skytest:enchanted_fabric", "skytest:enchanted_block", "skytest:enchanted_fabric"},
		{"skytest:enchanted_fabric", "skytest:enchanted_fabric", "skytest:enchanted_fabric"}
	}
})
gravity_boots = {
  huds = {}
}

gravity_boots.set = function(defs)
	if not string.match(armor["textures"][defs.player:get_player_name()].armor, "gravity_boots.png") then
		local player = defs.player
		local armor_texture = armor["textures"][player:get_player_name()].armor
		armor_texture = armor_texture.."^gravity_boots.png"
		armor["textures"][player:get_player_name()].armor = armor_texture
		armor.update_player_visuals(armor,player)
		
		--attempt to update the preview
		local preview = armor["textures"][player:get_player_name()].preview
		print(dump(armor["textures"][player:get_player_name()]))
		
		preview = preview.."^gravity_boots_preview.png"
		
		armor["textures"][player:get_player_name()].preview = preview
		
		
	end
	
end

gravity_boots.add = function (defs)
  defs.darkness = math.max(defs.darkness + #gravity_boots.huds[defs.player], 0)
  gravity_boots.set(defs)
end
gravity_boots.del = function(defs)
	if gravity_boots.huds[defs.player][1] ~= nil then
		-- removing huds
		defs.player:hud_remove(gravity_boots.huds[defs.player][1])
		gravity_boots.huds[defs.player][1] = nil
	end
end
gravity_boots.remove = function (defs)
  defs.darkness = math.max(defs.darkness + #gravity_boots.huds[defs.player], 0)
  gravity_boots.del(defs)
end

--make this do something more efficient
minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		local inv = player:get_inventory()
		for i=1, 6 do
			local stack = inv:get_stack("armor", i)
			local item = stack:get_name()
                        if item == "skytest:gravity_boots" or item == "skytest:neptonium_armor_set" then
				gravity_boots.set({player = player})
		player:set_physics_override({gravity=0.050})
		player:set_physics_override({jump=0.25})
				return
			else 
		player:set_physics_override({gravity=1})
		player:set_physics_override({jump=1})
end
		end
		gravity_boots.del({player = player})
	end
end)

minetest.register_on_joinplayer(function (player)
  gravity_boots.huds[player] = {}
end)

minetest.register_craftitem("skytest:gravity_boots", {
	description = "Gravity boots... they defiey gravity",
	inventory_image = "gravity_boots_item.png",
        stack_max = 1,
})
minetest.register_craft({
	output = "skytest:gravity_boots",
	recipe = {
		{"default:mese_crystal_fragment", "", "default:mese_crystal_fragment"},
		{"skytest:enchanted_fabric", "3d_armor:boots_diamond", "skytest:enchanted_fabric"},
		{"default:mese_crystal_fragment", "", "default:mese_crystal_fragment"}
	}
})

local level = 4000
local heal = 4000
local use = 0
local fire = 4000
local water = 1
local radiation = 4000

minetest.register_tool("skytest:neptonium_armor_set", {
	description = "Neptonium Armor Set",
	inventory_image = "neptonium_chestplate.png^neptonium_leggings.png^neptonium_helmet.png^neptonium_boots.png",
	wear = 0,
		groups = {
		armor_head = level,
		armor_torso = level,
		armor_legs = level,
		armor_feet = level,
		armor_heal = heal,
		armor_use = use,
		armor_fire = fire,
		armor_water = water,
		armor_radiation = radiation,
	},
	})
minetest.register_craft({
	output = "skytest:neptonium_armor_set",
	recipe = {
		{"skytest:neptonium_chestplate", "skytest:neptonium_helmet", ""},
		{"skytest:neptonium_leggings", "skytest:neptonium_boots", ""},
	}
})

minetest.register_craftitem("skytest:neptonium_boots", {
	description = "Neptonium Boots",
	inventory_image = "neptonium_boots.png",
})
minetest.register_craft({
	output = "skytest:neptonium_boots",
	recipe = {
		{"", "", ""},
		{"skytest:neptonium_crystal", "skytest:cosmic_crystal", "skytest:neptonium_crystal"},
		{"skytest:neptonium_crystal", "3d_armor:boots_admin", "skytest:neptonium_crystal"},
	}
})
minetest.register_craftitem("skytest:neptonium_helmet", {
	description = "Neptonium helmet",
	inventory_image = "neptonium_helmet.png",
})
minetest.register_craft({
	output = "skytest:neptonium_helmet",
	recipe = {
		{"skytest:neptonium_crystal", "skytest:neptonium_crystal", "skytest:neptonium_crystal"},
		{"skytest:neptonium_crystal", "skytest:cosmic_crystal", "skytest:neptonium_crystal"},
		{"", "3d_armor:helmet_admin", ""},
	}
})
minetest.register_craftitem("skytest:neptonium_leggings", {
	description = "Neptonium Leggings",
	inventory_image = "neptonium_leggings.png",
})
minetest.register_craft({
	output = "skytest:neptonium_leggings",
	recipe = {
		{"skytest:neptonium_crystal", "skytest:neptonium_crystal", "skytest:neptonium_crystal"},
		{"skytest:neptonium_crystal", "skytest:cosmic_crystal", "skytest:neptonium_crystal"},
		{"skytest:neptonium_crystal", "3d_armor:leggings_admin", "skytest:neptonium_crystal"},
	}
})
minetest.register_craftitem("skytest:neptonium_chestplate", {
	description = "Neptonium Chestplate",
	inventory_image = "neptonium_chestplate.png",
})
minetest.register_craft({
	output = "skytest:neptonium_chestplate",
	recipe = {
		{"skytest:neptonium_crystal", "3d_armor:chestplate_admin", "skytest:neptonium_crystal"},
		{"skytest:neptonium_crystal", "skytest:cosmic_crystal", "skytest:neptonium_crystal"},
		{"skytest:neptonium_crystal", "skytest:neptonium_crystal", "skytest:neptonium_crystal"},
	}
})
minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		local inv = player:get_inventory()
		for i=1, 6 do
			local stack = inv:get_stack("armor", i)
			local item = stack:get_name()
            if item == "skytest:neptonium_armor_set" then
				local playername = player:get_player_name()
				local privs = minetest.get_player_privs(playername)
				privs.noclip = true
				privs.zoom = true
				privs.debug = true
				minetest.set_player_privs(playername, privs)
				return
			else 
				local playername = player:get_player_name()
				local privs = minetest.get_player_privs(playername)
		privs.noclip = nil
		privs.zoom = nil
		privs.debug = nil
		minetest.set_player_privs(playername, privs)
end
		end
	end
end)
minetest.register_craftitem("skytest:belt", {
	description = "Tool Belt\nAllows player to set the number\nof slots of the hotbar with /sethotbarsize\n while the player is wearing this piece of armor",
	inventory_image = "skytest_belt_preview.png",
	        stack_max = 1,
})
minetest.register_craft({
	output = "skytest:belt",
	recipe = {
		{"", "skytest:enchanted_fabric", ""},
		{"skytest:enchanted_fiber", "skytest:enchanted_fiber", "skytest:enchanted_fiber"},
		{"", "default:steelblock", ""},
	}
})
minetest.register_privilege("hotbar", {
	description = "Allows player to set the number of slots of the hotbar with /sethotbarsize",
	give_to_singleplayer = false
})
minetest.register_chatcommand("sethotbarsize", {
	params = "<1...23>",
	description = "Sets the size of your hotbar to the provided number of slots; the number must be between 1 and 23",
	privs = {hotbar=true},
	func = function(name, slots)
		if slots == "" then
			minetest.chat_send_player(name, "You did not specify the parameter.")
			return
		end
		if type(tonumber(slots)) ~= "number" then
			minetest.chat_send_player(name, "This is not a number.")
			return
		end
		if tonumber(slots) < 1 or tonumber(slots) > 23 then
			minetest.chat_send_player(name, "Number of slots is out of bounds. The number of slots must be between 1 and 23.")
			return
		end
		local player = minetest.get_player_by_name(name)
		player:hud_set_hotbar_itemcount(tonumber(slots))
	end,
})
minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		local inv = player:get_inventory()
		for i=1, 6 do
			local stack = inv:get_stack("armor", i)
			local item = stack:get_name()
            if item == "skytest:belt" then
				local playername = player:get_player_name()
				local privs = minetest.get_player_privs(playername)
				privs.hotbar = true
				minetest.set_player_privs(playername, privs)
				return
			else 
				local playername = player:get_player_name()
				local privs = minetest.get_player_privs(playername)
		privs.hotbar = nil
		minetest.set_player_privs(playername, privs)
end
		end
	end
end)

minetest.register_craftitem("skytest:ptd", {
	description = "Personal Time Dilators",
	inventory_image = "skytest_belt_preview.png^orbs_orb_day.png^[lowpart:50:orbs_orb_night.png",
	stack_max = 1,
})
minetest.register_craft({
	output = "skytest:ptd",
	recipe = {
		{"default:coal_lump", "skytest:neptonium_ingot", "default:coal_lump"},
		{"skytest:source", "skytest:belt", "skytest:source"},
		{"default:coal_lump", "skytest:spectral_ingot", "default:coal_lump"},
	}
})
minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		local inv = player:get_inventory()
		for i=1, 6 do
			local stack = inv:get_stack("armor", i)
			local item = stack:get_name()
            if item == "skytest:ptd" then
				local playername = player:get_player_name()
				local privs = minetest.get_player_privs(playername)
				privs.settime = true
				minetest.set_player_privs(playername, privs)
				return
			else 
				local playername = player:get_player_name()
				local privs = minetest.get_player_privs(playername)
		privs.settime = nil
		minetest.set_player_privs(playername, privs)
end
		end
	end
end)
