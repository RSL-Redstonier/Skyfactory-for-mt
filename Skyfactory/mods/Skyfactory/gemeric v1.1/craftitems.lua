local modname = "gemeric"

function math.sign(v)
	return (v >= 0 and 1) or -1
end
function math.round(v, bracket)
	bracket = bracket or 1
	return math.floor(v/bracket + math.sign(v) * 0.5) * bracket
end
for number = 1, 48 do
local nl1 = gemeric.gem_name_list[number]
local nl5 = gemeric.gem_stats_list_durability[number]
local nl10 = gemeric.gem_stats_list_speed[number]
minetest.register_craftitem(modname..":gem_"..number, {
	description = nl1.." Gem\nTool Durability +"..nl5.."\nTool Mining Speed +"..math.round(nl10*1.2,0.0001),
	inventory_image = "gem"..number..".png",
	groups = {gem = 1},
})
minetest.register_craft({
    output = modname..":gem_"..number,
    recipe = {
        {modname..":gemshard_"..number,modname..":gemshard_"..number,modname..":gemshard_"..number},
		{modname..":gemshard_"..number,modname..":gemshard_"..number,modname..":gemshard_"..number},
		{modname..":gemshard_"..number,modname..":gemshard_"..number,modname..":gemshard_"..number},
    }
})
minetest.register_craftitem(modname..":blank_chaos_gem_"..number, {
	description = "Chaos "..nl1.." Gem\nNo Effect",
	inventory_image = "chaosgem"..number..".png",
	groups = {chaos_gem = 1},
})
minetest.register_node(modname..":gem_block_"..number, {
	description = nl1.." Block",
	tiles = {"gemblock"..number..".png"},
	groups = {cracky = 1, gem_block = 1},
})
minetest.register_craft({
    output = modname..":gem_block_"..number,
    recipe = {
        {modname..":gem_"..number,modname..":gem_"..number,modname..":gem_"..number},
		{modname..":gem_"..number,modname..":gem_"..number,modname..":gem_"..number},
		{modname..":gem_"..number,modname..":gem_"..number,modname..":gem_"..number},
    }
})
minetest.register_craft({
    output = modname..":gem_"..number.." 9",
    recipe = {
        {modname..":gem_block_"..number},
    }
})
minetest.register_craft({
    output = modname..":super_gem_"..number.." 9",
    recipe = {
        {modname..":super_gem_block_"..number},
    }
})
minetest.register_node(modname..":super_gem_block_"..number, {
	description = "Supercharged "..nl1.." Block",
	tiles = {"teleporter"..number..".png"},
	groups = {cracky = 1, super_gem_block = 1},
})
minetest.register_craft({
    output = modname..":super_gem_block_"..number,
    recipe = {
        {modname..":super_gem_"..number,modname..":super_gem_"..number,modname..":super_gem_"..number},
		{modname..":super_gem_"..number,modname..":super_gem_"..number,modname..":super_gem_"..number},
		{modname..":super_gem_"..number,modname..":super_gem_"..number,modname..":super_gem_"..number},
    }
})
minetest.register_craftitem(modname..":super_gem_"..number, {
	description = "Supercharged "..nl1.." Gem\nTool Durability +"..math.round(nl5*1.2,0.0001).."\nTool Mining Speed +"..math.round(nl10/1.2,0.0001),
	inventory_image = "gem_super_outline.png^gem"..number..".png",
	groups = {super_gem = 1},
})
minetest.register_craft({
    output = modname..":super_gem_"..number,
    recipe = {
        {modname..":chaos_essence",modname..":gem_"..number,modname..":chaos_essence"},
		{modname..":chaos_essence","default:diamond",modname..":chaos_essence"},
		{modname..":chaos_essence",modname..":gem_"..number,modname..":chaos_essence"},
    }
})
minetest.register_craft({
    output = modname..":super_gem_block_"..number,
    recipe = {
        {modname..":chaos_essence_block",modname..":gem_block_"..number,modname..":chaos_essence_block"},
		{modname..":chaos_essence_block","default:diamondblock",modname..":chaos_essence_block"},
		{modname..":chaos_essence_block",modname..":gem_block_"..number,modname..":chaos_essence_block"},
    }
})
minetest.register_craft({
    output = modname..":super_gem_"..number.." 9",
    recipe = {
        {modname..":super_gem_block_"..number},
    }
})
minetest.register_craftitem(modname..":gemshard_"..number, {
	description = nl1.." Gem Shard",
	inventory_image = "gemshard"..number..".png",
	groups = {gem_shard = 1},
})
minetest.register_craft({
    output = modname..":gemshard_"..number.." 9",
    recipe = {
        {modname..":gem_"..number},
    }
})
minetest.register_node(modname..":nether_ore_"..number, {
	description = nl1.." Nether Ore",
	tiles = {"nether_rack.png^gemshard"..number..".png"},
	groups = {cracky = 2},
	light_source = 8,
	paramtype = "light",
	drop = modname..":gemshard_"..number.." 5",
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = modname..":nether_ore_"..number,
	wherein        = "hell:soul_stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 9,
	clust_size     = 3,
	y_min          = -30000,
	y_max          = -20000,
})
minetest.register_node(modname..":ore_"..number, {
	description = nl1.." Ore",
	tiles = {"default_stone.png^gemshard"..number..".png"},
	groups = {cracky = 2},
	light_source = 3,
	paramtype = "light",
	drop = modname..":gemshard_"..number.." 2",
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = modname..":ore_"..number,
	wherein        = "default:stone",
	clust_scarcity = 32 * 32 * 32,
	clust_num_ores = 3,
	clust_size     = 3,
	y_min          = 3000,
	y_max          = 6000,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = modname..":ore_"..number,
	wherein        = "default:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 9,
	clust_size     = 3,
	y_min          = -300,
	y_max          = 20,
})



