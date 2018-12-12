for name, data in pairs({
    day = {
    settime = 0.5,
	tex = "orbs_orb_day.png",
	craft1 = "skytest:source",
	craft2 = "skytest:source",
},
    night = {
    settime = 0,
	tex = "orbs_orb_night.png",
	craft1 = "default:coal_lump",
	craft2 = "default:coal_lump",
},
    dawn = {
    settime = 0.2,
	tex = "orbs_orb_day.png^[lowpart:50:orbs_orb_night.png",
	craft1 = "skytest:source",
	craft2 = "default:coal_lump",
},
    dusk = {
    settime = 0.8,
	tex = "orbs_orb_night.png^[lowpart:50:orbs_orb_day.png",
	craft1 = "default:coal_lump",
	craft2 = "skytest:source",
},
}) do
minetest.register_node("skytest:"..name.."_time_dilator", {
	description = ""..name.." Time Dilator\nwill permanently set the time to "..name.." while on",
	tiles = {
		"bees_hive_industrial.png^"..data.tex.."^factory_overlay.png",
		"bees_hive_industrial.png^"..data.tex.."^factory_overlay.png",
		"factory_overlay.png",
		"factory_overlay.png",
		"factory_overlay.png",
		"factory_overlay.png"
	},
	inventory_image = "dsu_front.png^"..data.tex,
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.375, 0.5, -0.375}, -- NodeBox2
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox3
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox5
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox6
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375}, -- NodeBox7
		}
	},
        is_ground_content = true,
	groups = {cracky = 3},
		on_rightclick = function(pos, node)
	    minetest.set_node(pos, {name="skytest:"..name.."_time_dilator_on"})
    end,
  })
  minetest.register_node("skytest:"..name.."_time_dilator_on", {
	description = "",
	tiles = {
		"bees_hive_industrial.png^yellow.png^"..data.tex.."^factory_overlay.png",
		"bees_hive_industrial.png^yellow.png^"..data.tex.."^factory_overlay.png",
		"factory_overlay.png",
		"factory_overlay.png",
		"factory_overlay.png",
		"factory_overlay.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.375, 0.5, -0.375}, -- NodeBox2
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox3
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox5
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox6
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375}, -- NodeBox7
		}
	},
	drop = "skytest:"..name.."_time_dilator",
    is_ground_content = true,
	groups = {cracky = 3},
		on_rightclick = function(pos, node)
	    minetest.set_node(pos, {name="skytest:"..name.."_time_dilator"})
    end,
	    on_construct = function(pos, node, player)
        local timer = minetest.get_node_timer(pos)
        timer:start(5)
end,
on_timer = function(pos, node)
        minetest.set_node(pos, {name="skytest:"..name.."_time_dilator_on_2"})
		minetest.set_timeofday(data.settime)
end,
  })
  minetest.register_node("skytest:"..name.."_time_dilator_on_2", {
	description = "",
	tiles = {
		"bees_hive_industrial.png^yellow.png^"..data.tex.."^factory_overlay.png",
		"bees_hive_industrial.png^yellow.png^"..data.tex.."^factory_overlay.png",
		"factory_overlay.png",
		"factory_overlay.png",
		"factory_overlay.png",
		"factory_overlay.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.375, 0.5, -0.375}, -- NodeBox2
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox3
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox4
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox5
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox6
			{-0.375, -0.5, -0.375, 0.375, 0.5, 0.375}, -- NodeBox7
		}
	},
	drop = "skytest:"..name.."_time_dilator",
    is_ground_content = true,
	groups = {cracky = 3},
		on_rightclick = function(pos, node)
	    minetest.set_node(pos, {name="skytest:"..name.."_time_dilator"})
    end,
	    on_construct = function(pos, node, player)
        local timer = minetest.get_node_timer(pos)
        timer:start(5)
end,
on_timer = function(pos, node)
        minetest.set_node(pos, {name="skytest:"..name.."_time_dilator_on_2"})
		minetest.set_timeofday(data.settime)
end,
  })
   minetest.register_craft({
    output = "skytest:"..name.."_time_dilator",
    recipe = {
      {data.craft1,"skytest:neptonium_ingot",data.craft2},
      {"skytest:spectral_book","skytest:enchanted_factory_tier5","skytest:spectral_book"},
      {"skytest:bedrockium_chip","skytest:disrupter","skytest:bedrockium_chip"},
    }
  })
  
end
