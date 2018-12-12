mystical_agriculture = {}

local modpath = minetest.get_modpath("mystical_agriculture")

mystical_agriculture.register_normal_ore_crop = function(id,itemid,desc,craftset,amount,craft6set,seedtex,croptex,essencetex)    
if seedtex == nil then
minetest.register_craftitem("mystical_agriculture:"..id.."_seed", {
	description = desc.." Seeds",
	inventory_image = id.."_seeds.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "mystical_agriculture:"..id.."step_1")
	end
})
else
minetest.register_craftitem("mystical_agriculture:"..id.."_seed", {
	description = desc.." Seeds",
	inventory_image = seedtex,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "mystical_agriculture:"..id.."step_1")
	end
})
end

for n = 1,5 do
minetest.register_node("mystical_agriculture:"..id.."step_"..n, {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"crop"..n..".png"},
		paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
		selection_box = farming.select,
	drop = "mystical_agriculture:"..id.."_seed",
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1,growing=1},
	sounds = default.node_sound_leaves_defaults(),
    on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        if itemstack:get_name() == "mystical_agriculture:magicly_infused_bonemeal" then
            minetest.set_node(pos, {name="mystical_agriculture:"..id.."step_6"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_abm({
	nodenames = {"mystical_agriculture:"..id.."step_"..n},
	interval = 3,
	chance = 3,
	action = function(pos, node)
		local pos_under = {x=pos.x, y=pos.y-2, z=pos.z}
		if minetest.get_node(pos_under).name == "mystical_agriculture:growth_crystal" then
		minetest.set_node(pos, {name = "mystical_agriculture:"..id.."step_"..(n+1)})
    end
	end
})
end
if croptex == nil then
minetest.register_node("mystical_agriculture:"..id.."step_6", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {id.."_crop.png"},
		paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
		selection_box = farming.select,
	drop = "mystical_agriculture:"..id.."_seed",
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1,growing=1},
	sounds = default.node_sound_leaves_defaults(),
	on_rightclick = function(pos, node)
		minetest.set_node(pos, {name="mystical_agriculture:"..id.."step_1"})
		pos.y = pos.y + 0.5
		minetest.add_item(pos, "mystical_agriculture:"..id.."_essence")
	end,
})
else
minetest.register_node("mystical_agriculture:"..id.."step_6", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {croptex},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
		selection_box = farming.select,
	drop = "mystical_agriculture:"..id.."_seed",
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1,growing=1},
	sounds = default.node_sound_leaves_defaults(),
	on_rightclick = function(pos, node)
		minetest.set_node(pos, {name="mystical_agriculture:"..id.."step_1"})
		pos.y = pos.y + 0.5
		minetest.add_item(pos, "mystical_agriculture:"..id.."_essence")
	end,
})
end
minetest.register_abm({
	nodenames = {"mystical_agriculture:"..id.."step_6"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		local pos_under = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.get_node(pos_under).name == "mystical_agriculture:harvest_crystal" then
		minetest.set_node(pos, {name="mystical_agriculture:"..id.."step_1"})
		pos.y = pos.y + 0.5
		minetest.add_item(pos, "mystical_agriculture:"..id.."_essence")
    end
	end
})
if essencetex == nil then
minetest.register_craftitem("mystical_agriculture:"..id.."_essence", {
	description = desc.." Essence",
	inventory_image = id.."_essence.png",
})
else
minetest.register_craftitem("mystical_agriculture:"..id.."_essence", {
	description = desc.." Essence",
	inventory_image = essencetex,
})
end


if craftset == 1 and amount ~= nil then
minetest.register_craft({
        output = itemid.." "..amount,
        recipe = {
            {"mystical_agriculture:"..id.."_essence","mystical_agriculture:"..id.."_essence","mystical_agriculture:"..id.."_essence"},
            {"mystical_agriculture:"..id.."_essence","mystical_agriculture:"..id.."_essence","mystical_agriculture:"..id.."_essence"},
            {"mystical_agriculture:"..id.."_essence","mystical_agriculture:"..id.."_essence","mystical_agriculture:"..id.."_essence"},
        }
    })
end
if craftset == 2 and amount ~= nil then
minetest.register_craft({
        output = itemid.." "..amount,
        recipe = {
            {"mystical_agriculture:"..id.."_essence","mystical_agriculture:"..id.."_essence",""},
            {"mystical_agriculture:"..id.."_essence","mystical_agriculture:"..id.."_essence",""},
            {"","",""},
        }
    })
end
if craftset == 3 and amount ~= nil then
minetest.register_craft({
        output = itemid.." "..amount,
        recipe = {
            {"mystical_agriculture:"..id.."_essence","mystical_agriculture:"..id.."_essence","mystical_agriculture:"..id.."_essence"},
            {"mystical_agriculture:"..id.."_essence","","mystical_agriculture:"..id.."_essence"},
            {"mystical_agriculture:"..id.."_essence","mystical_agriculture:"..id.."_essence","mystical_agriculture:"..id.."_essence"},
        }
    })
end
if craftset == 4 and amount ~= nil then
minetest.register_craft({
        output = itemid.." "..amount,
        recipe = {
            {"","mystical_agriculture:"..id.."_essence",""},
            {"mystical_agriculture:"..id.."_essence","bucket:bucket_empty","mystical_agriculture:"..id.."_essence"},
            {"","mystical_agriculture:"..id.."_essence",""},
        }
    })
end
if craftset == 5 and amount ~= nil then
minetest.register_craft({
        output = itemid.." "..amount,
        recipe = {
            {"","mystical_agriculture:"..id.."_essence",""},
            {"mystical_agriculture:"..id.."_essence","mystical_agriculture:"..id.."_essence","mystical_agriculture:"..id.."_essence"},
            {"","mystical_agriculture:"..id.."_essence",""},
        }
    })
end
if craftset == 6 and amount ~= nil and craft6set ~= nil then
minetest.register_craft({
        output = itemid.." "..amount,
        recipe = {
            {"","mystical_agriculture:"..id.."_essence",""},
            {"mystical_agriculture:"..id.."_essence",craft6set,"mystical_agriculture:"..id.."_essence"},
            {"","mystical_agriculture:"..id.."_essence",""},
        }
    })
end
if itemid ~= 0 then
minetest.register_craft({
        output = "mystical_agriculture:"..id.."_seed",
        recipe = {
            {"mystical_agriculture:blank_seed",itemid,"mystical_agriculture:blank_seed"},
            {itemid,"mystical_agriculture:blank_seed",itemid},
            {"mystical_agriculture:blank_seed",itemid,"mystical_agriculture:blank_seed"},
        }
    })
end
end

--mystical_agriculture.register_normal_ore_crop(id,itemid,desc,craftset,amount,craft6set,seedtex,croptex,essencetex) --max options
--mystical_agriculture.register_normal_ore_crop(id,itemid,desc) --minimal options
--[[
craft settings
0 == Essence

1
OOO
OOO
OOO

2
OO
OO

3
OOO
O O
OOO

4
U == Empty bucket
 O 
OUO
 O
 
5
 O 
OOO
 O
 
6
X = craft6set option(right after amount)
 O 
OXO
 O
]]--  
--gems
mystical_agriculture.register_normal_ore_crop("diamond","default:diamond","Diamond",1,4)    
mystical_agriculture.register_normal_ore_crop("mese","default:mese_crystal","Mese",1,3) 

--basic metals
mystical_agriculture.register_normal_ore_crop("tin","default:tin_ingot","Tin",2,4)     
mystical_agriculture.register_normal_ore_crop("copper","default:copper_ingot","Copper",2,4)    
mystical_agriculture.register_normal_ore_crop("iron","default:steel_ingot","Wrought Iron",2,4)    
mystical_agriculture.register_normal_ore_crop("gold","default:gold_ingot","Gold",2,2)   
mystical_agriculture.register_normal_ore_crop("bronze","default:bronze_ingot","Bronze",2,8)     

--basic misc
mystical_agriculture.register_normal_ore_crop("coal","default:coal_lump","Coal",2,4)
mystical_agriculture.register_normal_ore_crop("bone","bones:bones","Bone",6,1,"default:clay")  

--liquids 
mystical_agriculture.register_normal_ore_crop("water","bucket:bucket_water","Water",4,1)   
mystical_agriculture.register_normal_ore_crop("fire","bucket:bucket_lava","Fire",4,1)
	minetest.register_craft({
        output = "default:obsidian_shard 14",
        recipe = {
            {"mystical_agriculture:water_essence","mystical_agriculture:fire_essence","mystical_agriculture:water_essence"},
            {"mystical_agriculture:fire_essence","default:cobble","mystical_agriculture:fire_essence"},
            {"mystical_agriculture:water_essence","mystical_agriculture:fire_essence","mystical_agriculture:water_essence"},
        }
    })


--multi use materials
mystical_agriculture.register_normal_ore_crop("dirt","group:soil","Earth",0,0) 
mystical_agriculture.register_normal_ore_crop("stone","group:stone","Rock",0,0) 
mystical_agriculture.register_normal_ore_crop("wood","group:tree","Wood",0,0) 
mystical_agriculture.register_normal_ore_crop("ice","default:ice","Ice",0,0) 
mystical_agriculture.register_normal_ore_crop("nature",0,"Nature",0,0) 

minetest.register_craft({
        output = "mystical_agriculture:nature_seed",
        recipe = {
            {"mystical_agriculture:blank_seed","mystical_agriculture:blank_seed","mystical_agriculture:blank_seed"},
            {"mystical_agriculture:stone_essence","mystical_agriculture:water_essence","mystical_agriculture:stone_essence"},
            {"mystical_agriculture:dirt_essence","mystical_agriculture:water_essence","mystical_agriculture:dirt_essence"},
        }
    })
	minetest.register_craft({
        output = "default:sapling 4",
        recipe = {
            {"","mystical_agriculture:nature_essence",""},
            {"mystical_agriculture:nature_essence","mystical_agriculture:wood_essence","mystical_agriculture:nature_essence"},
            {"","mystical_agriculture:wood_essence",""},
        }
    })
		minetest.register_craft({
        output = "default:leaves 8",
        recipe = {
            {"mystical_agriculture:nature_essence","mystical_agriculture:nature_essence"},
            {"mystical_agriculture:nature_essence","mystical_agriculture:nature_essence"},
        }
    })
		minetest.register_craft({
        output = "default:dirt_with_grass 4",
        recipe = {
            {"","default:dirt",""},
            {"default:dirt","mystical_agriculture:nature_essence","default:dirt"},
            {"","default:dirt",""},
        }
    })
		minetest.register_craft({
        output = "default:papyrus 6",
        recipe = {
            {"mystical_agriculture:nature_essence","","mystical_agriculture:nature_essence"},
            {"mystical_agriculture:nature_essence","","mystical_agriculture:nature_essence"},
            {"mystical_agriculture:nature_essence","","mystical_agriculture:nature_essence"},
        }
    })
		minetest.register_craft({
        output = "default:cactus 5",
        recipe = {
            {"mystical_agriculture:nature_essence","","mystical_agriculture:nature_essence"},
            {"","mystical_agriculture:nature_essence",""},
            {"mystical_agriculture:nature_essence","","mystical_agriculture:nature_essence"},
        }
    })
minetest.register_craft({
        output = "default:fern_1 1",
        recipe = {
            {"mystical_agriculture:nature_essence","",""},
            {"","",""},
            {"","",""},
        }
    })
	minetest.register_craft({
        output = "default:grass_1 1",
        recipe = {
            {"","mystical_agriculture:nature_essence",""},
            {"","",""},
            {"","",""},
        }
    })
	minetest.register_craft({
        output = "default:jungle_grass 1",
        recipe = {
            {"","","mystical_agriculture:nature_essence"},
            {"","",""},
            {"","",""},
        }
    })
	minetest.register_craft({
        output = "default:marram_grass_1",
        recipe = {
            {"","",""},
            {"mystical_agriculture:nature_essence","",""},
            {"","",""},
        }
    })
	minetest.register_craft({
        output = "default:sand_with_kelp 1",
        recipe = {
            {"","",""},
            {"","mystical_agriculture:nature_essence",""},
            {"","",""},
        }
    })
	minetest.register_craft({
        output = "default:permafrost_with_moss 4",
        recipe = {
            {"","default:permafrost",""},
            {"default:permafrost","mystical_agriculture:nature_essence","default:permafrost"},
            {"","default:permafrost",""},
        }
    })
minetest.register_craft({
        output = "default:wood 4",
        recipe = {
            {"mystical_agriculture:wood_essence"},
        }
    })
	minetest.register_craft({
        output = "default:tree 4",
        recipe = {
            {"mystical_agriculture:wood_essence","mystical_agriculture:wood_essence"},
            {"mystical_agriculture:wood_essence","mystical_agriculture:wood_essence"},
        }
    })
		minetest.register_craft({
        output = "default:dirt 4",
        recipe = {
            {"","mystical_agriculture:dirt_essence",""},
            {"mystical_agriculture:dirt_essence","mystical_agriculture:stone_essence","mystical_agriculture:dirt_essence"},
            {"","mystical_agriculture:dirt_essence",""},
        }
    })
		minetest.register_craft({
        output = "default:gravel 4",
        recipe = {
            {"","mystical_agriculture:stone_essence",""},
            {"mystical_agriculture:stone_essence","mystical_agriculture:dirt_essence","mystical_agriculture:stone_essence"},
            {"","mystical_agriculture:stone_essence",""},
        }
    })
		minetest.register_craft({
        output = "default:clay 2",
        recipe = {
            {"mystical_agriculture:dirt_essence","mystical_agriculture:stone_essence","mystical_agriculture:dirt_essence"},
            {"mystical_agriculture:stone_essence","mystical_agriculture:dirt_essence","mystical_agriculture:stone_essence"},
            {"mystical_agriculture:dirt_essence","mystical_agriculture:stone_essence","mystical_agriculture:dirt_essence"},
        }
    })
			minetest.register_craft({
        output = "default:cobble 2",
        recipe = {
            {"","mystical_agriculture:stone_essence",""},
            {"mystical_agriculture:stone_essence","","mystical_agriculture:stone_essence"},
            {"","mystical_agriculture:stone_essence",""},
        }
    })
				minetest.register_craft({
        output = "default:stone 2",
        recipe = {
            {"","mystical_agriculture:stone_essence",""},
            {"mystical_agriculture:stone_essence","mystical_agriculture:stone_essence","mystical_agriculture:stone_essence"},
            {"","mystical_agriculture:stone_essence",""},
        }
    })
	minetest.register_craft({
        output = "default:ice 4",
        recipe = {
            {"","mystical_agriculture:ice_essence",""},
            {"mystical_agriculture:ice_essence","mystical_agriculture:ice_essence","mystical_agriculture:ice_essence"},
            {"","mystical_agriculture:ice_essence",""},
        }
    })
		minetest.register_craft({
        output = "default:dirt_with_snow 4",
        recipe = {
            {"","default:dirt",""},
            {"default:dirt","mystical_agriculture:ice_essence","default:dirt"},
            {"","default:dirt",""},
        }
    })
		minetest.register_craft({
        output = "default:snow 4",
        recipe = {
            {"","",""},
            {"","mystical_agriculture:ice_essence",""},
            {"","",""},
        }
    })
		minetest.register_craft({
        output = "default:snowblock 2",
        recipe = {
            {"","mystical_agriculture:ice_essence",""},
            {"mystical_agriculture:ice_essence","mystical_agriculture:ice_essence","mystical_agriculture:ice_essence"},
            {"","mystical_agriculture:ice_essence",""},
        }
    })








minetest.register_craft({
        output = "mystical_agriculture:growth_crystal",
        recipe = {
            {"group:soil","mystical_agriculture:magicly_infused_bonemeal","group:soil"},
            {"mystical_agriculture:magicly_infused_bonemeal","group:soil","mystical_agriculture:magicly_infused_bonemeal"},
            {"group:soil","mystical_agriculture:magicly_infused_bonemeal","group:soil"},
        }
    })
	minetest.register_craft({
        output = "mystical_agriculture:blank_seed 2",
        recipe = {
            {"group:seed","default:mese_crystal","group:seed"},
            {"default:diamond","group:seed","default:diamond"},
            {"group:seed","default:mese_crystal","group:seed"},
        }
    })
	minetest.register_craft({
        output = "mystical_agriculture:magicly_infused_bonemeal 36",
        recipe = {
            {"mystical_agriculture:blank_seed","bones:bones","mystical_agriculture:blank_seed"},
            {"bones:bones","mystical_agriculture:blank_seed","bones:bones"},
            {"mystical_agriculture:blank_seed","bones:bones","mystical_agriculture:blank_seed"},
        }
    })

	minetest.register_craft({
        output = "mystical_agriculture:harvest_crystal",
        recipe = {
            {"mystical_agriculture:magicly_infused_bonemeal","mystical_agriculture:magicly_infused_bonemeal","mystical_agriculture:magicly_infused_bonemeal"},
            {"mystical_agriculture:magicly_infused_bonemeal","mystical_agriculture:growth_crystal","mystical_agriculture:magicly_infused_bonemeal"},
            {"mystical_agriculture:magicly_infused_bonemeal","mystical_agriculture:magicly_infused_bonemeal","mystical_agriculture:magicly_infused_bonemeal"},
        }
    })
minetest.register_node("mystical_agriculture:growth_crystal", {
    description = "Growth crystal\nPlace underneath the soil block resource\nseeds are on to boost growth",
        tiles = {{image = "growth_accelerator.png^[colorize:blue:80",animation = {type = "vertical_frames",aspect_w = 8,aspect_h = 8,length = 5}},
		},
        groups = {cracky=1,soil = 2},
		sounds = default.node_sound_glass_defaults(),
		light_source = 6,
})

minetest.register_node("mystical_agriculture:harvest_crystal", {
    description = "Harvest crystal\nResource crops growing on this will be\nharvested automaticly",
        tiles = {{image = "growth_accelerator.png",animation = {type = "vertical_frames",aspect_w = 8,aspect_h = 8,length = 5}},},
        groups = {cracky=1,soil = 2},
		sounds = default.node_sound_glass_defaults(),
		light_source = 6,
})
minetest.register_craftitem("mystical_agriculture:magicly_infused_bonemeal", {
	description = "Growth essence\nInstantly grows any resource crops",
	inventory_image = "fertilized_essence.png",
})

minetest.register_craftitem("mystical_agriculture:blank_seed", {
	description = "Blank Seeds",
	inventory_image = "crafting_base_crafting_seed.png",
	        groups = {seed=1},
})

minetest.register_craftitem("mystical_agriculture:prosperity_shard", {
	description = "Prosperity Shard",
	inventory_image = "prosperity_shard.png",
})
minetest.register_tool("mystical_agriculture:infusion_crystal", {
	description = "Infusion Crystal",
	inventory_image = "infusion_crystal.png",
})
minetest.register_tool("mystical_agriculture:master_infusion_crystal", {
	description = "Master Infusion Crystal",
	inventory_image = "master_infusion_crystal.png",
})
--[[
		if not minetest.settings:get_bool("creative_mode") then
			itemstack:add_wear(65535/8)
		end
		return itemstack
]]--



mystical_agriculture.register_essence = function(name,desc,quality,below)
minetest.register_craftitem("mystical_agriculture:"..name.."_essence", {
	description = desc.." essence",
	inventory_image = name.."_essence.png",
})
minetest.register_node("mystical_agriculture:"..name.."_block", {
	description = desc.." block",
    tiles = {name.."_block.png"},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("mystical_agriculture:"..name.."_ingot_block", {
    description = desc.." metal block",
    tiles = {name.."_ingot_block.png"},
    groups = {cracky=1},
	sounds = default.node_sound_metal_defaults(),
})
minetest.register_craftitem("mystical_agriculture:"..name.."_ingot", {
	description = desc.." metal ingot",
	inventory_image = name.."_ingot.png",
})
minetest.register_craftitem("mystical_agriculture:"..name.."_nugget", {
	description = desc.." metal nugget",
	inventory_image = name.."_nugget.png",
})
minetest.register_craft({
        output = "mystical_agriculture:"..name.."_essence",
        recipe = {
		{"",below,""},
		{below,"mystical_agriculture:infusion_crystal",below},
		{"",below,""},
},
		replacements = {
		{"mystical_agriculture:infusion_crystal", "mystical_agriculture:infusion_crystal 1 6553"},
}
})
minetest.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
	if itemstack:get_name() ~= "mystical_agriculture:"..name.."_essence" then
		return
	end

  local wear = itemstack:get_wear()
	itemstack:replace(minetest.registered_nodes[ks[math.random(#ks)]])
end)
minetest.register_craft({
        output = "mystical_agriculture:"..name.."_essence",
        recipe = {
		{"",below,""},
		{below,"mystical_agriculture:master_infusion_crystal",below},
		{"",below,""},
},
		replacements = {
		{"mystical_agriculture:master_infusion_crystal", "mystical_agriculture:master_infusion_crystal"},
}
})
minetest.register_craft({
	type = "cooking",
	cooktime = (quality*4),
	output = "mystical_agriculture:"..name.."_ingot",
	recipe = "mystical_agriculture:"..name.."_block"
})
minetest.register_craft({
	type = "cooking",
	cooktime = quality,
	output = "mystical_agriculture:"..name.."_essence 2",
	recipe = "mystical_agriculture:"..name.."_nugget"
})
minetest.register_craft({
        output = "mystical_agriculture:"..name.."_block",
        recipe = {
            {"mystical_agriculture:"..name.."_essence","mystical_agriculture:"..name.."_essence","mystical_agriculture:"..name.."_essence"},
            {"mystical_agriculture:"..name.."_essence","mystical_agriculture:"..name.."_essence","mystical_agriculture:"..name.."_essence"},
            {"mystical_agriculture:"..name.."_essence","mystical_agriculture:"..name.."_essence","mystical_agriculture:"..name.."_essence"},
        }
    })
minetest.register_craft({
        output = "mystical_agriculture:"..name.."_ingot_block",
        recipe = {
            {"mystical_agriculture:"..name.."_ingot","mystical_agriculture:"..name.."_ingot"},
            {"mystical_agriculture:"..name.."_ingot","mystical_agriculture:"..name.."_ingot"},
        }
    })
minetest.register_craft({
        output = "mystical_agriculture:"..name.."_ingot 4",
        recipe = {
            {"mystical_agriculture:"..name.."_ingot_block"},
        }
    })
minetest.register_craft({
        output = "mystical_agriculture:"..name.."_essence 9",
        recipe = {
            {"mystical_agriculture:"..name.."_block"},
        }
    })
minetest.register_craft({
        output = "mystical_agriculture:"..name.."_ingot",
        recipe = {
            {"mystical_agriculture:"..name.."_nugget","mystical_agriculture:"..name.."_nugget"},
            {"mystical_agriculture:"..name.."_nugget","mystical_agriculture:"..name.."_nugget"},
        }
})
minetest.register_craft({
        output = "mystical_agriculture:"..name.."_nugget 4",
        recipe = {
           {"mystical_agriculture:"..name.."_ingot"},
     }
 })
end

mystical_agriculture.register_essence("inferium","Inferium",1,"default:dirt")
	
	
	
if(minetest.get_modpath("dye")~=nil) then  
dofile(modpath.."/optional_depends/dye.lua")
end
	
if(minetest.get_modpath("skytest")~=nil) then  
dofile(modpath.."/optional_depends/skytest.lua")
end

if(minetest.get_modpath("technic")~=nil) then  
dofile(modpath.."/optional_depends/technic.lua")
end

if(minetest.get_modpath("bonemeal")~=nil) then  
dofile(modpath.."/optional_depends/bonemeal.lua")
end

if(minetest.get_modpath("moreores")~=nil) then
dofile(modpath.."/optional_depends/moreores.lua")
end

--[[
	
list of all materials that can be directly farmed via essence	
	
default:ice
default:snow
default:diamond
default:mese_crystal
default:tin_ingot
default:copper_ingot
default:steel_ingot   
default:gold_ingot
default:bronze_ingot
default:coal_lump
bucket:bucket_water
bucket:bucket_lava
technic:rubber 
technic:uranium0_ingot - technic:uranium35_ingot
technic:stainless_steel_ingot
technic:chromium_ingot
technic:sulfur_lump
technic:carbon_steel_ingot
technic:brass_ingot
technic:zinc_ingot
technic:lead_ingot
bones:bones
moreores:silver_ingot
moreores:mithril_ingot

technic:mixed_metal_ingot
technic:cast_iron_ingot
terumet:ingot_tcop
terumet:ingot_tcha
terumet:ingot_raw
terumet:ingot_cgls
terumet:ingot_tste
terumet:ingot_tgol
terumet:item_thermese
skytest:cosmic_drop
skytest:neptonium_nuggets
skytest:bedrockium_ingot
]]--


--[[Adamantine
Aluminum
Aluminum Brass
Apatite
Aquamarine
Aquarium
Ardite
Basalt
Black Quartz
Blue Topaz
Certus Quartz
Chimerite
Cobalt
Cold-Iron
Conductive Iron
Constantan
Dark Steel
Dawnstone
Desh
Draconium
Dye
Electrical Steel
Electrum
Elementium
Emerald
End
Ender Amethyst
Ender Biotite
Energetic Alloy
Experience
Fiery Ingot
Fluix
Fluxed Electrum
Glowstone
Glowstone Ingot
Invar
Iridium
Iridium Ore
Ironwood
Knightmetal
Knightslime
Lapis Lazuli
Limestone
Manasteel
Manyullyn
Marble
Menril
Meteoric Iron
Mithril
Moonstone
Mystical Flower
Nether
Nether Quartz
Nickel
Osmium
Platinum
Pulsating Iron
Quartz Enriched Iron
Redstone
Redstone Alloy
Refined Obsidian
Rock Crystal
Saltpeter
Silicon
Silver
Sky Stone
Slate
Soularium
Starmetal
Star-Steel
Steel
Steeleaf
Sunstone
Terrasteel
Titanium
Tungsten
Vibrant Alloy
Vinteum
Yellorium
]]--