minetest.register_node(modname..":gembrickcoated"..number, {
	description = nl1.." Coated Brick",
	tiles = {"gembrickcoated"..number..".png"},
	groups = {cracky = 1},
})
minetest.register_craft({
    output = modname..":gembrickcoated"..number.." 18",
    recipe = {
        {modname..":gemshard_"..number,"group:stone"},
		{"group:stone",modname..":gemshard_"..number},
    }
})
minetest.register_node(modname..":gembrickspeckled"..number, {
	description = nl1.." Speckled Brick",
	tiles = {"gembrickspeckled"..number..".png"},
	groups = {cracky = 1},
})
minetest.register_craft({
    output = modname..":gembrickspeckled"..number.." 18",
    recipe = {
        {modname..":gemshard_"..number,"group:stone"},
		{"default:cobble",modname..":gemshard_"..number},
    }
})
minetest.register_node(modname..":gemglass"..number, {
	description = nl1.." Infused Glass",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	tiles = {"gemglass"..number..".png"},
	groups = {cracky = 1},
})
minetest.register_craft({
    output = modname..":gemglass"..number.." 8",
    recipe = {
        {"group:sand",modname..":gemshard_"..number},
		{modname..":gemshard_"..number,"default:glass"},
    }
})
if(minetest.get_modpath("xpanes")~=nil) then
xpanes.register_pane("gemglass_pane"..number, {
	description = nl1.." Infused Glass Pane",
	textures = {"gemglass"..number..".png","gemglass"..number..".png","gemglass"..number..".png"},
	inventory_image = "gemglass"..number..".png",
	wield_image = "gemglass"..number..".png",
	sounds = default.node_sound_glass_defaults(),
	groups = {snappy=2, cracky=3, oddly_breakable_by_hand=3},
	recipe = {
		{modname..":gemglass"..number,modname..":gemglass"..number,modname..":gemglass"..number},
		{modname..":gemglass"..number,modname..":gemglass"..number,modname..":gemglass"..number}
	}
})
end
end
minetest.register_node(modname..":chaos_essence_ore", {
	description = "Chaos Ore",
	tiles = {"default_stone.png^chaosessence.png"},
	groups = {cracky = 2},
	light_source = 3,
	paramtype = "light",
	drop = modname..":chaos_essence 2",
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = modname..":chaos_essence_ore",
	wherein        = "default:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 3,
	clust_size     = 3,
	y_min          = -1000,
	y_max          = 250,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = modname..":chaos_essence_ore",
	wherein        = "default:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 3,
	clust_size     = 3,
	y_min          = 3000,
	y_max          = 6000,
})
minetest.register_node(modname..":nether_chaos_essence_ore", {
	description = "Nether Chaos Ore",
	tiles = {"nether_rack.png^chaosessence.png"},
	groups = {cracky = 2},
	light_source = 5,
	paramtype = "light",
	drop = modname..":chaos_essence 4",
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = modname..":nether_chaos_essence_ore",
	wherein        = "hell:soul_stone",
	clust_scarcity = 10 * 10 * 10,
	clust_num_ores = 3,
	clust_size     = 3,
	y_min          = -30000,
	y_max          = -20000,
})
minetest.register_node(modname..":chaos_essence_block", {
	description = "Chaos block",
	tiles = {"chaosessenceblock.png"},
	groups = {cracky = 2},
})
minetest.register_craft({
    output = modname..":chaos_essence_block",
    recipe = {
        {modname..":chaos_essence",modname..":chaos_essence",modname..":chaos_essence"},
		{modname..":chaos_essence",modname..":chaos_essence",modname..":chaos_essence"},
		{modname..":chaos_essence",modname..":chaos_essence",modname..":chaos_essence"},
    }
})
minetest.register_craftitem(modname..":chaos_essence", {
	description = "Chaos Essence",
	inventory_image = "chaosessence.png",
})
minetest.register_craftitem(modname..":chaos_essence_plus", {
	description = "Enhanced Chaos Essence",
	inventory_image = "chaosessenceplus.png",
})
minetest.register_craft({
    output = modname..":chaos_essence_plus",
    recipe = {
        {modname..":chaos_essence","default:diamond",modname..":chaos_essence"},
        {modname..":chaos_essence","default:gold_ingot",modname..":chaos_essence"},
        {modname..":chaos_essence","default:diamond",modname..":chaos_essence"},
    }
})
minetest.register_craftitem(modname..":tool_rod_steel", {
	description = "Steel Tool Rod\nTool Durability +",
	inventory_image = "tool_rod_steel.png",
})
minetest.register_craftitem(modname..":tool_rod_gold", {
	description = "Gold Tool Rod\nTool Attack +",
	inventory_image = "tool_rod_gold.png",
})
minetest.register_craftitem(modname..":tool_rod_diamond", {
	description = "Diamond Tool Rod\nTool Mining Speed +",
	inventory_image = "tool_rod_diamond.png",
})
minetest.register_craftitem(modname..":tool_rod_obsidian", {
	description = "Obsidian Tool Rod\nTool Durability ++\nTool Attack ++\nTool Mining Speed ++",
	inventory_image = "tool_rod_obsidian.png",
})
minetest.register_craft({
    output = modname..":tool_rod_steel 2",
    recipe = {
        {"default:steel_ingot","group:gem_shard","default:steel_ingot"},
		{"default:steel_ingot",modname..":chaos_essence","default:steel_ingot"},
		{"default:steel_ingot","group:gem_shard","default:steel_ingot"},
    }
})
minetest.register_craft({
    output = modname..":tool_rod_gold 2",
    recipe = {
        {"default:gold_ingot","group:gem_shard","default:gold_ingot"},
		{"default:gold_ingot",modname..":chaos_essence","default:gold_ingot"},
		{"default:gold_ingot","group:gem_shard","default:gold_ingot"},
    }
})
minetest.register_craft({
    output = modname..":tool_rod_diamond 2",
    recipe = {
        {"default:diamond","group:gem_shard","default:diamond"},
		{"default:diamond",modname..":chaos_essence","default:diamond"},
		{"default:diamond","group:gem_shard","default:diamond"},
    }
})
minetest.register_craft({
    output = modname..":tool_rod_obsidian 2",
    recipe = {
        {"default:obsidian","group:gem_shard","default:obsidian"},
		{"default:obsidian",modname..":chaos_essence","default:obsidian"},
		{"default:obsidian","group:gem_shard","default:obsidian"},
    }
})




