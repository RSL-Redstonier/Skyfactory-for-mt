
local path = minetest.get_modpath("smobs_animals")

-- Load support for intllib.
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")
mobs.intllib = S

-- Animals

dofile(path .. "/cow.lua") 
dofile(path .. "/pig.lua") 
dofile(path .. "/chicken.lua") 
dofile(path .. "/sheep.lua") 
dofile(path .. "/bee.lua") 
dofile(path .. "/horse.lua") 
dofile(path .. "/penguin.lua") 
dofile(path .. "/bird.lua") 


print (S("[MOD] Mobs Redo 'static animals' loaded"))
