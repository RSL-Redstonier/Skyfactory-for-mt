local path = minetest.get_modpath("skytest")
--local modname = "skytest"
dofile(path.."/craft_Items.lua")
dofile(path.."/nodes.lua")
dofile(path.."/tools.lua")
dofile(path.."/compost_bin.lua")
dofile(path.."/sieve.lua")
dofile(path.."/crucible.lua")
dofile(path.."/advanced_compostbin.lua")
dofile(path.."/jetpack.lua")
dofile(path.."/compressed.lua")
dofile(path.."/grinder.lua")
dofile(path.."/press.lua")
dofile(path.."/assembler.lua")
dofile(path.."/base_machines.lua")
dofile(path.."/loot_bags.lua")
dofile(path.."/factorys.lua")
dofile(path.."/time_dilators.lua")
dofile(path.."/bushes.lua")
--if(minetest.get_modpath("3d_armor")~=nil) then
--dofile(path.."/armor.lua")
--else
--dofile(path.."/alternate_armor.lua")
--end
if(minetest.get_modpath("unified_inventory")~=nil) then
dofile(path.."/unified_inventory.lua")
end


local displayAllNodes = function(pos)
local nodeCount = 0
-- key is node name, eg default:stonevalue is definition table
for key, value in pairs(minetest.registered_nodes) do
print (key)
nodeCount = nodeCount + 1
end

local manip = minetest.get_voxel_manip()
minetest.chat_send_all("placing".. nodeCount.. " nodes")

local curY = pos.y + math.sqrt(nodeCount * 2)
local curX = pos.x
local curZ = pos.z
local startX = pos.x
local startZ = pos.z
local curRowMax = 1
local rowCount = 1

for key, value in pairs(minetest.registered_nodes) do

if ((string.find(key,"lava") == nil) and (string.find(key,"fire")) == nil and (string.find(key,"water") == nil) and (string.find(key,"air") == nil)) then
local p = {x=curX, y=curY, z=curZ}
manip:read_from_map(p, p)
minetest.env:add_node(p, {name=key})

rowCount = rowCount + 1

if rowCount > curRowMax then
rowCount = 1
curRowMax = curRowMax + 1--2
--startX = startX - 1
startZ = startZ - 1
curY = curY - 1
curX = startX
curZ = startZ
else
curX = curX + 1
curZ = curZ + 1
end
end
end
return true
end

minetest.register_chatcommand("/dan", {
params = "",
description = "Display All registered Nodes",
func = function(name, param)
local pos = minetest.get_player_by_name(name):getpos()
pos.x, pos.y, pos.z = math.floor(pos.x + 0.5), math.floor(pos.y + 0.5), math.floor(pos.z + 0.5)
displayAllNodes(pos)
return true
end,
})