minetest.register_craftitem(modname..":chaos_core", {
	description = "Chaos Core",
	inventory_image = "chaoscore.png",
})
minetest.register_craft({
    output = modname..":chaos_core",
    recipe = {
        {"",modname..":chaos_essence_plus",""},
		{modname..":chaos_essence_plus","default:mese",modname..":chaos_essence_plus"},
		{"",modname..":chaos_essence_plus",""},
    }
})
minetest.register_craftitem(modname..":blank_rune", {
	description = "Blank Rune",
	inventory_image = "runes_main_rune.png",
	groups = {rune = 1},
})
minetest.register_craft({
    output = modname..":blank_rune",
    recipe = {
        {"","group:stone",""},
		{"group:stone",modname..":chaos_core","group:stone"},
        {"","group:stone",""},
    }
})
minetest.register_craftitem(modname..":aoe_rune", {
	description = "AOE Rune",
	inventory_image = "runes_main_rune.png^runes_1.png",
	groups = {rune = 1},
})
minetest.register_craft({
    output = modname..":aoe_rune",
    recipe = {
        {modname..":chaos_essence_plus",modname..":tool_extension_bit",modname..":chaos_essence_plus"},
		{modname..":tool_extension_bit",modname..":blank_rune",modname..":tool_extension_bit"},
        {modname..":chaos_essence_plus",modname..":tool_extension_bit",modname..":chaos_essence_plus"},
    }
})
minetest.register_craftitem(modname..":tool_bit", {
	description = "Tool Bit",
	inventory_image = "drawingcompass1.png",
})
minetest.register_craftitem(modname..":tool_extension_bit", {
	description = "Tool Extension Bit",
	inventory_image = "drawingcompass2.png",
})
minetest.register_craft({
    output = modname..":tool_bit",
    recipe = {
        {"","default:gold_ingot","default:paper"},
		{"default:gold_ingot","default:paper","default:gold_ingot"},
        {"default:obsidian_shard","default:gold_ingot",""},
    }
})
minetest.register_craft({
    output = modname..":tool_extension_bit",
    recipe = {
        {"",modname..":tool_bit","default:diamond"},
		{"default:flint","",modname..":tool_bit"},
        {"","default:flint",""},
    }
})
--[[
for chaosgems1 = 1, 9 do
local cg1 = gemeric.rune_name_list[chaosgems1]
minetest.register_craftitem(modname..":rune_"..chaosgems1, {
	description = cg1.." Rune",
	inventory_image = "runes_main_rune.png^runes_"..chaosgems1..".png",
	groups = {rune = 1},
})
for chaosgems2 = 1, 48 do
local cg2 = gemeric.gem_name_list[chaosgems2]
minetest.register_craftitem(modname..":deactivated_chaos_gem_"..chaosgems2.."rune_"..chaosgems1, {
	description = "Chaos "..cg2.." Gem\nDeactivated\nEffect "..cg1,
	inventory_image = "chaosgem"..chaosgems2..".png",
	groups = {chaos_gem = 1},
	on_use = function(itemstack, user, pointed_thing)
		itemstack:replace(modname..":activated_chaos_gem_"..chaosgems2.."rune_"..chaosgems1)
		return itemstack
	end
})
minetest.register_craftitem(modname..":activated_chaos_gem_"..chaosgems2.."rune_"..chaosgems1, {
	description = "Chaos "..cg2.." Gem\nActivated\nEffect "..cg1,
	inventory_image = "chaosgem"..chaosgems2..".png^[colorize:violet:80",
	groups = {chaos_gem = 1},
	on_use = function(itemstack, user, pointed_thing)
		itemstack:replace(modname..":deactivated_chaos_gem_"..chaosgems2.."rune_"..chaosgems1)
		return itemstack
	end
})
minetest.register_craft({
    output = modname..":deactivated_chaos_gem_"..chaosgems2.."rune_"..chaosgems1,
    recipe = {
		{modname..":rune_"..chaosgems1,modname..":blank_chaos_gem_"..chaosgems2,""},
		{"","",""},
		{"","",""},
    }
})
end
end
minetest.register_craft({
    output = modname..":rune_1",
    recipe = {
		{"",modname..":blank_rune",""},
		{"",modname..":blank_rune",""},
		{"",modname..":blank_rune",""},
    }
})
]]--









