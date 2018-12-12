minetest.register_node("skytest:octuple_compressed_cobblestone_43046721c", {
    description = "octuple compressed cobblestone 43,046,721c\nEMC = 43,046,721",
	tiles = {"cc_node_08.png"},
	drawtype = "nodebox",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3},
	node_box = {
		type = "fixed",
		fixed = {
			-- top (Y+)
			{-0.0625, 0, -0.0625, 0.0625, 0.0625, 0.0625},
			{-0.125, 0.0625, -0.125, 0.125, 0.125, -0.0625},
			{-0.125, 0.0625, 0.0625, 0.125, 0.125, 0.125},
			{0.0625, 0.0625, -0.0625, 0.125, 0.125, 0.0625},
			{-0.125, 0.0625, -0.0625, -0.0625, 0.125, 0.0625},
			{0.125, 0.125, -0.1875, 0.1875, 0.1875, 0.1875},
			{-0.1875, 0.125, -0.1875, -0.125, 0.1875, 0.1875},
			{-0.125, 0.125, 0.125, 0.125, 0.1875, 0.1875},
			{-0.125, 0.125, -0.1875, 0.125, 0.1875, -0.125},
			{-0.25, 0.1875, 0.1875, 0.25, 0.25, 0.25},
			{-0.25, 0.1875, -0.25, 0.25, 0.25, -0.1875},
			{0.1875, 0.1875, -0.1875, 0.25, 0.25, 0.1875},
			{-0.25, 0.1875, -0.1875, -0.1875, 0.25, 0.1875},
			{-0.3125, 0.25, -0.3125, -0.25, 0.3125, 0.3125},
			{0.25, 0.25, -0.3125, 0.3125, 0.3125, 0.3125},
			{-0.25, 0.25, -0.3125, 0.25, 0.3125, -0.25},
			{-0.25, 0.25, 0.25, 0.25, 0.3125, 0.3125},
			{-0.375, 0.3125, 0.3125, 0.375, 0.375, 0.375},
			{-0.375, 0.3125, -0.375, 0.375, 0.375, -0.3125},
			{0.3125, 0.3125, -0.3125, 0.375, 0.375, 0.3125},
			{-0.375, 0.3125, -0.3125, -0.3125, 0.375, 0.3125},
			{-0.4375, 0.375, -0.4375, -0.375, 0.4375, 0.4375},
			{0.375, 0.375, -0.4375, 0.4375, 0.4375, 0.4375},
			{-0.4375, 0.375, 0.375, 0.4375, 0.4375, 0.4375},
			{-0.375, 0.375, -0.4375, 0.375, 0.4375, -0.375},
			-- bottom (Y-)
			{-0.0625, -0.0625, -0.0625, 0.0625, -0, 0.0625},
			{0.0625, -0.125, -0.125, 0.125, -0.0625, 0.125},
			{-0.125, -0.125, -0.125, -0.0625, -0.0625, 0.125},
			{-0.0625, -0.125, -0.125, 0.0625, -0.0625, -0.0625},
			{-0.0625, -0.125, 0.0625, 0.0625, -0.0625, 0.125},
			{-0.1875, -0.1875, -0.1875, 0.1875, -0.125, -0.125},
			{-0.1875, -0.1875, 0.125, 0.1875, -0.125, 0.1875},
			{-0.1875, -0.1875, -0.125, -0.125, -0.125, 0.125},
			{0.125, -0.1875, -0.125, 0.1875, -0.125, 0.125},
			{-0.25, -0.25, -0.25, -0.1875, -0.1875, 0.25},
			{0.1875, -0.25, -0.25, 0.25, -0.1875, 0.25},
			{-0.1875, -0.25, -0.25, 0.1875, -0.1875, -0.1875},
			{-0.1875, -0.25, 0.1875, 0.1875, -0.1875, 0.25},
			{-0.3125, -0.3125, 0.25, 0.3125, -0.25, 0.3125},
			{-0.3125, -0.3125, -0.3125, 0.3125, -0.25, -0.25},
			{0.25, -0.3125, -0.25, 0.3125, -0.25, 0.25},
			{-0.3125, -0.3125, -0.25, -0.25, -0.25, 0.25},
			{-0.375, -0.375, -0.375, -0.3125, -0.3125, 0.375},
			{0.3125, -0.375, -0.375, 0.375, -0.3125, 0.375},
			{-0.3125, -0.375, -0.375, 0.3125, -0.3125, -0.3125},
			{-0.3125, -0.375, 0.3125, 0.3125, -0.3125, 0.375},
			{-0.4375, -0.4375, 0.375, 0.4375, -0.375, 0.4375},
			{-0.4375, -0.4375, -0.4375, 0.4375, -0.375, -0.375},
			{-0.4375, -0.4375, -0.4375, -0.375, -0.375, 0.4375},
			{0.375, -0.4375, -0.375, 0.4375, -0.375, 0.375},
			-- right (X+)
			{0, -0.0625, -0.0625, 0.0625, 0.0625, 0.0625},
			{0.0625, -0.125, -0.125, 0.125, 0.125, -0.0625},
			{0.0625, -0.125, 0.0625, 0.125, 0.125, 0.125},
			{0.0625, -0.125, -0.0625, 0.125, -0.0625, 0.0625},
			{0.0625, 0.0625, -0.0625, 0.125, 0.125, 0.0625},
			{0.125, -0.1875, -0.1875, 0.1875, -0.125, 0.1875},
			{0.125, 0.125, -0.1875, 0.1875, 0.1875, 0.1875},
			{0.125, -0.125, 0.125, 0.1875, 0.125, 0.1875},
			{0.125, -0.125, -0.1875, 0.1875, 0.125, -0.125},
			{0.1875, -0.25, 0.1875, 0.25, 0.25, 0.25},
			{0.1875, -0.25, -0.25, 0.25, 0.25, -0.1875},
			{0.1875, -0.25, -0.1875, 0.25, -0.1875, 0.1875},
			{0.1875, 0.1875, -0.1875, 0.25, 0.25, 0.1875},
			{0.25, 0.25, -0.3125, 0.3125, 0.3125, 0.3125},
			{0.25, -0.3125, -0.3125, 0.3125, -0.25, 0.3125},
			{0.25, -0.25, -0.3125, 0.3125, 0.25, -0.25},
			{0.25, -0.25, 0.25, 0.3125, 0.25, 0.3125},
			{0.3125, -0.375, 0.3125, 0.375, 0.375, 0.375},
			{0.3125, -0.375, -0.375, 0.375, 0.375, -0.3125},
			{0.3125, -0.375, -0.3125, 0.375, -0.3125, 0.3125},
			{0.3125, 0.3125, -0.3125, 0.375, 0.375, 0.3125},
			{0.375, 0.375, -0.4375, 0.4375, 0.4375, 0.4375},
			{0.375, -0.4375, -0.4375, 0.4375, -0.375, 0.4375},
			{0.375, -0.4375, 0.375, 0.4375, 0.4375, 0.4375},
			{0.375, -0.375, -0.4375, 0.4375, 0.375, -0.375},
			-- left (X-)
			{-0.0625, -0.0625, -0.0625, -0, 0.0625, 0.0625},
			{-0.125, -0.125, 0.0625, -0.0625, 0.125, 0.125},
			{-0.125, -0.125, -0.125, -0.0625, 0.125, -0.0625},
			{-0.125, -0.125, -0.0625, -0.0625, -0.0625, 0.0625},
			{-0.125, 0.0625, -0.0625, -0.0625, 0.125, 0.0625},
			{-0.1875, -0.1875, -0.1875, -0.125, -0.125, 0.1875},
			{-0.1875, 0.125, -0.1875, -0.125, 0.1875, 0.1875},
			{-0.1875, -0.125, -0.1875, -0.125, 0.125, -0.125},
			{-0.1875, -0.125, 0.125, -0.125, 0.125, 0.1875},
			{-0.25, -0.25, -0.25, -0.1875, 0.25, -0.1875},
			{-0.25, -0.25, 0.1875, -0.1875, 0.25, 0.25},
			{-0.25, -0.25, -0.1875, -0.1875, -0.1875, 0.1875},
			{-0.25, 0.1875, -0.1875, -0.1875, 0.25, 0.1875},
			{-0.3125, 0.25, -0.3125, -0.25, 0.3125, 0.3125},
			{-0.3125, -0.3125, -0.3125, -0.25, -0.25, 0.3125},
			{-0.3125, -0.25, 0.25, -0.25, 0.25, 0.3125},
			{-0.3125, -0.25, -0.3125, -0.25, 0.25, -0.25},
			{-0.375, -0.375, -0.375, -0.3125, 0.375, -0.3125},
			{-0.375, -0.375, 0.3125, -0.3125, 0.375, 0.375},
			{-0.375, -0.375, -0.3125, -0.3125, -0.3125, 0.3125},
			{-0.375, 0.3125, -0.3125, -0.3125, 0.375, 0.3125},
			{-0.4375, 0.375, -0.4375, -0.375, 0.4375, 0.4375},
			{-0.4375, -0.4375, -0.4375, -0.375, -0.375, 0.4375},
			{-0.4375, -0.4375, -0.4375, -0.375, 0.4375, -0.375},
			{-0.4375, -0.375, 0.375, -0.375, 0.375, 0.4375},
			-- back (Z+)
			{-0.0625, -0.0625, 0, 0.0625, 0.0625, 0.0625},
			{0.0625, -0.125, 0.0625, 0.125, 0.125, 0.125},
			{-0.125, -0.125, 0.0625, -0.0625, 0.125, 0.125},
			{-0.0625, -0.125, 0.0625, 0.0625, -0.0625, 0.125},
			{-0.0625, 0.0625, 0.0625, 0.0625, 0.125, 0.125},
			{-0.1875, -0.1875, 0.125, 0.1875, -0.125, 0.1875},
			{-0.1875, 0.125, 0.125, 0.1875, 0.1875, 0.1875},
			{-0.1875, -0.125, 0.125, -0.125, 0.125, 0.1875},
			{0.125, -0.125, 0.125, 0.1875, 0.125, 0.1875},
			{-0.25, -0.25, 0.1875, -0.1875, 0.25, 0.25},
			{0.1875, -0.25, 0.1875, 0.25, 0.25, 0.25},
			{-0.1875, -0.25, 0.1875, 0.1875, -0.1875, 0.25},
			{-0.1875, 0.1875, 0.1875, 0.1875, 0.25, 0.25},
			{-0.3125, 0.25, 0.25, 0.3125, 0.3125, 0.3125},
			{-0.3125, -0.3125, 0.25, 0.3125, -0.25, 0.3125},
			{0.25, -0.25, 0.25, 0.3125, 0.25, 0.3125},
			{-0.3125, -0.25, 0.25, -0.25, 0.25, 0.3125},
			{-0.375, -0.375, 0.3125, -0.3125, 0.375, 0.375},
			{0.3125, -0.375, 0.3125, 0.375, 0.375, 0.375},
			{-0.3125, -0.375, 0.3125, 0.3125, -0.3125, 0.375},
			{-0.3125, 0.3125, 0.3125, 0.3125, 0.375, 0.375},
			{-0.4375, 0.375, 0.375, 0.4375, 0.4375, 0.4375},
			{-0.4375, -0.4375, 0.375, 0.4375, -0.375, 0.4375},
			{-0.4375, -0.4375, 0.375, -0.375, 0.4375, 0.4375},
			{0.375, -0.375, 0.375, 0.4375, 0.375, 0.4375},
			-- front (Z-)
			{-0.0625, -0.0625, -0.0625, 0.0625, 0.0625, -0},
			{-0.125, -0.125, -0.125, -0.0625, 0.125, -0.0625},
			{0.0625, -0.125, -0.125, 0.125, 0.125, -0.0625},
			{-0.0625, -0.125, -0.125, 0.0625, -0.0625, -0.0625},
			{-0.0625, 0.0625, -0.125, 0.0625, 0.125, -0.0625},
			{-0.1875, -0.1875, -0.1875, 0.1875, -0.125, -0.125},
			{-0.1875, 0.125, -0.1875, 0.1875, 0.1875, -0.125},
			{0.125, -0.125, -0.1875, 0.1875, 0.125, -0.125},
			{-0.1875, -0.125, -0.1875, -0.125, 0.125, -0.125},
			{0.1875, -0.25, -0.25, 0.25, 0.25, -0.1875},
			{-0.25, -0.25, -0.25, -0.1875, 0.25, -0.1875},
			{-0.1875, -0.25, -0.25, 0.1875, -0.1875, -0.1875},
			{-0.1875, 0.1875, -0.25, 0.1875, 0.25, -0.1875},
			{-0.3125, 0.25, -0.3125, 0.3125, 0.3125, -0.25},
			{-0.3125, -0.3125, -0.3125, 0.3125, -0.25, -0.25},
			{-0.3125, -0.25, -0.3125, -0.25, 0.25, -0.25},
			{0.25, -0.25, -0.3125, 0.3125, 0.25, -0.25},
			{0.3125, -0.375, -0.375, 0.375, 0.375, -0.3125},
			{-0.375, -0.375, -0.375, -0.3125, 0.375, -0.3125},
			{-0.3125, -0.375, -0.375, 0.3125, -0.3125, -0.3125},
			{-0.3125, 0.3125, -0.375, 0.3125, 0.375, -0.3125},
			{-0.4375, 0.375, -0.4375, 0.4375, 0.4375, -0.375},
			{-0.4375, -0.4375, -0.4375, 0.4375, -0.375, -0.375},
			{0.375, -0.4375, -0.4375, 0.4375, 0.4375, -0.375},
			{-0.4375, -0.375, -0.4375, -0.375, 0.375, -0.375},
			-- corner frame
			{-0.4375, 0.4375, 0.4375, 0.4375, 0.5, 0.5},
			{-0.4375, -0.5, 0.4375, 0.4375, -0.4375, 0.5},
			{-0.5, -0.5, 0.4375, -0.4375, 0.5, 0.5},
			{0.4375, -0.5, 0.4375, 0.5, 0.5, 0.5},
			{-0.5, 0.4375, -0.4375, -0.4375, 0.5, 0.4375},
			{-0.5, -0.5, -0.4375, -0.4375, -0.4375, 0.4375},
			{0.4375, 0.4375, -0.4375, 0.5, 0.5, 0.4375},
			{0.4375, -0.5, -0.4375, 0.5, -0.4375, 0.4375},
			{-0.5, 0.4375, -0.5, 0.5, 0.5, -0.4375},
			{-0.5, -0.5, -0.5, 0.5, -0.4375, -0.4375},
			{0.4375, -0.4375, -0.5, 0.5, 0.4375, -0.4375},
			{-0.5, -0.4375, -0.5, -0.4375, 0.4375, -0.4375},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
	emc = 43046721
})

for name, data in pairs({
    dirt = {
        mat = "default:dirt",
        tex = "default_dirt.png",
    },
    obsidian = {
        mat = "default:obsidian",
        tex = "default_obsidian.png",
    },
	gravel = {
    mat = "default:gravel",
    tex = "default_gravel.png",
    },
	sand = {
    mat = "default:sand",
    tex = "default_sand.png",
    },

}) do
    
    
    
minetest.register_node("skytest:compressed_"..name.."_9c", {
    description = "compressed "..name.." 9c",
    tiles = {""..data.tex.."^[colorize:black:50"},
    groups = {cracky = 2}
})

minetest.register_node("skytest:double_compressed_"..name.."_81c", {
    description = "double compressed "..name.." 81c",
    tiles = {""..data.tex.."^[colorize:black:70"},
    groups = {cracky = 2}
})


minetest.register_node("skytest:triple_compressed_"..name.."_729c", {
    description = "triple compressed "..name.." 729c",
    tiles = {""..data.tex.."^[colorize:black:90"},
    groups = {cracky = 2}
})

minetest.register_node("skytest:quadruple_compressed_"..name.."_6561c", {
    description = "quadruple compressed "..name.." 6561c",
    tiles = {""..data.tex.."^[colorize:black:130"},
    groups = {cracky = 2}
})
minetest.register_node("skytest:quintuple_compressed_"..name.."_59049c", {
    description = "quintuple compressed "..name.." 59,049c",
    tiles       = {""..data.tex.."^[colorize:black:150"},
    groups      = {cracky = 2}
})
minetest.register_node("skytest:sextuple_compressed_"..name.."_531441c", {
    description = "sextuple compressed "..name.." 531,441c",
    tiles = {""..data.tex.."^[colorize:black:170"},
    groups = {cracky = 2}
})
minetest.register_node("skytest:septuple_compressed_"..name.."_4782969c", {
    description = "septuple compressed "..name.." 4,782,969c",
    tiles = {""..data.tex.."^[colorize:black:190"},
    groups = {cracky = 2}
})
minetest.register_node("skytest:octuple_compressed_"..name.."_43046721c", {
    description = "octuple compressed "..name.." 43,046,721c",
    tiles = {""..data.tex.."^[colorize:black:210"},
    drawtype = "nodebox",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3},
	node_box = {
		type = "fixed",
		fixed = {
			-- top (Y+)
			{-0.0625, 0, -0.0625, 0.0625, 0.0625, 0.0625},
			{-0.125, 0.0625, -0.125, 0.125, 0.125, -0.0625},
			{-0.125, 0.0625, 0.0625, 0.125, 0.125, 0.125},
			{0.0625, 0.0625, -0.0625, 0.125, 0.125, 0.0625},
			{-0.125, 0.0625, -0.0625, -0.0625, 0.125, 0.0625},
			{0.125, 0.125, -0.1875, 0.1875, 0.1875, 0.1875},
			{-0.1875, 0.125, -0.1875, -0.125, 0.1875, 0.1875},
			{-0.125, 0.125, 0.125, 0.125, 0.1875, 0.1875},
			{-0.125, 0.125, -0.1875, 0.125, 0.1875, -0.125},
			{-0.25, 0.1875, 0.1875, 0.25, 0.25, 0.25},
			{-0.25, 0.1875, -0.25, 0.25, 0.25, -0.1875},
			{0.1875, 0.1875, -0.1875, 0.25, 0.25, 0.1875},
			{-0.25, 0.1875, -0.1875, -0.1875, 0.25, 0.1875},
			{-0.3125, 0.25, -0.3125, -0.25, 0.3125, 0.3125},
			{0.25, 0.25, -0.3125, 0.3125, 0.3125, 0.3125},
			{-0.25, 0.25, -0.3125, 0.25, 0.3125, -0.25},
			{-0.25, 0.25, 0.25, 0.25, 0.3125, 0.3125},
			{-0.375, 0.3125, 0.3125, 0.375, 0.375, 0.375},
			{-0.375, 0.3125, -0.375, 0.375, 0.375, -0.3125},
			{0.3125, 0.3125, -0.3125, 0.375, 0.375, 0.3125},
			{-0.375, 0.3125, -0.3125, -0.3125, 0.375, 0.3125},
			{-0.4375, 0.375, -0.4375, -0.375, 0.4375, 0.4375},
			{0.375, 0.375, -0.4375, 0.4375, 0.4375, 0.4375},
			{-0.4375, 0.375, 0.375, 0.4375, 0.4375, 0.4375},
			{-0.375, 0.375, -0.4375, 0.375, 0.4375, -0.375},
			-- bottom (Y-)
			{-0.0625, -0.0625, -0.0625, 0.0625, -0, 0.0625},
			{0.0625, -0.125, -0.125, 0.125, -0.0625, 0.125},
			{-0.125, -0.125, -0.125, -0.0625, -0.0625, 0.125},
			{-0.0625, -0.125, -0.125, 0.0625, -0.0625, -0.0625},
			{-0.0625, -0.125, 0.0625, 0.0625, -0.0625, 0.125},
			{-0.1875, -0.1875, -0.1875, 0.1875, -0.125, -0.125},
			{-0.1875, -0.1875, 0.125, 0.1875, -0.125, 0.1875},
			{-0.1875, -0.1875, -0.125, -0.125, -0.125, 0.125},
			{0.125, -0.1875, -0.125, 0.1875, -0.125, 0.125},
			{-0.25, -0.25, -0.25, -0.1875, -0.1875, 0.25},
			{0.1875, -0.25, -0.25, 0.25, -0.1875, 0.25},
			{-0.1875, -0.25, -0.25, 0.1875, -0.1875, -0.1875},
			{-0.1875, -0.25, 0.1875, 0.1875, -0.1875, 0.25},
			{-0.3125, -0.3125, 0.25, 0.3125, -0.25, 0.3125},
			{-0.3125, -0.3125, -0.3125, 0.3125, -0.25, -0.25},
			{0.25, -0.3125, -0.25, 0.3125, -0.25, 0.25},
			{-0.3125, -0.3125, -0.25, -0.25, -0.25, 0.25},
			{-0.375, -0.375, -0.375, -0.3125, -0.3125, 0.375},
			{0.3125, -0.375, -0.375, 0.375, -0.3125, 0.375},
			{-0.3125, -0.375, -0.375, 0.3125, -0.3125, -0.3125},
			{-0.3125, -0.375, 0.3125, 0.3125, -0.3125, 0.375},
			{-0.4375, -0.4375, 0.375, 0.4375, -0.375, 0.4375},
			{-0.4375, -0.4375, -0.4375, 0.4375, -0.375, -0.375},
			{-0.4375, -0.4375, -0.4375, -0.375, -0.375, 0.4375},
			{0.375, -0.4375, -0.375, 0.4375, -0.375, 0.375},
			-- right (X+)
			{0, -0.0625, -0.0625, 0.0625, 0.0625, 0.0625},
			{0.0625, -0.125, -0.125, 0.125, 0.125, -0.0625},
			{0.0625, -0.125, 0.0625, 0.125, 0.125, 0.125},
			{0.0625, -0.125, -0.0625, 0.125, -0.0625, 0.0625},
			{0.0625, 0.0625, -0.0625, 0.125, 0.125, 0.0625},
			{0.125, -0.1875, -0.1875, 0.1875, -0.125, 0.1875},
			{0.125, 0.125, -0.1875, 0.1875, 0.1875, 0.1875},
			{0.125, -0.125, 0.125, 0.1875, 0.125, 0.1875},
			{0.125, -0.125, -0.1875, 0.1875, 0.125, -0.125},
			{0.1875, -0.25, 0.1875, 0.25, 0.25, 0.25},
			{0.1875, -0.25, -0.25, 0.25, 0.25, -0.1875},
			{0.1875, -0.25, -0.1875, 0.25, -0.1875, 0.1875},
			{0.1875, 0.1875, -0.1875, 0.25, 0.25, 0.1875},
			{0.25, 0.25, -0.3125, 0.3125, 0.3125, 0.3125},
			{0.25, -0.3125, -0.3125, 0.3125, -0.25, 0.3125},
			{0.25, -0.25, -0.3125, 0.3125, 0.25, -0.25},
			{0.25, -0.25, 0.25, 0.3125, 0.25, 0.3125},
			{0.3125, -0.375, 0.3125, 0.375, 0.375, 0.375},
			{0.3125, -0.375, -0.375, 0.375, 0.375, -0.3125},
			{0.3125, -0.375, -0.3125, 0.375, -0.3125, 0.3125},
			{0.3125, 0.3125, -0.3125, 0.375, 0.375, 0.3125},
			{0.375, 0.375, -0.4375, 0.4375, 0.4375, 0.4375},
			{0.375, -0.4375, -0.4375, 0.4375, -0.375, 0.4375},
			{0.375, -0.4375, 0.375, 0.4375, 0.4375, 0.4375},
			{0.375, -0.375, -0.4375, 0.4375, 0.375, -0.375},
			-- left (X-)
			{-0.0625, -0.0625, -0.0625, -0, 0.0625, 0.0625},
			{-0.125, -0.125, 0.0625, -0.0625, 0.125, 0.125},
			{-0.125, -0.125, -0.125, -0.0625, 0.125, -0.0625},
			{-0.125, -0.125, -0.0625, -0.0625, -0.0625, 0.0625},
			{-0.125, 0.0625, -0.0625, -0.0625, 0.125, 0.0625},
			{-0.1875, -0.1875, -0.1875, -0.125, -0.125, 0.1875},
			{-0.1875, 0.125, -0.1875, -0.125, 0.1875, 0.1875},
			{-0.1875, -0.125, -0.1875, -0.125, 0.125, -0.125},
			{-0.1875, -0.125, 0.125, -0.125, 0.125, 0.1875},
			{-0.25, -0.25, -0.25, -0.1875, 0.25, -0.1875},
			{-0.25, -0.25, 0.1875, -0.1875, 0.25, 0.25},
			{-0.25, -0.25, -0.1875, -0.1875, -0.1875, 0.1875},
			{-0.25, 0.1875, -0.1875, -0.1875, 0.25, 0.1875},
			{-0.3125, 0.25, -0.3125, -0.25, 0.3125, 0.3125},
			{-0.3125, -0.3125, -0.3125, -0.25, -0.25, 0.3125},
			{-0.3125, -0.25, 0.25, -0.25, 0.25, 0.3125},
			{-0.3125, -0.25, -0.3125, -0.25, 0.25, -0.25},
			{-0.375, -0.375, -0.375, -0.3125, 0.375, -0.3125},
			{-0.375, -0.375, 0.3125, -0.3125, 0.375, 0.375},
			{-0.375, -0.375, -0.3125, -0.3125, -0.3125, 0.3125},
			{-0.375, 0.3125, -0.3125, -0.3125, 0.375, 0.3125},
			{-0.4375, 0.375, -0.4375, -0.375, 0.4375, 0.4375},
			{-0.4375, -0.4375, -0.4375, -0.375, -0.375, 0.4375},
			{-0.4375, -0.4375, -0.4375, -0.375, 0.4375, -0.375},
			{-0.4375, -0.375, 0.375, -0.375, 0.375, 0.4375},
			-- back (Z+)
			{-0.0625, -0.0625, 0, 0.0625, 0.0625, 0.0625},
			{0.0625, -0.125, 0.0625, 0.125, 0.125, 0.125},
			{-0.125, -0.125, 0.0625, -0.0625, 0.125, 0.125},
			{-0.0625, -0.125, 0.0625, 0.0625, -0.0625, 0.125},
			{-0.0625, 0.0625, 0.0625, 0.0625, 0.125, 0.125},
			{-0.1875, -0.1875, 0.125, 0.1875, -0.125, 0.1875},
			{-0.1875, 0.125, 0.125, 0.1875, 0.1875, 0.1875},
			{-0.1875, -0.125, 0.125, -0.125, 0.125, 0.1875},
			{0.125, -0.125, 0.125, 0.1875, 0.125, 0.1875},
			{-0.25, -0.25, 0.1875, -0.1875, 0.25, 0.25},
			{0.1875, -0.25, 0.1875, 0.25, 0.25, 0.25},
			{-0.1875, -0.25, 0.1875, 0.1875, -0.1875, 0.25},
			{-0.1875, 0.1875, 0.1875, 0.1875, 0.25, 0.25},
			{-0.3125, 0.25, 0.25, 0.3125, 0.3125, 0.3125},
			{-0.3125, -0.3125, 0.25, 0.3125, -0.25, 0.3125},
			{0.25, -0.25, 0.25, 0.3125, 0.25, 0.3125},
			{-0.3125, -0.25, 0.25, -0.25, 0.25, 0.3125},
			{-0.375, -0.375, 0.3125, -0.3125, 0.375, 0.375},
			{0.3125, -0.375, 0.3125, 0.375, 0.375, 0.375},
			{-0.3125, -0.375, 0.3125, 0.3125, -0.3125, 0.375},
			{-0.3125, 0.3125, 0.3125, 0.3125, 0.375, 0.375},
			{-0.4375, 0.375, 0.375, 0.4375, 0.4375, 0.4375},
			{-0.4375, -0.4375, 0.375, 0.4375, -0.375, 0.4375},
			{-0.4375, -0.4375, 0.375, -0.375, 0.4375, 0.4375},
			{0.375, -0.375, 0.375, 0.4375, 0.375, 0.4375},
			-- front (Z-)
			{-0.0625, -0.0625, -0.0625, 0.0625, 0.0625, -0},
			{-0.125, -0.125, -0.125, -0.0625, 0.125, -0.0625},
			{0.0625, -0.125, -0.125, 0.125, 0.125, -0.0625},
			{-0.0625, -0.125, -0.125, 0.0625, -0.0625, -0.0625},
			{-0.0625, 0.0625, -0.125, 0.0625, 0.125, -0.0625},
			{-0.1875, -0.1875, -0.1875, 0.1875, -0.125, -0.125},
			{-0.1875, 0.125, -0.1875, 0.1875, 0.1875, -0.125},
			{0.125, -0.125, -0.1875, 0.1875, 0.125, -0.125},
			{-0.1875, -0.125, -0.1875, -0.125, 0.125, -0.125},
			{0.1875, -0.25, -0.25, 0.25, 0.25, -0.1875},
			{-0.25, -0.25, -0.25, -0.1875, 0.25, -0.1875},
			{-0.1875, -0.25, -0.25, 0.1875, -0.1875, -0.1875},
			{-0.1875, 0.1875, -0.25, 0.1875, 0.25, -0.1875},
			{-0.3125, 0.25, -0.3125, 0.3125, 0.3125, -0.25},
			{-0.3125, -0.3125, -0.3125, 0.3125, -0.25, -0.25},
			{-0.3125, -0.25, -0.3125, -0.25, 0.25, -0.25},
			{0.25, -0.25, -0.3125, 0.3125, 0.25, -0.25},
			{0.3125, -0.375, -0.375, 0.375, 0.375, -0.3125},
			{-0.375, -0.375, -0.375, -0.3125, 0.375, -0.3125},
			{-0.3125, -0.375, -0.375, 0.3125, -0.3125, -0.3125},
			{-0.3125, 0.3125, -0.375, 0.3125, 0.375, -0.3125},
			{-0.4375, 0.375, -0.4375, 0.4375, 0.4375, -0.375},
			{-0.4375, -0.4375, -0.4375, 0.4375, -0.375, -0.375},
			{0.375, -0.4375, -0.4375, 0.4375, 0.4375, -0.375},
			{-0.4375, -0.375, -0.4375, -0.375, 0.375, -0.375},
			-- corner frame
			{-0.4375, 0.4375, 0.4375, 0.4375, 0.5, 0.5},
			{-0.4375, -0.5, 0.4375, 0.4375, -0.4375, 0.5},
			{-0.5, -0.5, 0.4375, -0.4375, 0.5, 0.5},
			{0.4375, -0.5, 0.4375, 0.5, 0.5, 0.5},
			{-0.5, 0.4375, -0.4375, -0.4375, 0.5, 0.4375},
			{-0.5, -0.5, -0.4375, -0.4375, -0.4375, 0.4375},
			{0.4375, 0.4375, -0.4375, 0.5, 0.5, 0.4375},
			{0.4375, -0.5, -0.4375, 0.5, -0.4375, 0.4375},
			{-0.5, 0.4375, -0.5, 0.5, 0.5, -0.4375},
			{-0.5, -0.5, -0.5, 0.5, -0.4375, -0.4375},
			{0.4375, -0.4375, -0.5, 0.5, 0.4375, -0.4375},
			{-0.5, -0.4375, -0.5, -0.4375, 0.4375, -0.4375},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	},
})


minetest.register_craft({
    output = "skytest:compressed_"..name.."_9c",
    recipe = {
        {data.mat,      data.mat,           data.mat    },
            {data.mat,      data.mat,    data.mat    },
            {data.mat, data.mat, data.mat },
}
})

minetest.register_craft({
    output = "skytest:double_compressed_"..name.."_81c",
    recipe = {
        {"skytest:compressed_"..name.."_9c","skytest:compressed_"..name.."_9c","skytest:compressed_"..name.."_9c"},
{"skytest:compressed_"..name.."_9c","skytest:compressed_"..name.."_9c","skytest:compressed_"..name.."_9c"},
{"skytest:compressed_"..name.."_9c","skytest:compressed_"..name.."_9c","skytest:compressed_"..name.."_9c"},
}
})

minetest.register_craft({
    output = "skytest:triple_compressed_"..name.."_729c",
    recipe = {
        {"skytest:double_compressed_"..name.."_81c","skytest:double_compressed_"..name.."_81c","skytest:double_compressed_"..name.."_81c"},
{"skytest:double_compressed_"..name.."_81c","skytest:double_compressed_"..name.."_81c","skytest:double_compressed_"..name.."_81c"},
{"skytest:double_compressed_"..name.."_81c","skytest:double_compressed_"..name.."_81c","skytest:double_compressed_"..name.."_81c"},
}
})

minetest.register_craft({
    output = "skytest:quadruple_compressed_"..name.."_6561c",
    recipe = {
        {"skytest:triple_compressed_"..name.."_729c", "skytest:triple_compressed_"..name.."_729c", "skytest:triple_compressed_"..name.."_729c"},
        {"skytest:triple_compressed_"..name.."_729c", "skytest:triple_compressed_"..name.."_729c", "skytest:triple_compressed_"..name.."_729c"},
        {"skytest:triple_compressed_"..name.."_729c", "skytest:triple_compressed_"..name.."_729c", "skytest:triple_compressed_"..name.."_729c"},
    }
})
minetest.register_craft({
    output = "skytest:quintuple_compressed_"..name.."_59049c",
    recipe = {
        {"skytest:quadruple_compressed_"..name.."_6561c","skytest:quadruple_compressed_"..name.."_6561c","skytest:quadruple_compressed_"..name.."_6561c"},
            {"skytest:quadruple_compressed_"..name.."_6561c","skytest:quadruple_compressed_"..name.."_6561c","skytest:quadruple_compressed_"..name.."_6561c"},
            {"skytest:quadruple_compressed_"..name.."_6561c","skytest:quadruple_compressed_"..name.."_6561c","skytest:quadruple_compressed_"..name.."_6561c"},
}
})
minetest.register_craft({
    output = "skytest:sextuple_compressed_"..name.."_531441c",
    recipe = {
        {"skytest:quintuple_compressed_"..name.."_59049c","skytest:quintuple_compressed_"..name.."_59049c","skytest:quintuple_compressed_"..name.."_59049c"},
            {"skytest:quintuple_compressed_"..name.."_59049c","skytest:quintuple_compressed_"..name.."_59049c","skytest:quintuple_compressed_"..name.."_59049c"},
            {"skytest:quintuple_compressed_"..name.."_59049c","skytest:quintuple_compressed_"..name.."_59049c","skytest:quintuple_compressed_"..name.."_59049c"},
}
})
minetest.register_craft({
    output = "skytest:septuple_compressed_"..name.."_4782969c",
    recipe = {
        {"skytest:sextuple_compressed_"..name.."_531441c","skytest:sextuple_compressed_"..name.."_531441c","skytest:sextuple_compressed_"..name.."_531441c"},
            {"skytest:sextuple_compressed_"..name.."_531441c","skytest:sextuple_compressed_"..name.."_531441c","skytest:sextuple_compressed_"..name.."_531441c"},
            {"skytest:sextuple_compressed_"..name.."_531441c","skytest:sextuple_compressed_"..name.."_531441c","skytest:sextuple_compressed_"..name.."_531441c"},
}
})
minetest.register_craft({
    output = "skytest:octuple_compressed_"..name.."_43046721c",
    recipe = {
        {"skytest:septuple_compressed_"..name.."_4782969c","skytest:septuple_compressed_"..name.."_4782969c","skytest:septuple_compressed_"..name.."_4782969c"},
            {"skytest:septuple_compressed_"..name.."_4782969c","skytest:septuple_compressed_"..name.."_4782969c","skytest:septuple_compressed_"..name.."_4782969c"},
            {"skytest:septuple_compressed_"..name.."_4782969c","skytest:septuple_compressed_"..name.."_4782969c","skytest:septuple_compressed_"..name.."_4782969c"},
}
})
--uncompressed "..name.."
minetest.register_craft({
    output = ""..data.mat.." 9",
    recipe = {
        {"skytest:compressed_"..name.."_9c","",""},
            {"","",""},
            {"","",""},
}
})
minetest.register_craft({
    output = "skytest:compressed_"..name.."_9c 9",
    recipe = {
        {"skytest:double_compressed_"..name.."_81c","",""},
            {"","",""},
            {"","",""},
}
})
minetest.register_craft({
    output = "skytest:double_compressed_"..name.."_81c 9",
    recipe = {
        {"skytest:triple_compressed_"..name.."_729c","",""},
            {"","",""},
            {"","",""},
}
})
minetest.register_craft({
    output = "skytest:triple_compressed_"..name.."_729c 9",
    recipe = {
        {"skytest:quadruple_compressed_"..name.."_6561c","",""},
            {"","",""},
            {"","",""},
}
})
minetest.register_craft({
    output = "skytest:quadruple_compressed_"..name.."_6561c 9",
    recipe = {
        {"skytest:quintuple_compressed_"..name.."_59049c","",""},
            {"","",""},
            {"","",""},
}
})
minetest.register_craft({
    output = "skytest:quintuple_compressed_"..name.."_59049c 9",
    recipe = {
        {"skytest:sextuple_compressed_"..name.."_531441c","",""},
            {"","",""},
            {"","",""},
}
})
minetest.register_craft({
    output = "skytest:sextuple_compressed_"..name.."_531441c 9",
    recipe = {
        {"skytest:septuple_compressed_"..name.."_4782969c","",""},
            {"","",""},
            {"","",""},
}
})
minetest.register_craft({
    output = "skytest:septuple_compressed_"..name.."_4782969c 9",
    recipe = {
        {"skytest:octuple_compressed_"..name.."_43046721c","",""},
            {"","",""},
            {"","",""},
}
})





end

--compressed cobble nodes
minetest.register_node("skytest:compressed_cobblestone_9c", {
    description = "compressed cobblestone 9c\nEMC = 9",
    tiles = {"cc_node_01.png"},
    groups = {cracky = 2},
	emc = 9
})

minetest.register_node("skytest:double_compressed_cobblestone_81c", {
    description = "double compressed cobblestone 81c\nEMC = 81",
    tiles = {"cc_node_02.png"},
    groups = {cracky = 2},
	emc = 81
})


minetest.register_node("skytest:triple_compressed_cobblestone_729c", {
    description = "triple compressed cobblestone 729c\nEMC = 729",
    tiles = {"cc_node_03.png"},
    groups = {cracky = 2},
	emc = 729
})

minetest.register_node("skytest:quadruple_compressed_cobblestone_6561c", {
    description = "quadruple compressed cobblestone 6561c\nEMC = 6561",
    tiles = {"cc_node_04.png"},
    groups = {cracky = 2},
	emc = 6561
})
minetest.register_node("skytest:quintuple_compressed_cobblestone_59049c", {
    description = "quintuple compressed cobblestone 59,049c\nEMC = 59,049",
    tiles       = {"cc_node_05.png"},
    groups      = {cracky = 2},
	emc = 59049
})
minetest.register_node("skytest:sextuple_compressed_cobblestone_531441c", {
    description = "sextuple compressed cobblestone 531,441c\nEMC = 531,441",
    tiles = {"cc_node_06.png"},
    groups = {cracky = 2},
	emc = 531441
})
minetest.register_node("skytest:septuple_compressed_cobblestone_4782969c", {
    description = "septuple compressed cobblestone 4,782,969c\nEMC = 4,782,969",
    tiles = {"cc_node_07.png"},
    groups = {cracky = 2},
	emc = 4782969
})
minetest.register_craft({
    output = "skytest:compressed_cobblestone_9c",
    recipe = {
        {"default:cobble","default:cobble","default:cobble"},
            {"default:cobble","default:cobble","default:cobble"},
            {"default:cobble","default:cobble","default:cobble"},
}
})

minetest.register_craft({
    output = "skytest:double_compressed_cobblestone_81c",
    recipe = {
        {"skytest:compressed_cobblestone_9c","skytest:compressed_cobblestone_9c","skytest:compressed_cobblestone_9c"},
{"skytest:compressed_cobblestone_9c","skytest:compressed_cobblestone_9c","skytest:compressed_cobblestone_9c"},
{"skytest:compressed_cobblestone_9c","skytest:compressed_cobblestone_9c","skytest:compressed_cobblestone_9c"},
}
})

minetest.register_craft({
    output = "skytest:triple_compressed_cobblestone_729c",
    recipe = {
        {"skytest:double_compressed_cobblestone_81c","skytest:double_compressed_cobblestone_81c","skytest:double_compressed_cobblestone_81c"},
{"skytest:double_compressed_cobblestone_81c","skytest:double_compressed_cobblestone_81c","skytest:double_compressed_cobblestone_81c"},
{"skytest:double_compressed_cobblestone_81c","skytest:double_compressed_cobblestone_81c","skytest:double_compressed_cobblestone_81c"},
}
})

minetest.register_craft({
    output = "skytest:quadruple_compressed_cobblestone_6561c",
    recipe = {
        {"skytest:triple_compressed_cobblestone_729c", "skytest:triple_compressed_cobblestone_729c", "skytest:triple_compressed_cobblestone_729c"},
        {"skytest:triple_compressed_cobblestone_729c", "skytest:triple_compressed_cobblestone_729c", "skytest:triple_compressed_cobblestone_729c"},
        {"skytest:triple_compressed_cobblestone_729c", "skytest:triple_compressed_cobblestone_729c", "skytest:triple_compressed_cobblestone_729c"},
    }
})
minetest.register_craft({
    output = "skytest:quintuple_compressed_cobblestone_59049c",
    recipe = {
        {"skytest:quadruple_compressed_cobblestone_6561c","skytest:quadruple_compressed_cobblestone_6561c","skytest:quadruple_compressed_cobblestone_6561c"},
            {"skytest:quadruple_compressed_cobblestone_6561c","skytest:quadruple_compressed_cobblestone_6561c","skytest:quadruple_compressed_cobblestone_6561c"},
            {"skytest:quadruple_compressed_cobblestone_6561c","skytest:quadruple_compressed_cobblestone_6561c","skytest:quadruple_compressed_cobblestone_6561c"},
}
})
minetest.register_craft({
    output = "skytest:sextuple_compressed_cobblestone_531441c",
    recipe = {
        {"skytest:quintuple_compressed_cobblestone_59049c","skytest:quintuple_compressed_cobblestone_59049c","skytest:quintuple_compressed_cobblestone_59049c"},
            {"skytest:quintuple_compressed_cobblestone_59049c","skytest:quintuple_compressed_cobblestone_59049c","skytest:quintuple_compressed_cobblestone_59049c"},
            {"skytest:quintuple_compressed_cobblestone_59049c","skytest:quintuple_compressed_cobblestone_59049c","skytest:quintuple_compressed_cobblestone_59049c"},
}
})
minetest.register_craft({
    output = "skytest:septuple_compressed_cobblestone_4782969c",
    recipe = {
        {"skytest:sextuple_compressed_cobblestone_531441c","skytest:sextuple_compressed_cobblestone_531441c","skytest:sextuple_compressed_cobblestone_531441c"},
            {"skytest:sextuple_compressed_cobblestone_531441c","skytest:sextuple_compressed_cobblestone_531441c","skytest:sextuple_compressed_cobblestone_531441c"},
            {"skytest:sextuple_compressed_cobblestone_531441c","skytest:sextuple_compressed_cobblestone_531441c","skytest:sextuple_compressed_cobblestone_531441c"},
}
})
minetest.register_craft({
    output = "skytest:octuple_compressed_cobblestone_43046721c",
    recipe = {
        {"skytest:septuple_compressed_cobblestone_4782969c","skytest:septuple_compressed_cobblestone_4782969c","skytest:septuple_compressed_cobblestone_4782969c"},
            {"skytest:septuple_compressed_cobblestone_4782969c","skytest:septuple_compressed_cobblestone_4782969c","skytest:septuple_compressed_cobblestone_4782969c"},
            {"skytest:septuple_compressed_cobblestone_4782969c","skytest:septuple_compressed_cobblestone_4782969c","skytest:septuple_compressed_cobblestone_4782969c"},
}
})
--uncompressed cobblestone
minetest.register_craft({
    output = "default:cobble 9",
    recipe = {
        {"skytest:compressed_cobblestone_9c","",""},
            {"","",""},
            {"","",""},
}
})
minetest.register_craft({
    output = "skytest:compressed_cobblestone_9c 9",
    recipe = {
        {"skytest:double_compressed_cobblestone_81c","",""},
            {"","",""},
            {"","",""},
}
})
minetest.register_craft({
    output = "skytest:double_compressed_cobblestone_81c 9",
    recipe = {
        {"skytest:triple_compressed_cobblestone_729c","",""},
            {"","",""},
            {"","",""},
}
})
minetest.register_craft({
    output = "skytest:triple_compressed_cobblestone_729c 9",
    recipe = {
        {"skytest:quadruple_compressed_cobblestone_6561c","",""},
            {"","",""},
            {"","",""},
}
})
minetest.register_craft({
    output = "skytest:quadruple_compressed_cobblestone_6561c 9",
    recipe = {
        {"skytest:quintuple_compressed_cobblestone_59049c","",""},
            {"","",""},
            {"","",""},
}
})
minetest.register_craft({
    output = "skytest:quintuple_compressed_cobblestone_59049c 9",
    recipe = {
        {"skytest:sextuple_compressed_cobblestone_531441c","",""},
            {"","",""},
            {"","",""},
}
})
minetest.register_craft({
    output = "skytest:sextuple_compressed_cobblestone_531441c 9",
    recipe = {
        {"skytest:septuple_compressed_cobblestone_4782969c","",""},
            {"","",""},
            {"","",""},
}
})
minetest.register_craft({
    output = "skytest:septuple_compressed_cobblestone_4782969c 9",
    recipe = {
        {"skytest:octuple_compressed_cobblestone_43046721c","",""},
            {"","",""},
            {"","",""},
}
})
minetest.register_craft({
    output = "skytest:bedrockium_ingot",
    recipe = {
        {"default:mese","skytest:octuple_compressed_cobblestone_43046721c","default:mese"},
{"skytest:octuple_compressed_cobblestone_43046721c","","skytest:octuple_compressed_cobblestone_43046721c"},
            {"default:mese","skytest:octuple_compressed_cobblestone_43046721c","default:mese"},
}
})


minetest.register_craft({
    output = "default:obsidian 100000",
    recipe = {
        {"skytest:bedrockium_ingot","",""},
            {"","",""},
            {"","",""},
}
})

minetest.register_craftitem("skytest:bedrockium_ingot", {
    description = "Bedrockium ingot\nEMC = 172,202,112",
    inventory_image = "bedrockium_ingot.png",
    stack_max = 9,
	emc = 172202112
})
for name, data in pairs({
    untonium = {
    mat = "skytest:bedrockium_ingot",
	tex = "^[colorize:white:80",
    },
	    duotonium = {
    mat = "skytest:untonium_ingot",
	tex = "^[colorize:white:40",
    },
	    tretonium = {
    mat = "skytest:duotonium_ingot",
	tex = "^[colorize:black:0",
    },   
	quatonium = {
    mat = "skytest:tretonium_ingot",
	tex = "^[colorize:black:20",
    },    
	quintonium = {
    mat = "skytest:quatonium_ingot",
	tex = "^[colorize:black:50",
    },
	sextonium = {
    mat = "skytest:quintonium_ingot",
	tex = "^[colorize:black:70",
    },
	septonium = {
    mat = "skytest:sextonium_ingot",
	tex = "^[colorize:black:90",
    },    
	octonium = {
    mat = "skytest:septonium_ingot",
	tex = "^[colorize:black:120",
    },
}) do
minetest.register_craftitem("skytest:"..name.."_ingot", {
    description = name.." ingot",
    inventory_image = "brick.png"..data.tex,
    stack_max = 1,
})
minetest.register_craft({
        output = "skytest:"..name.."_ingot",
        recipe = {
            {data.mat,"",""},
            {data.mat,"",""},
			{"","",""}
        }
    })
end
minetest.register_craft({
        output = "skytest:neptonium_ingot",
        recipe = {
            {"skytest:octonium_ingot","",""},
            {"skytest:octonium_ingot","",""},
			{"","",""}
        }
    })
minetest.register_craftitem("skytest:neptonium_ingot", {
    description = "Neptonium ingot",
    inventory_image = "neptonium_ingot.png",
    stack_max = 65534,
})
	minetest.register_craftitem("skytest:neptonium_nugget", {
	description = "Neptonium Nugget",
    inventory_image = "neptonium_nugget.png",
	stack_max = 65534,
	})
	minetest.register_craftitem("skytest:neptonium_crystal", {
	description = "Neptonium Crystal",
    inventory_image = "neptonium_crystal.png",
	stack_max = 65534,
	})
	minetest.register_craftitem("skytest:cosmic_ingot", {
    description = "Cosmic ingot",
    inventory_image = "cosmic_ingot.png",
    stack_max = 65534,
})
	minetest.register_craftitem("skytest:cosmic_drop", {
	description = "Cosmic Drop",
    inventory_image = "cosmic_drop.png",
	stack_max = 65534,
	})
	minetest.register_craftitem("skytest:cosmic_crystal", {
	description = "Cosmic Crystal",
    inventory_image = "cosmic_crystal.png",
	stack_max = 65534,
	})
	minetest.register_craftitem("skytest:spectral_ingot", {
	description = "Spectral Ingot",
    inventory_image = "spectral_ingot.png",
	stack_max = 65534,
	})
	minetest.register_craftitem("skytest:power_core", {
	description = "Power Core",
    inventory_image = "power_core.png",
	stack_max = 65534,
	})
	minetest.register_craftitem("skytest:star_fuel", {
	description = "Star Fuel\n can be used to smelt things for a LONG time",
    inventory_image = "starfuel.png",
	stack_max = 65534,
	})
	minetest.register_craft({
        output = "skytest:neptonium_nugget 9",
        recipe = {
            {"skytest:neptonium_ingot"},
        }
    })
		minetest.register_craft({
        output = "skytest:cosmic_drop 9",
        recipe = {
            {"skytest:cosmic_ingot"},
        }
    })
			minetest.register_craft({
        output = "skytest:cosmic_ingot",
        recipe = {
            {"skytest:cosmic_drop","skytest:cosmic_drop","skytest:cosmic_drop"},
			{"skytest:cosmic_drop","skytest:cosmic_drop","skytest:cosmic_drop"},
            {"skytest:cosmic_drop","skytest:cosmic_drop","skytest:cosmic_drop"},
        }
    })
	minetest.register_craft({
        output = "skytest:cosmic_ingot",
        recipe = {
            {"skytest:neptonium_ingot","skytest:spectral_block","skytest:neptonium_ingot"},
			{"skytest:spectral_block","skytest:neptonium_ingot","skytest:spectral_block"},
            {"skytest:neptonium_ingot","skytest:spectral_block","skytest:neptonium_ingot"},
        }
    })
	minetest.register_craft({
        output = "skytest:star_fuel",
        recipe = {
			{"skytest:neptonium_nugget","default:coalblock","skytest:neptonium_nugget"},
            {"default:coalblock","skytest:neptonium_nugget","default:coalblock"},
        }
    })
		minetest.register_craft({
        output = "skytest:neptonium_crystal",
        recipe = {
            {"skytest:spectral_ingot","skytest:neptonium_ingot","skytest:spectral_ingot"},
			{"skytest:neptonium_ingot","","skytest:neptonium_ingot"},
            {"skytest:spectral_ingot","skytest:neptonium_ingot","skytest:spectral_ingot"},
        }
    })
			minetest.register_craft({
        output = "skytest:cosmic_crystal",
        recipe = {
            {"skytest:power_core","skytest:cosmic_ingot","skytest:power_core"},
			{"skytest:cosmic_ingot","skytest:factory_full_set","skytest:cosmic_ingot"},
            {"skytest:power_core","skytest:cosmic_ingot","skytest:power_core"},
        }
    })
		minetest.register_craft({
        output = "skytest:spectral_ingot",
        recipe = {
            {"skytest:spectral_book","skytest:spectral_book","skytest:spectral_book"},
			{"skytest:spectral_book","skytest:neptonium_ingot","skytest:spectral_book"},
            {"skytest:spectral_book","skytest:spectral_book","skytest:spectral_book"},
        }
    })
			minetest.register_craft({
        output = "skytest:power_core",
        recipe = {
            {"","skytest:spectral_ingot",""},
			{"skytest:spectral_ingot","skytest:spectral_ingot","skytest:spectral_ingot"},
            {"","skytest:spectral_ingot",""},
        }
    })
		minetest.register_craft({
        output = "skytest:neptonium_ingot",
        recipe = {
            {"skytest:neptonium_nugget","skytest:neptonium_nugget","skytest:neptonium_nugget"},
			{"skytest:neptonium_nugget","skytest:neptonium_nugget","skytest:neptonium_nugget"},
            {"skytest:neptonium_nugget","skytest:neptonium_nugget","skytest:neptonium_nugget"},
        }
    })
			minetest.register_craft({
        output = "skytest:cosmic_carrots 6",
        recipe = {
            {"","",""},
			{"skytest:neptonium_nugget","farming_plus:carrot_item","skytest:neptonium_nugget"},
            {"farming_plus:carrot_item","skytest:neptonium_nugget","farming_plus:carrot_item"},
        }
    })
	minetest.register_craft({
	type = "fuel",
	recipe = "skytest:star_fuel",
	burntime = 30000000,
})
minetest.register_craftitem("skytest:cosmic_carrots", {
	description = "Cosmic Carrots",
    inventory_image = "carrot_gold.png^[colorize:black:220",
	on_use = minetest.item_eat(200,"skytest:cosmic_carrots_step_7"),
	stack_max = 65534,
	})
	for n = 1, 7 do
minetest.register_craftitem("skytest:cosmic_carrots_step_"..n, {
	description = "Cosmic Carrots Step "..n,
    inventory_image = "awards_level"..n..".png^carrot_gold.png^[colorize:black:220",
	stack_max = 65534/n,
	})
				minetest.register_craft({
        output = "skytest:cosmic_carrots_step_"..n,
        recipe = {
            {"skytest:cosmic_carrots_step_"..(n-1),"skytest:cosmic_carrots_step_"..(n-1),"skytest:cosmic_carrots_step_"..(n-1)},
            {"skytest:cosmic_carrots_step_"..(n-1),"skytest:cosmic_carrots_step_"..(n-1),"skytest:cosmic_carrots_step_"..(n-1)},
            {"skytest:cosmic_carrots_step_"..(n-1),"skytest:cosmic_carrots_step_"..(n-1),"skytest:cosmic_carrots_step_"..(n-1)},
        }
    })
end
minetest.register_craft({
        output = "skytest:cosmic_carrots_step_1",
        recipe = {
            {"skytest:cosmic_carrots","skytest:cosmic_carrots","skytest:cosmic_carrots"},
            {"skytest:cosmic_carrots","skytest:cosmic_carrots","skytest:cosmic_carrots"},
            {"skytest:cosmic_carrots","skytest:cosmic_carrots","skytest:cosmic_carrots"},
			}
    })
	minetest.register_craftitem("skytest:carrot_nebula", {
	description = "Carrot Nebula",
    inventory_image = "carrot_gold.png^[colorize:black:220",
	on_use = minetest.item_eat(200,"skytest:carrot_nebula"),
	stack_max = 1,
	})
					minetest.register_craft({
        output = "skytest:carrot_nebula",
        recipe = {
            {"skytest:cosmic_carrots_step_7","skytest:cosmic_carrots_step_7","skytest:cosmic_carrots_step_7"},
            {"skytest:cosmic_carrots_step_7","skytest:cosmic_carrots_step_7","skytest:cosmic_carrots_step_7"},
            {"skytest:cosmic_carrots_step_7","skytest:cosmic_carrots_step_7","skytest:cosmic_carrots_step_7"},
			}
    })