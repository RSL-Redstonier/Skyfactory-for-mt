local percentdirt = {
    {"skytest:strawberry_seeds", 5},
    {"skytest:raspberry_seeds", 8},
	{"skytest:mountainberries_seeds", 11},
	{"skytest:desertberries_seeds", 13},
	{"skytest:blueberries_seeds", 15},
	{"skytest:snowberries_seeds", 18},
    {"skytest:pine_tree_seeds", 21},
	{"skytest:pebble 19", 24},
    {"skytest:bone 14", 27},
    {"skytest:acacia_tree_seeds", 30},
    {"skytest:aspen_tree_seeds", 33},
    {"skytest:oak_tree_seeds", 36},
    {"skytest:jungle_tree_seeds", 39},
    {"skytest:cactus_seeds 2", 42},
    {"skytest:papyrus_seeds 2", 45},
    {"skytest:bone 6", 48},
    {"skytest:bone 4", 51},
    {"skytest:grass_seeds", 54},
	{"skytest:pebble 3", 57},
}
function dirt()
    local chance = math.random(60)
    for _,v in pairs(percentdirt) do
        if chance<v[2] then
            return ItemStack(v[1])
        end
    end
    return nil
end
local percentplantmix = {
{"farming:pumpkin_slice", 3},
{"farming:raspberries", 6},
{"farming:rhubarb", 9},
{"farming:tomato", 12},
{"farming:seed_wheat", 15},
{"farming:seed_barley", 18},
{"farming:blueberries", 21},
{"farming:carrot", 24},
{"farming:chili_pepper", 27},
{"farming:coffee_beans", 30},
{"farming:corn", 33},
{"farming:seed_cotton", 36},
{"farming:cucumber", 39},
{"farming:garlic_clove", 42},
{"farming:seed_hemp", 45},
{"farming:melon_slice", 48},
{"farming:potato", 51},
{"farming:peppercorn", 54},
{"farming:onion", 57},
{"farming:beans", 60},
{"farming:cocoa_bean", 63},
{"farming:grapes", 66},
}
function plantmix()
    local chance = math.random(69)
    for _,v in pairs(percentplantmix) do
        if chance<v[2] then
            return ItemStack(v[1])
        end
    end
    return nil
end

local percentgravel = {
    {"skytest:diamond_chunks", 5},
    {"default:mese_crystal_fragment 3", 7},
    {"skytest:gold_ore_chunks", 9},
    {"skytest:lapis", 11},
    {"skytest:redstone", 13},
    {"skytest:glowstone", 15},
    {"skytest:tin_ore_chunks", 17},
    {"skytest:copper_ore_chunks", 19},
    {"skytest:iron_ore_chunks", 24},
    {"default:coal_lump", 28},
    {"default:flint", 34},
    {"skytest:uranium_chunks", 36},
    {"skytest:chromium_chunks", 38},
    {"skytest:zinc_chunks", 40},
    {"skytest:lead_chunks", 42},
    {"skytest:sulfer_chunks", 44},
}
function gravel()
    local chance = math.random(50)
    for _,v in pairs(percentgravel) do
        if chance<v[2] then
            return ItemStack(v[1])
        end
    end
    return nil
end
local percentdust = {
    {"skytest:diamond_chunks", 5},
    {"default:mese_crystal_fragment 3", 7},
    {"skytest:gold_ore_chunks", 9},
    {"skytest:lapis", 11},
    {"skytest:redstone", 13},
    {"skytest:glowstone", 15},
    {"skytest:tin_ore_chunks", 17},
    {"skytest:copper_ore_chunks", 19},
    {"skytest:iron_ore_chunks", 24},
    {"default:coal_lump", 28},
}
function dust()
    local chance = math.random(30)
    for _,v in pairs(percentdust) do
        if chance<v[2] then
            return ItemStack(v[1])
        end
    end
    return nil
