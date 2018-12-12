--Speed boots
minetest.register_tool("skytest:speed_boots", {
	description = "Running shoes",
	inventory_image = "speed_boots_item.png",  
	on_place = function(itemstack, user, pointed_thing)
				local privs = minetest.get_player_privs(user)
				privs.fast = true
				minetest.set_player_privs(user, privs)
		itemstack:replace("skytest:activated_speed_boots")
		return itemstack
	end	
})
minetest.register_tool("skytest:activated_speed_boots", {
	description = "Activated Running shoes",
	inventory_image = "speed_boots_item.png^[colorize:violet:80",  
	groups = {not_in_creative_inventory = 1},	
	on_place = function(itemstack, user, pointed_thing)
					local privs = minetest.get_player_privs(user)
				privs.fast = nil
				minetest.set_player_privs(user, privs)
		itemstack:replace("skytest:speed_boots")
		return itemstack
	end
})




--wings
minetest.register_tool("skytest:wings", {
	description = "A pair o' wings",
	inventory_image = "wings_item.png",  
	on_place = function(itemstack, user, pointed_thing)
						local privs = minetest.get_player_privs(user)
				privs.fly = true
				minetest.set_player_privs(user, privs)
		itemstack:replace("skytest:activated_wings")
		return itemstack
	end	
})
minetest.register_tool("skytest:activated_wings", {
	description = "Activated pair o' wings",
	inventory_image = "wings_item.png^[colorize:violet:80",
	groups = {not_in_creative_inventory = 1},	    
	on_place = function(itemstack, user, pointed_thing)
						local privs = minetest.get_player_privs(user)
				privs.fly = nil
				minetest.set_player_privs(user, privs)
		itemstack:replace("skytest:wings")
		return itemstack
	end
})




--neptonium
minetest.register_tool("skytest:neptonium_armor_set", {
	description = "Neptonium Armor Set",
	inventory_image = "neptonium_chestplate.png^neptonium_leggings.png^neptonium_helmet.png^neptonium_boots.png",  
	on_place = function(itemstack, user, pointed_thing)
	local privs = minetest.get_player_privs(user)
				privs.fly = true
				privs.fast = true
				privs.noclip = true
				privs.zoom = true
				privs.debug = true
				minetest.set_player_privs(user, privs)
		itemstack:replace("skytest:activated_neptonium_armor_set")
		return itemstack
	end	
})
minetest.register_tool("skytest:activated_neptonium_armor_set", {
	description = "Activated Neptonium Armor Set",
		groups = {not_in_creative_inventory = 1},	
	inventory_image = "neptonium_chestplate.png^neptonium_leggings.png^neptonium_helmet.png^neptonium_boots.png^[colorize:violet:80",    
	on_place = function(itemstack, user, pointed_thing)
		local privs = minetest.get_player_privs(user)
				privs.fly = nil
				privs.fast = nil
				privs.noclip = nil
				privs.zoom = nil
				privs.debug = nil
				minetest.set_player_privs(user, privs)
		itemstack:replace("skytest:neptonium_armor_set")
		return itemstack
	end
})



--ptd
minetest.register_tool("skytest:ptd", {
	description = "Personal Time Dilators",
	inventory_image = "skytest_belt_preview.png^orbs_orb_day.png^[lowpart:50:orbs_orb_night.png",  
	on_place = function(itemstack, user, pointed_thing)
	local privs = minetest.get_player_privs(user)
				privs.settime = true
				minetest.set_player_privs(user, privs)
		itemstack:replace("skytest:activated_ptd")
		return itemstack
	end	
})
minetest.register_tool("skytest:activated_ptd", {
	description = "Activated Personal Time Dilators",
		groups = {not_in_creative_inventory = 1},	
	inventory_image = "skytest_belt_preview.png^orbs_orb_day.png^[lowpart:50:orbs_orb_night.png^[colorize:violet:80",    
	on_place = function(itemstack, user, pointed_thing)
		local privs = minetest.get_player_privs(user)
				privs.settime = nil
				minetest.set_player_privs(user, privs)
		itemstack:replace("skytest:ptd")
		return itemstack
	end
})
minetest.register_craft({
	output = "skytest:speed_boots",
	recipe = {
		{"skytest:redstone", "", "skytest:redstone"},
		{"bucket:bucket_lava", "", "bucket:bucket_lava"}
	}
})
minetest.register_craft({
	output = "skytest:wings",
	recipe = {
		{"dye:white", "", "dye:white"},
		{"skytest:enchanted_fabric", "skytest:enchanted_block", "skytest:enchanted_fabric"},
		{"skytest:enchanted_fabric", "skytest:enchanted_fabric", "skytest:enchanted_fabric"}
	}
})
minetest.register_craft({
	output = "skytest:neptonium_armor_set",
	recipe = {
		{"skytest:neptonium_chestplate", "skytest:neptonium_helmet", ""},
		{"skytest:neptonium_leggings", "skytest:neptonium_boots", ""},
	}
})

minetest.register_tool("skytest:neptonium_boots", {
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
minetest.register_tool("skytest:neptonium_helmet", {
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
minetest.register_tool("skytest:neptonium_leggings", {
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
minetest.register_tool("skytest:neptonium_chestplate", {
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

minetest.register_craft({
	output = "skytest:ptd",
	recipe = {
		{"default:coal_lump", "skytest:neptonium_ingot", "default:coal_lump"},
		{"skytest:source", "skytest:enchanted_fabric", "skytest:source"},
		{"default:coal_lump", "skytest:spectral_ingot", "default:coal_lump"},
	}
})