dofile(minetest.get_modpath("qt_dimentions").."/functions.lua")
dofile(minetest.get_modpath("qt_dimentions").."/nodes.lua")
dofile(minetest.get_modpath("qt_dimentions").."/portals.lua")



     minetest.register_on_generated(function(minp, maxp, seed)
            local t1 = os.clock()
            local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
            local a = VoxelArea:new{
                    MinEdge={x=emin.x, y=emin.y, z=emin.z},
                    MaxEdge={x=emax.x, y=emax.y, z=emax.z},
            }

            local data = vm:get_data()
--river_water_source
            local c_dirt  = minetest.get_content_id("default:dirt")
            local c_grass = minetest.get_content_id("default:dirt_with_grass")
            local c_water = minetest.get_content_id("default:water_source")
			local c_lava = minetest.get_content_id("default:lava_source")
			local c_stone = minetest.get_content_id("default:stone")
			local c_air = minetest.get_content_id("air")
			local c_river_water = minetest.get_content_id("default:river_water_source")
			local c_obsidian = minetest.get_content_id("default:obsidian")

			local c_bedrock = minetest.get_content_id("qt_dimentions:dimentional_seperator_203948")
			local c_hider = minetest.get_content_id("qt_dimentions:dimentional_hider_043967097")

			local c_brilliance_stone = minetest.get_content_id("qt_dimentions:brilliance_stone")
			local c_brilliance_dirt = minetest.get_content_id("qt_dimentions:brilliance_dirt")
			local c_brilliance_dirt_with_grass = minetest.get_content_id("qt_dimentions:brilliance_dirt_with_grass")
			local c_brilliance_sand = minetest.get_content_id("qt_dimentions:brilliance_sand")
			local c_brilliance_sapling = minetest.get_content_id("qt_dimentions:brilliance_sapling_instant")
			local c_brilliance_wildflower = minetest.get_content_id("qt_dimentions:brilliance_wildflower")
			local c_brilliance_stone_with_lilimite = minetest.get_content_id("qt_dimentions:brilliance_stone_with_lilimite")
			local c_brilliance_stone_with_cobalt = minetest.get_content_id("qt_dimentions:brilliance_stone_with_cobalt")


            local sidelen = maxp.x - minp.x + 1

			local brilliancenoise = minetest.get_perlin_map(
                    {offset=18.5, scale=1, spread={x=200, y=40, z=200}, seed=40, octaves=3, persist=0.4},
                    {x=sidelen, y=sidelen, z=sidelen}
			)

			local brilliancenvals = brilliancenoise:get3dMap_flat({x=minp.x, y=minp.y, z=minp.z})

			local brilliancenoise_forest = minetest.get_perlin_map(
                    {offset=18.5, scale=1, spread={x=50, y=100000, z=50}, seed=40, octaves=3, persist=0.4},
                    {x=sidelen, y=sidelen, z=sidelen}
			)

			local brilliance_forestnvals = brilliancenoise_forest:get3dMap_flat({x=minp.x, y=minp.y, z=minp.z})

            local ni = 1
            for z = minp.z, maxp.z do
            for y = minp.y, maxp.y do
            for x = minp.x, maxp.x do
					if y >= 489 and y <= 490 then
						local vi = a:index(x, y, z)
							data[vi] = c_hider
					end
					if y >= 491 and y <= 499 then
						local vi = a:index(x, y, z)
							data[vi] = c_bedrock
					end
					if y >= 500 and y <=1500 then
						local vi = a:index(x, y, z)
							data[vi] = c_air
							if brilliancenvals[ni] - (y - 25) / 55 > 0.5 then
									local vi = a:index(x, y, z)
									local va = a:index(x, y-1, z)
									local vb = a:index(x, y-2, z)
									local vc = a:index(x, y-3, z)
									if y > 1000 then
											data[vi] = c_brilliance_dirt_with_grass
											if data[va] == c_brilliance_dirt_with_grass then
											data[va] = c_brilliance_dirt
											end
											if data[vb] == c_brilliance_dirt then
											data[vb] = c_brilliance_dirt
											end
											if data[vc] == c_brilliance_dirt then
											data[vc] = c_brilliance_stone
											end
									else
											data[vi] = c_brilliance_sand
											if data[va] == c_brilliance_sand then
											data[va] = c_brilliance_sand
											end
											if data[vb] == c_brilliance_sand then
											data[vb] = c_brilliance_sand
											end
											if data[vc] == c_brilliance_sand then
											data[vc] = c_brilliance_stone
											end
									end
							elseif y < 1000 then
									local vi = a:index(x, y, z)
									data[vi] = c_river_water
							elseif brilliance_forestnvals[ni] - (y - 25) / 55 > 0.5 then
									--brilliance_forestnvals[ni] - (y - 25) / 55 > 0.5 then
									local vi = a:index(x, y, z)
									local va = a:index(x, y-1, z)
									if data[va] == c_brilliance_dirt_with_grass then
										local rnum = math.random(1, 60)
										if rnum == 1 then
											data[vi] = c_brilliance_sapling
										end
									end
							elseif y > 1000 then
									local vi = a:index(x, y, z)
									local va = a:index(x, y-1, z)
									if data[va] == c_brilliance_dirt_with_grass then
										local rnum = math.random(1, 50)
										if rnum == 1 then
											data[vi] = c_brilliance_wildflower
										end
									end
							end
							
					end

					if y >= 1501 and y <= 1502 then
						local vi = a:index(x, y, z)
							data[vi] = c_hider
					end

					if y >= 1502 and y <= 1512 then
						local vi = a:index(x, y, z)
							data[vi] = c_bedrock
					end
					--
                    ni = ni + 1
            end
            end
            end

            vm:set_data(data)

            vm:calc_lighting(
                    {x=minp.x-16, y=minp.y, z=minp.z-16},
                    {x=maxp.x+16, y=maxp.y, z=maxp.z+16}
            )
            vm:write_to_map(data)
    end)
