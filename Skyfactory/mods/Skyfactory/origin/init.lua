
local origin = {}
origin.settings = {}

do
	local filepath = minetest.get_worldpath().."/origin.mt"
	local file = io.open(filepath, "r")
	if file then
		io.close(file)
		origin.exists = true
	else
		origin.exists = false
	end

	origin.settings.force_singlenode = minetest.setting_getbool("origin_force_singlenode")
	if origin.settings.force_singlenode == nil then
		origin.settings.force_singlenode = true
	end
end
minetest.register_on_mapgen_init(function(mgparams)
	if origin.settings.force_singlenode == true then
		minetest.set_mapgen_params({mgname = "singlenode"})
	end
end)

minetest.register_on_generated(function(minp, maxp, seed)
	local spawn = minetest.setting_get_pos("static_spawnpoint")
	if origin.exists ~= true then
		local blockpos
		if spawn ~= nil then
			blockpos = { x=0, y=-1, z=0 }
		else
			blockpos = { x=0, y=-1, z=0 }
		end
		if(minp.x <= blockpos.x and maxp.x >= blockpos.x and minp.y <= blockpos.y and maxp.y >= blockpos.y and minp.z <= blockpos.z and maxp.z >= blockpos.z) then
			minetest.set_node(blockpos, {name = "default:dirt"})
                        blockpos = { x=0, y=0, z=0 }
                        default.grow_new_pine_tree(blockpos)
			minetest.log("action", "[origin] The Origin has been set at "..minetest.pos_to_string(blockpos)..".")
			origin.exists = true
			local filepath = minetest.get_worldpath().."/origin.mt"
			local file = io.open(filepath, "w")
			if file then
				file:write(minetest.pos_to_string(blockpos))
			else
				minetest.log("error", "[origin] Failed to write origin data into "..filepath..". The Origin may be placed again if you change static_spawnpoint.")
			end
		end
	end
end)
local stuff_string = ""

give_initial_stuff = {
	items = {"ntm_extension:guide"}
}

function give_initial_stuff.give(player)
	minetest.log("action","Giving initial stuff to player " .. player:get_player_name())
	local inv = player:get_inventory()
	for _, stack in ipairs(give_initial_stuff.items) do
		inv:add_item("main", stack)
	end
end

function give_initial_stuff.add(stack)
	give_initial_stuff.items[#give_initial_stuff.items + 1] = ItemStack(stack)
end

function give_initial_stuff.clear()
	give_initial_stuff.items = {}
end

function give_initial_stuff.add_from_csv(str)
	local items = str:split(",")
	for _, itemname in ipairs(items) do
		give_initial_stuff.add(itemname)
	end
end

function give_initial_stuff.set_list(list)
	give_initial_stuff.items = list
end

function give_initial_stuff.get_list()
	return give_initial_stuff.items
end

give_initial_stuff.add_from_csv(stuff_string)
minetest.register_on_newplayer(give_initial_stuff.give)

minetest.register_on_respawnplayer(function(player)
    player:setpos({x=0, y=1, z=0})
    return true
end)
minetest.register_on_newplayer(function(player)
    player:setpos({x=0, y=13, z=0})
    return true
end)