end
local percentheavydust = {
    {"skytest:diamond_chunks", 5},
    {"skytest:terumetal_ore_chunks 3", 7},
    {"skytest:terumetal_ore_chunks 2", 8},
    {"skytest:gold_ore_chunks", 9},
    {"skytest:lapis", 11},
    {"skytest:redstone", 13},
    {"skytest:glowstone", 15},
    {"skytest:tin_ore_chunks", 17},
    {"skytest:copper_ore_chunks", 19},
    {"skytest:iron_ore_chunks", 24},
    {"default:coal_lump", 28},
}
function heavydust()
    local chance = math.random(30)
    for _,v in pairs(percentheavydust) do
        if chance<v[2] then
            return ItemStack(v[1])
        end
    end
    return nil
end
local percentpowder = {
    {"default:diamond 3", 5},
    {"default:mese_crystal 3", 7},
    {"default:gold_lump 4", 9},
    {"skytest:enchanted_crystal 8", 11},
    {"skytest:enchanted_crystal 3", 13},
    {"skytest:enchanted_crystal", 15},
    {"default:tin_lump 6", 17},
    {"skytest:copper_lump 3", 19},
	{"skytest:terumetal_ore_chunks 7", 21},
    {"default:iron_lump 2", 24},
    {"default:coal_lump 5", 28},
	{"skytest:uranium_chunks", 36},
    {"skytest:chromium_chunks", 38},
    {"skytest:zinc_chunks", 40},
    {"skytest:lead_chunks", 42},
    {"skytest:sulfer_chunks", 44},
}
function powder()
    local chance = math.random(48)
    for _,v in pairs(percentpowder) do
        if chance<v[2] then
            return ItemStack(v[1])
        end
    end
    return nil
