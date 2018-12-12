
local path = minetest.get_modpath("smobs_monster")

-- Intllib
local S
if minetest.global_exists("intllib") then
	if intllib.make_gettext_pair then
		-- New method using gettext.
		S = intllib.make_gettext_pair()
	else
		-- Old method using text files.
		S = intllib.Getter()
	end
else
	S = function(s) return s end
end
mobs.intllib = S

-- Monsters

dofile(path .. "/tree_monster.lua")
dofile(path .. "/spider.lua")
dofile(path .. "/stone_monster.lua")
dofile(path .. "/zombie.lua")

print ("[MOD] Mobs Redo 'static monsters' loaded")
