-- Inspire init.lua
-- Copyright Duane Robertson (duane@duanerobertson.com), 2017
-- Distributed under the LGPLv2.1 (https://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html)

-- inspiration to fertilize plant


inspire_mod = {}
inspire_mod.version = "20171028"
inspire_mod.path = minetest.get_modpath(minetest.get_current_modname())
inspire_mod.world = minetest.get_worldpath()
inspire_mod.score = {}
inspire_mod.values = {}
inspire_mod.explore_distance = 500  -- Anyone in this radius gets points for a new chunk.
inspire_mod.chunk_value = 50  -- amount awarded for each new chunk explored
inspire_mod.build_value = 5   -- amount awarded for placing dirt/cobble
inspire_mod.log_time = 30     -- time you must be logged in before you get points


dofile(inspire_mod.path .. "/values.lua")
for k, v in pairs(inspire_mod.values) do
  inspire_mod.values[k] = v * inspire_mod.build_value
end


--inspire_mod.breakable_wood = minetest.setting_getbool('inspire_breakable_wood')
--if inspire_mod.breakable_wood == nil then
--	inspire_mod.breakable_wood = false
--end


minetest.register_craftitem("inspire:inspiration", {
	description = "Inspiration",
	inventory_image = "inspire_inspiration.png",
	on_use = minetest.item_eat(10),
	stack_max = 3000,
})


minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
  if newnode and newnode.name and placer and placer.get_player_name and type(newnode.name) == 'string' then
    local node_score = 4

		local player_name = placer:get_player_name()

    if inspire_mod.values[newnode.name] then
      node_score = inspire_mod.values[newnode.name]
    end

    if inspire_mod.score[player_name] then
      inspire_mod.score[player_name] = inspire_mod.score[player_name] + node_score
    else
      inspire_mod.score[player_name] = node_score
    end

    --print('inspire node score '..node_score)
  end
end)

local last_inspire_check = 0

minetest.register_globalstep(function(dtime)
	if not (dtime and type(dtime) == 'number') then
		return
	end

	local time = minetest.get_gametime()
	if not (time and type(time) == 'number') then
		return
	end

	if last_inspire_check and time - last_inspire_check < 10 then
		return
	end

	local players = minetest.get_connected_players()
	if not (players and type(players) == 'table') then
		return
	end

	for i = 1, #players do
		local player = players[i]
		local player_name = player:get_player_name()

    if player_name then
      local log_time = minetest.get_player_information(player_name).connection_uptime
      if log_time and type(log_time) == 'number' and log_time < inspire_mod.log_time then
        inspire_mod.score[player_name] = 0
      elseif inspire_mod.score[player_name] and type(inspire_mod.score[player_name]) == 'number' and inspire_mod.score[player_name] > 100 then
        local inspires = math.floor(inspire_mod.score[player_name] / 100)
        inspire_mod.score[player_name] = inspire_mod.score[player_name] % 100
        player:get_inventory():add_item("main", ItemStack("inspire:inspiration "..inspires))
      end
    end
  end
end)


-- This tables looks up nodes that aren't already stored.
local node = setmetatable({}, {
	__index = function(t, k)
		if not (t and k and type(t) == 'table') then
			return
		end

		t[k] = minetest.get_content_id(k)
		return t[k]
	end
})

local data = {}

local function count_chunks(minp, maxp, blockseed)
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	if not (vm and emin and emax) then
		return
	end

	vm:get_data(data)

  local air, other
  for i = 1, #data do
    if data[i] == node['air'] then
      air = true
    elseif data[i] ~= node['ignore'] then
      other = true
    end

    if air and other then
      break
    end
  end

  if not (air and other) then
    return
  end

  local mid = vector.add(minp, 40)

  for _, p in pairs(minetest.get_connected_players()) do
    if vector.distance(mid, p:getpos()) < inspire_mod.explore_distance then
      local player_name = p:get_player_name()
      if player_name then
        if inspire_mod.score[player_name] then
          inspire_mod.score[player_name] = inspire_mod.score[player_name] + inspire_mod.chunk_value
        else
          inspire_mod.score[player_name] = inspire_mod.chunk_value
        end
      end
    end
  end
end


minetest.register_on_generated(count_chunks)

dofile(inspire_mod.path .. "/recipes.lua")