end
minetest.register_node("skytest:hand_sieve", {
    description = "Hand Sieve",
    paramtype = "light",
    tiles = {
    	"sieve_hand_sieve_top.png",
    	"sieve_hand_sieve_bottom.png",
    	"default_wood.png",
    	"default_wood.png",
    	"default_wood.png",
    	"default_wood.png"
    },
    groups = {oddly_breakable_by_hand=1},
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, 0.1875, -0.5, 0.5, 0.19, 0.5}, --top
            {0.5,0.1875,0.5,-0.5,0.5,0.4375},--top
            {-0.5,0.1875,0.5,-0.4375,0.5,-0.5}, --top
            {0.5,0.1875,-0.5,-0.5,0.5,-0.4375}, --top
            {0.5,0.1875,0.5,0.4375,0.5,-0.5}, --top
            {-0.5, -0.5, -0.5, -0.4375, 0.5, -0.4375}, --leg
            {-0.5, -0.5, 0.5, -0.4375, 0.5, 0.4375}, --leg
            {0.5, -0.5, 0.5, 0.4375, 0.5, 0.4375}, --leg
            {0.5, -0.5, -0.5, 0.4375, 0.5, -0.4375}, --leg
        },
    },
    on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        local timer = minetest.get_node_timer(pos)
        if itemstack:get_name() == "skytest:dust" and not timer:is_started() then
            pos.y = pos.y + 0.5
	    itemstack:take_item(1)
            timer:start(2)
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            return itemstack
         end
      	if itemstack:get_name() == "default:dirt" and not timer:is_started() then
            pos.y = pos.y + 0.5
	    itemstack:take_item(1)
            timer:start(2)
            minetest.add_item(pos, dirt())
            minetest.add_item(pos, dirt())
            minetest.add_item(pos, dirt())
	    minetest.add_item(pos, "skytest:pebble")
            return itemstack
  	end
	if itemstack:get_name() == "default:gravel" and not timer:is_started() then
            pos.y = pos.y + 0.5
	    itemstack:take_item(1)
            timer:start(2)
            minetest.add_item(pos, gravel())
            return itemstack
  	end
	if itemstack:get_name() == "default:sand" and not timer:is_started() then
            pos.y = pos.y + 0.5
	    itemstack:take_item(1)
            timer:start(2)
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            return itemstack
  	end
	if itemstack:get_name() == "default:desert_sand" and not timer:is_started() then
            pos.y = pos.y + 0.5
	    itemstack:take_item(1)
            timer:start(2)
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            return itemstack
  	end
		if itemstack:get_name() == "skytest:pms" and not timer:is_started() then
            pos.y = pos.y + 0.5
	    itemstack:take_item(1)
            timer:start(18)
            minetest.add_item(pos, plantmix())
            minetest.add_item(pos, plantmix())
            minetest.add_item(pos, plantmix())
            return itemstack
  	end
    end,
    drop = { 
        max_items = 1,
        items = {{
            items = {"skytest:empty_sieve","skytest:mesh"},
	},}
    }
})
minetest.register_node("skytest:empty_sieve", {
    description = "Empty Sieve",
    paramtype = "light",
    tiles = {
    	"default_wood.png",
    	"default_wood.png",
    	"default_wood.png",
    	"default_wood.png"
    },
    groups = {oddly_breakable_by_hand=1},
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, 0.1875, -0.5, 0.5, 0.19, 0.5}, --top
            {0.5,0.1875,0.5,-0.5,0.5,0.4375},--top
            {-0.5,0.1875,0.5,-0.4375,0.5,-0.5}, --top
            {0.5,0.1875,-0.5,-0.5,0.5,-0.4375}, --top
            {0.5,0.1875,0.5,0.4375,0.5,-0.5}, --top
            {-0.5, -0.5, -0.5, -0.4375, 0.5, -0.4375}, --leg
            {-0.5, -0.5, 0.5, -0.4375, 0.5, 0.4375}, --leg
            {0.5, -0.5, 0.5, 0.4375, 0.5, 0.4375}, --leg
            {0.5, -0.5, -0.5, 0.4375, 0.5, -0.4375}, --leg
        },
    },
    on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        if itemstack:get_name() == "skytest:mesh" then
            minetest.set_node(pos, {name="skytest:hand_sieve"})
	    itemstack:take_item(1)
            return itemstack
         elseif itemstack:get_name() == "skytest:flint_mesh" then
            minetest.set_node(pos, {name="skytest:hand_sieve_flint"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
})
minetest.register_node("skytest:empty_heavy_sieve", {
    description = "Empty heavy Sieve",
    paramtype = "light",
    tiles = {
    	"empty_heavy_sieve.png",
    	"empty_heavy_sieve.png",
    	"heavy_sieve_side.png",
    	"heavy_sieve_side.png",
    	"heavy_sieve_side.png",
    	"heavy_sieve_side.png"
    },
    groups = {oddly_breakable_by_hand=1},
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, 0.1875, -0.5, 0.5, 0.19, 0.5}, --top
            {0.5,0.1875,0.5,-0.5,0.5,0.4375},--top
            {-0.5,0.1875,0.5,-0.4375,0.5,-0.5}, --top
            {0.5,0.1875,-0.5,-0.5,0.5,-0.4375}, --top
            {0.5,0.1875,0.5,0.4375,0.5,-0.5}, --top
            {-0.5, -0.5, -0.5, -0.4375, 0.5, -0.4375}, --leg
            {-0.5, -0.5, 0.5, -0.4375, 0.5, 0.4375}, --leg
            {0.5, -0.5, 0.5, 0.4375, 0.5, 0.4375}, --leg
            {0.5, -0.5, -0.5, 0.4375, 0.5, -0.4375}, --leg
        },
    },
    on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        if itemstack:get_name() == "skytest:heavy_mesh" then
            minetest.set_node(pos, {name="skytest:heavy_sieve"})
	    itemstack:take_item(1)
            return itemstack
         end
    end,
}) 
minetest.register_node("skytest:heavy_sieve", {
    description = "Heavy Sieve",
    paramtype = "light",
    tiles = {
        "full_heavy_sieve.png",
        "full_heavy_sieve.png",
        "heavy_sieve_side.png",
        "heavy_sieve_side.png",
        "heavy_sieve_side.png",
        "heavy_sieve_side.png"
    },
    is_ground_content = true,
    groups = {choppy = 2, oddly_breakable_by_hand = 2},
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, 0.1875, -0.5, 0.5, 0.19, 0.5}, --top
            {0.5,0.1875,0.5,-0.5,0.5,0.4375},--top
            {-0.5,0.1875,0.5,-0.4375,0.5,-0.5}, --top
            {0.5,0.1875,-0.5,-0.5,0.5,-0.4375}, --top
            {0.5,0.1875,0.5,0.4375,0.5,-0.5}, --top
            {-0.5, -0.5, -0.5, -0.4375, 0.5, -0.4375}, --leg
            {-0.5, -0.5, 0.5, -0.4375, 0.5, 0.4375}, --leg
            {0.5, -0.5, 0.5, 0.4375, 0.5, 0.4375}, --leg
            {0.5, -0.5, -0.5, 0.4375, 0.5, -0.4375}, --leg
        },
    },
    on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        local timer = minetest.get_node_timer(pos)
        if itemstack:get_name() == "skytest:dust" then
            pos.y = pos.y + 0.5
	    itemstack:take_item(1)
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            minetest.add_item(pos, heavydust())
            minetest.add_item(pos, heavydust())
            minetest.add_item(pos, heavydust())
            minetest.add_item(pos, heavydust())
            minetest.add_item(pos, heavydust())
            minetest.add_item(pos, heavydust())
            minetest.add_item(pos, heavydust())
            return itemstack
         end
      	if itemstack:get_name() == "default:dirt" then
            pos.y = pos.y + 0.5
	    itemstack:take_item(1)
            minetest.add_item(pos, dirt())
            minetest.add_item(pos, dirt())
	    minetest.add_item(pos, "skytest:pebble")
            return itemstack
  	end
        if itemstack:get_name() == "skytest:powder" then
            pos.y = pos.y + 0.5
            timer:start(5)
	    itemstack:take_item(1)
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
	    minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
	    minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
	    minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            minetest.add_item(pos, powder())
            return itemstack
         end
	if itemstack:get_name() == "default:gravel" then
            pos.y = pos.y + 0.5
	    itemstack:take_item(1)
            minetest.add_item(pos, gravel())
            minetest.add_item(pos, gravel())
            return itemstack
  	end
	if itemstack:get_name() == "default:sand" then
            pos.y = pos.y + 0.5
	    itemstack:take_item(1)
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            return itemstack
  	end
	if itemstack:get_name() == "default:desert_sand" then
            pos.y = pos.y + 0.5
	    itemstack:take_item(1)
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            return itemstack
  	end
			if itemstack:get_name() == "skytest:pms" then
            pos.y = pos.y + 0.5
	    itemstack:take_item(1)
            minetest.add_item(pos, plantmix())
            minetest.add_item(pos, plantmix())
            minetest.add_item(pos, plantmix())
			minetest.add_item(pos, plantmix())
            minetest.add_item(pos, plantmix())
            minetest.add_item(pos, plantmix())
			minetest.add_item(pos, plantmix())
            minetest.add_item(pos, plantmix())
            minetest.add_item(pos, plantmix())
            return itemstack
  	end
    end,
          
})
--Shaker Motor
minetest.register_craftitem("skytest:shaker_motor", {
    description = "Shaker Motor",
    inventory_image = "sieve_shaker_motor.png",
    })
