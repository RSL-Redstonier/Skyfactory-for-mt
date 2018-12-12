journal.register_page("starter_tutorial:starter_tutorial","Starter Tutorial","Your Thought's")
journal.triggers.register_on_join({
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:joinedWorld")
	end,
	call = function(data)
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Its a whole new world...\nYou wake up on a tree in a empty space with no memories.",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nI should try to build a little breathing room.",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:joinedWorld",true)
	end,
})
journal.triggers.register_counter("starter_tutorial:builtPlatformCount","place","default:pine_wood",false)
journal.triggers.register_on_place({
	target = "default:pine_wood",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:builtPlatform")
	end,
	call = function(data)
	local count = journal.triggers.get_count("starter_tutorial:builtPlatformCount",data.playerName)
	if count >= 24 then
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Today I made a little space to breathe. It's not much but its better than nothing.",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nI should try to grow another tree.",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:builtPlatform",true)
	end
	end,
})
journal.triggers.register_on_place({
	target = "default:pine_sapling",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:plantTree")
	end,
	call = function(data)
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Today I tried to grow another tree but it seems that these things take time.",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nI should try to gather some resources.",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:plantTree",true)
	end,
})
journal.triggers.register_counter("starter_tutorial:harvestPineCount","dig","default:pine_tree",false)
journal.triggers.register_on_dig({
	target = "default:pine_tree",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:harvestPine")
	end,
	call = function(data)
	local count = journal.triggers.get_count("starter_tutorial:harvestPineCount",data.playerName)
		if count >= 24 then
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Today I gathered some wood.",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nI should use this time to contemplate.",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:harvestPine",true)
	end
	end,
})
journal.triggers.register_on_die({
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:dieResearch")
	end,
	call = function(data)
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Today I discovered that death might actually be a good thing.",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nI should use my former body's bones for something.",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:dieResearch",true)
	end,
})
journal.triggers.register_on_craft({
	target = "bonemeal:bonemeal",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:boneCraft")
	end,
	call = function(data)
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Today I found a wonderful substance that seams to increase the speed at which plants grow almost 10 fold.",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nI have found that some of my leaves start to decay.\nI should invest in a barrel to compost some of my spare plants.",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:boneCraft",true)
	end,
})
journal.triggers.register_on_craft({
	target = "skytest:bonemeal",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:boneCraft")
	end,
	call = function(data)
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Today I found a wonderful substance that seams to increase the speed at which plants grow almost 10 fold.",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nI have found that some of my leaves start to decay.\nI should invest in a barrel to compost some of my spare plants.",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:boneCraft",true)
	end,
})

journal.triggers.register_on_craft({
	target = "skytest:pine_wood_barrel_empty",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:barrelCraft")
	end,
	call = function(data)
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Today I have built a basic barrel of sorts.",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nI should pile up some of the dirt that I have collected.\nI might even find a few bones in the dirt.",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:barrelCraft",true)
	end,
})
journal.triggers.register_counter("starter_tutorial:dirtPileCount","place","default:dirt",false)
journal.triggers.register_on_place({
	target = "default:dirt",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:dirtPile")
	end,
	call = function(data)
		local count = journal.triggers.get_count("starter_tutorial:dirtPileCount",data.playerName)
	if count >= 12 then
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Today I have collected some dirt.",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nOcasionally some of it glows with a strange soft light.\nI should try to collect some of this glowing dirt to make a mysterious red orb.",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:dirtPile",true)
	end
	end,
})
journal.triggers.register_on_craft({
	target = "skytest:philosophers_stone",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:philstoneCraft")
	end,
	call = function(data)
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Today I have collected enough glowing dirt to make my self a strange stone.",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nI notice that it seams to distort certain materials around it.\nI should try using it on some leaves.",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:philstoneCraft",true)
	end,
})
local acl = false
local asl = false
local dl = false
local jl = false
journal.triggers.register_on_dig({
	target = "default:pine_needles",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:philLeaves")
	end,
	call = function(data)
	if acl == true and
		asl == true and
		dl == true and
		jl == true then
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Today I have concluded a test with what I now call the Philosopher's Stone.\n I have determined that it can alter the properties of certain materials, namely leaves",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nI should use these new found tree species to collect some new variety's of wood.",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:philLeaves",true)
	end
	end,
})
journal.triggers.register_on_dig({
	target = "default:leaves",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:philLeaves")
	end,
	call = function(data)
	if dl == false then
dl = true
end
	end,
})
journal.triggers.register_on_dig({
	target = "default:acacia_leaves",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:philLeaves")
	end,
	call = function(data)
	if acl == false then
acl = true
end
	end,
})
journal.triggers.register_on_dig({
	target = "default:aspen_leaves",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:philLeaves")
	end,
	call = function(data)
	if asl == false then
asl = true
end
	end,
})
journal.triggers.register_on_dig({
	target = "default:jungleleaves",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:philLeaves")
	end,
	call = function(data)
	if jl == false then
jl = true
end
	end,
})


