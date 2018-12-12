--rgen functions (seperate api by fessmk)
rgen = {}
rgen.data = {}

rgen.register_random_data = function(box, data)
	if rgen.data[box] ~= nil then
		local number = rgen.data[box].number
		number = number+1
		rgen.data[box][number] = data
		rgen.data[box].number = number
	else
		rgen.data[box] = {}
		rgen.data[box].number = 1
		rgen.data[box][1] = data
	end
end

rgen.get_random_data = function(box)
	if rgen.data[box] ~= nil then
		local dispose = math.random(1, 30) --some thing used to dispose of the 1st "random" number.
		local rnumber = math.random(rgen.data[box].number)
		if rgen.data[box][rnumber] ~= nil then
			return rgen.data[box][rnumber]
		else
			return nil
		end
	else
		return nil
	end
end

rgen.set_randomseed = function(seed)
	math.randomseed(seed)
	rgen.randomseed = seed
end


--dimention functions

rgen.register_random_data("Miner_l1", "default:stone")
rgen.register_random_data("Miner_l1", "default:stone_with_coal")
rgen.register_random_data("Miner_l1", "default:stone_with_iron")
rgen.register_random_data("Miner_l1", "default:stone_with_copper")
rgen.register_random_data("Miner_l1", "default:stone_with_gold")
rgen.register_random_data("Miner_l2","default:stone_with_mese")
rgen.register_random_data("Miner_l2","default:stone_with_diamond")

local random = math.random

local function can_grow(pos)
	local node_under = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if not node_under then
		return false
	end
	local name_under = node_under.name
	local is_soil = minetest.get_item_group(name_under, "soil")
	if is_soil == 0 then
		return false
	end
	return true
end

local function add_trunk_and_leaves(data, a, pos, tree_cid, leaves_cid, apple_cid,
		height, size, iters, is_apple_tree)
	local x, y, z = pos.x, pos.y, pos.z
	local c_air = minetest.get_content_id("air")
	local c_ignore = minetest.get_content_id("ignore")
	local c_apple = apple_cid  --minetest.get_content_id("default:apple")

	-- Trunk
	data[a:index(x, y, z)] = tree_cid -- Force-place lowest trunk node to replace sapling
	for yy = y + 1, y + height - 1 do
		local vi = a:index(x, yy, z)
		local node_id = data[vi]
		if node_id == c_air or node_id == c_ignore or node_id == leaves_cid then
			data[vi] = tree_cid
		end
	end

	-- Force leaves near the trunk
	for z_dist = -1, 1 do
	for y_dist = -size, 1 do
		local vi = a:index(x - 1, y + height + y_dist, z + z_dist)
		for x_dist = -1, 1 do
			if data[vi] == c_air or data[vi] == c_ignore then
				if is_apple_tree and random(1, 8) == 1 then
					data[vi] = c_apple
				else
					data[vi] = leaves_cid
				end
			end
			vi = vi + 1
		end
	end
	end

	-- Randomly add leaves in 2x2x2 clusters.
	for i = 1, iters do
		local clust_x = x + random(-size, size - 1)
		local clust_y = y + height + random(-size, 0)
		local clust_z = z + random(-size, size - 1)

		for xi = 0, 1 do
		for yi = 0, 1 do
		for zi = 0, 1 do
			local vi = a:index(clust_x + xi, clust_y + yi, clust_z + zi)
			if data[vi] == c_air or data[vi] == c_ignore then
				if is_apple_tree and random(1, 8) == 1 then
					data[vi] = c_apple
				else
					data[vi] = leaves_cid
				end
			end
		end
		end
		end
	end
end

local grow_brilliance_tree = function(pos, is_fruit_tree)

	local x, y, z = pos.x, pos.y, pos.z
	local height = random(6, 8)
	local c_tree = minetest.get_content_id("qt_dimentions:brilliance_tree")
	local c_leaves = minetest.get_content_id("qt_dimentions:brilliance_leaves")

	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 2, y = pos.y, z = pos.z - 2},
		{x = pos.x + 2, y = pos.y + height + 1, z = pos.z + 2}
	)
	local a = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()

	add_trunk_and_leaves(data, a, pos, c_tree, c_leaves, c_leaves, height, 3, 20, is_apple_tree)
	--hight, size, iters
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

minetest.register_abm({
	nodenames = {"qt_dimentions:brilliance_sapling_instant"},
	--interval = 10,
	--chance = 50,
	interval = 1,
	chance = 5,
	action = function(pos, node)
		if not can_grow(pos) then
			return
		end

		local mapgen = minetest.get_mapgen_params().mgname
		grow_brilliance_tree(pos, false)
	end
})

minetest.register_abm({
	nodenames = {"qt_dimentions:brilliance_sapling"},
	interval = 10,
	chance = 50,
	action = function(pos, node)
		if not can_grow(pos) then
			return
		end

		local mapgen = minetest.get_mapgen_params().mgname
		grow_brilliance_tree(pos, false)
	end
})