--Shaker Frame
minetest.register_craftitem("skytest:shaker_frame", {
    description = "Shaker Frame",
    inventory_image = "sieve_shaker_frame.png",
    })
--Auto Top
minetest.register_craftitem("skytest:auto_sieve_top", {
    description = "Auto Sieve Top",
    inventory_image = "sieve_auto_top.png",
})
minetest.register_craft({
    output = "skytest:shaker_motor 2",
    recipe = {
        {"", "",""},
        {"default:cobble", "default:steel_ingot","default:cobble"},
        {"default:cobble", "default:copper_ingot","default:cobble"},
    }
})
minetest.register_craft({
    output = "skytest:shaker_frame 1",
    recipe = {
        {"default:steel_ingot", "skytest:shaker_motor","default:steel_ingot"},
        {"skytest:shaker_motor", "default:furnace","skytest:shaker_motor"},
        {"default:steel_ingot", "skytest:shaker_motor","default:steel_ingot"},
    }
})
--Auto Legs
minetest.register_craftitem("skytest:auto_sieve_legs", {
    description = "Auto Sieve Legs",
    inventory_image = "sieve_auto_legs.png",
})
minetest.register_craft({
    output = "skytest:auto_sieve_top",
    recipe = {
        {"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
        {"default:steel_ingot", "skytest:mesh", "default:steel_ingot"},
        {"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
    }
})
minetest.register_craft({
    output = "skytest:empty_heavy_sieve",
    recipe = {
        {"skytest:leaf_weight", "", "skytest:leaf_weight"},
        {"skytest:leaf_weight", "default:steel_ingot", "skytest:leaf_weight"},
        {"skytest:leaf_weight", "", "skytest:leaf_weight"}
    }
})
minetest.register_craft({
    output = "skytest:auto_sieve_legs",
    recipe = {
        {"default:steel_ingot", "skytest:shaker_frame", "default:steel_ingot"},
        {"default:steel_ingot", "", "default:steel_ingot"}
    }
})

minetest.register_node("skytest:hand_sieve_flint", {
    description = "Hand Sieve_flint",
    paramtype = "light",
    tiles = {
    	"sieve_hand_sieve_top.png^sieve_mesh.png^[colorize:black:50",
    	"sieve_hand_sieve_bottom.png",
    	"default_wood.png",
    	"default_wood.png",
    	"default_wood.png",
    	"default_wood.png"
    },
    groups = {oddly_breakable_by_hand=1},
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, 0.1875, -0.5, 0.5, 0.19, 0.5}, --top
            {0.5,0.1875,0.5,-0.5,0.5,0.4375},--top
            {-0.5,0.1875,0.5,-0.4375,0.5,-0.5}, --top
            {0.5,0.1875,-0.5,-0.5,0.5,-0.4375}, --top
            {0.5,0.1875,0.5,0.4375,0.5,-0.5}, --top
            {-0.5, -0.5, -0.5, -0.4375, 0.5, -0.4375}, --leg
            {-0.5, -0.5, 0.5, -0.4375, 0.5, 0.4375}, --leg
            {0.5, -0.5, 0.5, 0.4375, 0.5, 0.4375}, --leg
            {0.5, -0.5, -0.5, 0.4375, 0.5, -0.4375}, --leg
        },
    },
    on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        if itemstack:get_name() == "skytest:dust" then
            pos.y = pos.y + 0.5
			itemstack:take_item(1)
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            return itemstack
         end
      	if itemstack:get_name() == "default:dirt" then
            pos.y = pos.y + 0.5
	    itemstack:take_item(1)
            minetest.add_item(pos, dirt())
            minetest.add_item(pos, dirt())
            minetest.add_item(pos, dirt())
	    minetest.add_item(pos, "skytest:pebble")
            return itemstack
  	end
	if itemstack:get_name() == "default:gravel" then
            pos.y = pos.y + 0.5
	    itemstack:take_item(1)
            minetest.add_item(pos, gravel())
            return itemstack
  	end
	if itemstack:get_name() == "default:sand" then
            pos.y = pos.y + 0.5
	    itemstack:take_item(1)
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            return itemstack
  	end
	if itemstack:get_name() == "default:desert_sand" then
            pos.y = pos.y + 0.5
	    itemstack:take_item(1)
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            minetest.add_item(pos, dust())
            return itemstack
  	end
	if itemstack:get_name() == "skytest:pms" then
            pos.y = pos.y + 0.5
	    itemstack:take_item(1)
            minetest.add_item(pos, plantmix())
            minetest.add_item(pos, plantmix())
            minetest.add_item(pos, plantmix())
            return itemstack
  	end
    end,
    drop = { 
        max_items = 1,
        items = {{
            items = {"skytest:empty_sieve","skytest:flint_mesh"},
	},}
    }
})