local act = false
local ast = false
local dt = false
local jt = false
journal.triggers.register_on_dig({
	target = "default:pine_tree",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:newTrees")
	end,
	call = function(data)
	if act == true and
		ast == true and
		dt == true and
		jt == true then
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Today I have successfully grown and collected some wood from each new tree species",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nI have noticed that the oak species of leaves occasionally have small worms hiding inside.\nPerhaps a crook would allow me to collect a few of these wiggly fellows?",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:newTrees",true)
	end
	end,
})
journal.triggers.register_on_dig({
	target = "default:tree",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:newTrees")
	end,
	call = function(data)
	if dt == false then
dt = true
end
	end,
})
journal.triggers.register_on_dig({
	target = "default:acacia_tree",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:newTrees")
	end,
	call = function(data)
	if act == false then
act = true
end
	end,
})
journal.triggers.register_on_dig({
	target = "default:aspen_tree",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:newTrees")
	end,
	call = function(data)
	if ast == false then
ast = true
end
	end,
})
journal.triggers.register_on_dig({
	target = "default:jungletree",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:newTrees")
	end,
	call = function(data)
	if jt == false then
jt = true
end
	end,
})

journal.triggers.register_on_eat({
	target = "skytest:silkworm",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:silkwormsCollect")
	end,
	call = function(data)
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","*Cough* Today I have successfully collected some worms.\nUnfortunately I have also discovered that they are edible.",true)
		minetest.after(15,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nThese worms seem to produce thin strands of threads whenever left alone for a while.\nPerhaps I should place a few of these in a grown oak tree?",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:silkwormsCollect",true)
	end,
})
journal.triggers.register_on_dig({
	target = "skytest:infested_leaves",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:silkwormsInfest")
	end,
	call = function(data)
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Just as I thought. These little worms need to eat only oak leaves to grow and shed their skin a few times but after that any already grown worm can eat right through any leaf in its path.",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nThe fibers produced are to thin and delicate to collect by hand, a crook is required.",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:silkwormsInfest",true)
	end,
})
journal.triggers.register_on_craft({
	target = "skytest:silk_mesh",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:silkmeshCraft")
	end,
	call = function(data)
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Today I have made a simple mesh in the hopes of collecting anything of value from dirt.",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nThe mesh just isn't strong enough on its own to support the weight of anything.\nI must add some other fibers to reinforce it",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:silkmeshCraft",true)
	end,
})
journal.triggers.register_on_craft({
	target = "skytest:cloth_fiber",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:fibersCraft")
	end,
	call = function(data)
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Ah Ha! I have used some oak wood strands and leaves to make a strong sturdy string.",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nI should be able to reinforce my simple mesh with some of this new string.",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:fibersCraft",true)
	end,
})
journal.triggers.register_on_craft({
	target = "skytest:mesh",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:fibersCraft")
	end,
	call = function(data)
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Now that I have a sturdy mesh, I need a simple frame to hold it all together.",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nI should be able to build a frame from some wood and sticks.",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:fibersCraft",true)
	end,
})
journal.triggers.register_on_place({
	target = "skytest:empty_sieve",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:sievePlace")
	end,
	call = function(data)
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Now that I have a simple frame I should be able to stretch my mesh over it.",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nI should be able to sieve some dirt.",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:sievePlace",true)
	end,
})
journal.triggers.register_on_craft({
	target = "default:cobble",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:pebbelcobbleCraft")
	end,
	call = function(data)
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Success! I have found some small pebbles in my dirt and converted them to stone.",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nHmm I wonder if my Philosopher's Stone will affect this basic material?",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:pebbelcobbleCraft",true)
	end,
})

local g = false
local c = false
journal.triggers.register_on_punchnode({
	target = "default:sand",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:philCobble")
	end,
	call = function(data)
	if c == true and
		g == true and data.tool == "skytest:philosophers_stone" then
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Today I have determined that my Philosopher's Stone seams to grind the cobble into gravel and then even finer but with out actually grinding.",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nI have noticed that some of these new materials have some sparkles in them.\nPerhaps these materials can be sieved to get minerals?",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:philCobble",true)
	end
	end,
})
journal.triggers.register_on_punchnode({
	target = "default:gravel",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:philCobble")
	end,
	call = function(data)
	if g == false and data.tool == "skytest:philosophers_stone" then
g = true
end
	end,
})
journal.triggers.register_on_punchnode({
	target = "default:cobble",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:philCobble")
	end,
	call = function(data)
	if c == false and data.tool == "skytest:philosophers_stone" then
c = true
end
	end,
})
journal.triggers.register_on_punchnode({
	target = "skytest:hand_sieve",
	is_active = function(playerName)
		return not journal.playerdata_getKey(playerName,"starter_tutorial:sieveNewMat")
	end,
	call = function(data)
	if data.tool == "default:gravel" or data.tool == "default:sand" or data.tool == "skytest:dust" then
		journal.add_entry(data.playerName,"starter_tutorial:starter_tutorial","Today I have collected some small chunks of metals and minerals from these new materials.",true)
		minetest.after(5,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nThese pieces are to small to do anything with.\nThey must be combined to make larger chunks.",true)
		minetest.after(10,journal.add_entry,data.playerName,"starter_tutorial:starter_tutorial","\nI must congratulate my self. I started with nothing and I now have adequate materials to start doing what ever I want.",true)
		journal.add_entry(data.playerName,"starter_tutorial:skytest_tutorial","\nPerhaps I should mix some dust with water in a barrel?",true)
		journal.playerdata_setKey(data.playerName,"starter_tutorial:sieveNewMat",true)
	end
	end,
})