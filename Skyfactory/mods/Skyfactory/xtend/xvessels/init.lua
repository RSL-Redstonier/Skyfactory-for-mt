_xtend.init()

local modpath = minetest.get_modpath(minetest.get_current_modname())..DIR_DELIM
dofile(modpath..'registering_function.lua')
local register_path = modpath..'register'..DIR_DELIM


-- Register
dofile(register_path..'default.lua')
dofile(register_path..'drinks.lua')


_xtend.clean()
