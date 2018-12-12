local HEXCODES = {
"FFFFFF",
"CCCCCC",
"999999",
"666666",
"333333",
"000000",
"FFCC00",
"FF9900",
"FF6600",
"FF3300",
"99CC00",
"CC9900",
"FFCC33",
"FFCC66",
"FF9966",
"FF6633",
"CC3300",
"CC0033",
"CCFF00",
"CCFF33",
"333300",
"666600",
"999900",
"CCCC00",
"FFFF00",
"CC9933",
"CC6633",
"330000",
"660000",
"990000",
"CC0000",
"FF0000",
"FF3366",
"FF0033",
"99FF00",
"CCFF66",
"99CC33",
"666633",
"999933",
"CCCC33",
"FFFF33",
"996600",
"993300",
"663333",
"993333",
"CC3333",
"FF3333",
"CC3366",
"FF6699",
"FF0066",
"66FF00",
"99FF66",
"66CC33",
"669900",
"999966",
"CCCC66",
"FFFF66",
"996633",
"663300",
"996666",
"CC6666",
"FF6666",
"990033",
"CC3399",
"FF66CC",
"FF0099",
"33FF00",
"66FF33",
"339900",
"66CC00",
"99FF33",
"CCCC99",
"FFFF99",
"CC9966",
"CC6600",
"CC9999",
"FF9999",
"FF3399",
"CC0066",
"990066",
"FF33CC",
"FF00CC",
"00CC00",
"33CC00",
"336600",
"669933",
"99CC66",
"CCFF99",
"FFFFCC",
"FFCC99",
"FF9933",
"FFCCCC",
"FF99CC",
"CC6699",
"993366",
"660033",
"CC0099",
"330033",
"33CC33",
"66CC66",
"00FF00",
"33FF33",
"66FF66",
"99FF99",
"CCFFCC",
"CC99CC",
"996699",
"993399",
"990099",
"663366",
"660066",
"006600",
"336633",
"009900",
"339933",
"669966",
"99CC99",
"FFCCFF",
"FF99FF",
"FF66FF",
"FF33FF",
"FF00FF",
"CC66CC",
"CC33CC",
"003300",
"00CC33",
"006633",
"339966",
"66CC99",
"99FFCC",
"CCFFFF",
"3399FF",
"99CCFF",
"CCCCFF",
"CC99FF",
"9966CC",
"663399",
"330066",
"9900CC",
"CC00CC",
"00FF33",
"33FF66",
"009933",
"00CC66",
"33FF99",
"99FFFF",
"99CCCC",
"0066CC",
"6699CC",
"9999FF",
"9999CC",
"9933FF",
"6600CC",
"660099",
"CC33FF",
"CC00FF",
"00FF66",
"66FF99",
"33CC66",
"009966",
"66FFFF",
"66CCCC",
"669999",
"003366",
"336699",
"6666FF",
"6666CC",
"666699",
"330099",
"9933CC",
"CC66FF",
"9900FF",
"00FF99",
"66FFCC",
"33CC99",
"33FFFF",
"33CCCC",
"339999",
"336666",
"006699",
"003399",
"3333FF",
"3333CC",
"333399",
"333366",
"6633CC",
"9966FF",
"6600FF",
"00FFCC",
"33FFCC",
"00FFFF",
"00CCCC",
"009999",
"006666",
"003333",
"3399CC",
"3366CC",
"0000FF",
"0000CC",
"000099",
"000066",
"000033",
"6633FF",
"3300FF",
"00CC99",
"0099CC",
"33CCFF",
"66CCFF",
"6699FF",
"3366FF",
"0033CC",
"3300CC",
"00CCFF",
"0099FF",
"0066FF",
"0033FF",
}

minetest.register_node("ntm_extension:base_color",{
description = "Base Block\ncan be dyed and chiseled in a ntm block thing",
tiles = {"ntm_extension_color.png"},
groups = {cracky = 3},
})
minetest.register_craft({
    output = "ntm_extension:base_color 32",
    recipe = {
            {"default:paper","default:paper","default:paper"},
            {"default:paper","node_texture_modifier:dye_mixture","default:paper"},
            {"default:paper","default:paper","default:paper"}
        }
})
minetest.register_craft({
    output = "ntm_extension:base_color 8",
    recipe = {
            {"group:leaves","group:leaves","group:leaves"},
            {"group:leaves","group:dye","group:leaves"},
            {"group:leaves","group:leaves","group:leaves"},
        }
})
minetest.register_craft({
    output = "ntm_extension:base_color 16",
    recipe = {
            {"group:leaves","group:leaves","group:leaves"},
            {"group:leaves","node_texture_modifier:dye_mixture","group:leaves"},
            {"group:leaves","group:leaves","group:leaves"},
        }
})

minetest.register_craft({
	output = 'node_texture_modifier:node_texture_modifier',
	recipe = {
		{'default:steel_ingot', 'default:chest', 'default:steel_ingot'},
		{'default:wood', 'default:mese_crystal', 'default:wood'},
		{'default:steel_ingot', 'default:wood', 'default:steel_ingot'},
	}
})
node_texture_modifier.add_dyed_node_too_type("ntm_extension:base_color", "color")
node_texture_modifier.add_dyed_node_too_type("default:steelblock", "steelblock")
node_texture_modifier.add_dyed_node_too_type("default:stone", "stone")
node_texture_modifier.add_dyed_node_too_type("default:stone_brick", "stone_brick")
node_texture_modifier.add_dyed_node_too_type("default:cobble", "cobble")
for number = 1, 216 do
local hex = HEXCODES[number]
--Register Stone
minetest.register_node("ntm_extension:"..hex.."_stone", {
description = hex.." Stone",
tiles = {"ntm_extension_stone.png^[colorize:#"..hex..":120"},
groups = {cracky = 3,not_in_creative_inventory = 1},
sounds = default.node_sound_stone_defaults()
})
--Register Stone Brick
minetest.register_node("ntm_extension:"..hex.."_stone_brick", {
description = hex.." Stone Brick",
tiles = {"ntm_extension_stone_brick.png^[colorize:#"..hex..":120"},
groups = {cracky = 3,not_in_creative_inventory = 1},
sounds = default.node_sound_stone_defaults()
})
--Register Steel Block
minetest.register_node("ntm_extension:"..hex.."_steel_block",{
description = hex.." Steel Block",
tiles = {"ntm_extension_steel_block.png^[colorize:#"..hex..":120"},
groups = {cracky = 3,not_in_creative_inventory = 1},
sounds = default.node_sound_stone_defaults()
})
minetest.register_node("ntm_extension:"..hex.."_cobble",{
description = hex.." Cobble",
tiles = {"ntm_extension_cobble.png^[colorize:#"..hex..":120"},
groups = {cracky = 3,not_in_creative_inventory = 1},
sounds = default.node_sound_stone_defaults()
})
minetest.register_node("ntm_extension:"..hex.."_color",{
description = hex.." Color Light",
tiles = {"ntm_extension_color.png^[colorize:#"..hex..":120"},
groups = {cracky = 3,not_in_creative_inventory = 1},
sounds = default.node_sound_stone_defaults()
})
minetest.register_node("ntm_extension:"..hex.."_color_2",{
description = hex.." Color Dark",
tiles = {"ntm_extension_color.png^[colorize:#"..hex..":220"},
groups = {cracky = 3,not_in_creative_inventory = 1},
sounds = default.node_sound_stone_defaults()
})
node_texture_modifier.add_dyed_node_too_type("ntm_extension:"..hex.."_steel_block", "steelblock")
node_texture_modifier.add_dyed_node_too_type("ntm_extension:"..hex.."_cobble", "cobble")
node_texture_modifier.add_dyed_node_too_type("ntm_extension:"..hex.."_stone_brick", "stone_brick")
node_texture_modifier.add_dyed_node_too_type("ntm_extension:"..hex.."_stone", "stone")
node_texture_modifier.add_dyed_node_too_type("ntm_extension:"..hex.."_color", "color")
node_texture_modifier.add_dyed_node_too_type("ntm_extension:"..hex.."_color_2", "color")
end

for name, data in pairs({
    ntm_extension_checker_stone_tile = {
chisel = "stone",
desc = "Checker Stone Tile",
},
    ntm_extension_circle_stone_bricks = {
chisel = "stone",
desc = "Checker Stone Tile",
},
ntm_extension_coal_stone = {
chisel = "stone",
desc = "Coal Stone",
},
    ntm_extension_coal_stone_bricks = {
chisel = "stone",
desc = "Coal Stone Bricks",
},
    ntm_extension_cobble_compressed = {
chisel = "cobble",
desc = "Tar 1",
},
    ntm_extension_dirt_compressed = {
chisel = "dirt",
desc = "Smashed Dirt",
},
    ntm_extension_green_bricks = {
chisel = "stone",
desc = "Green bricks",
},
    ntm_extension_grey_bricks = {
chisel = "stone",
desc = "Grey Bricks",
},
    ntm_extension_iron_stone = {
chisel = "stone",
desc = "Iron Stone",
},
    ntm_extension_iron_stone_bricks = {
chisel = "stone",
desc = "Iron Stone Bricks",
},
    ntm_extension_split_stone_tile = {
chisel = "stone",
desc = "Split Stone Tile",
},
    ntm_extension_split_stone_tile_top = {
chisel = "stone",
desc = "Split Stone Tile 2",
},
    ntm_extension_tar = {
chisel = "cobble",
desc = "Tar 2",
},
    ntm_extension_stone_tile = {
chisel = "stone",
desc = "Stone Tile",
},
}) do
minetest.register_node("ntm_extension:"..name, {
    description = data.desc.." ("..data.chisel..")",
	drawtype = "glasslike_framed_optional",
	tiles = {"framedglass_steel_frame.png",name..".png"},
	paramtype = "light",
	sunlight_propagates = true,
    groups = {crumbly = 3},
})
node_texture_modifier.add_node_too_type("ntm_extension:"..name, data.chisel)
end




minetest.register_node("ntm_extension:builder", {
description = "Sci-fi Node Builder",
tiles = {"scifi_nodes_builder.png"},
groups = {cracky=3}
})

minetest.register_node("ntm_extension:grassblk", {
description = "Dirt With Alien Grass",
tiles = {"default_grass.png^[colorize:cyan:80", "default_dirt.png",
{name = "default_dirt.png^(default_grass_side.png^[colorize:cyan:80)",
tileable_vertical = false}},
light_source = 2,
groups = {crumbly=1, oddly_breakable_by_hand=1, soil=1}
})

minetest.register_node("ntm_extension:light", {
description = "blue lightbox",
sunlight_propagates = false,
tiles = {
"scifi_nodes_lighttop.png",
"scifi_nodes_lighttop.png",
"scifi_nodes_light.png",
"scifi_nodes_light.png",
"scifi_nodes_light.png",
"scifi_nodes_light.png"
},
light_source = 10,
paramtype = "light",
groups = {cracky=1}
})

minetest.register_node("ntm_extension:rfloor", {
description = "rusty floor",
tiles = {
"scifi_nodes_rustfloor.png",
},
paramtype = "light",
paramtype2 = "facedir",
light_source = 10,
groups = {cracky=1}
})

minetest.register_node("ntm_extension:bfloor", {
description = "blue floor",
tiles = {
"scifi_nodes_bluefloor.png",
},
paramtype = "light",
paramtype2 = "facedir",
light_source = 10,
groups = {cracky=1}
})


minetest.register_node("ntm_extension:stripes2", {
description = "hazard stripes2",
sunlight_propagates = false,
tiles = {
"scifi_nodes_stripes2top.png",
"scifi_nodes_stripes2top.png",
"scifi_nodes_stripes2.png",
"scifi_nodes_stripes2.png",
"scifi_nodes_stripes2.png",
"scifi_nodes_stripes2.png"
},
paramtype = "light",
groups = {cracky=1}
})

minetest.register_node("ntm_extension:gblock", {
description = "Green metal block",
sunlight_propagates = false,
tiles = {
"scifi_nodes_gblock.png",
"scifi_nodes_gblock.png",
"scifi_nodes_gblock.png",
"scifi_nodes_gblock.png",
"scifi_nodes_gblock.png",
"scifi_nodes_gblock.png"
},
paramtype = "light",
groups = {cracky=1}
})

minetest.register_node("ntm_extension:gblock2", {
description = "Green metal block 2",
sunlight_propagates = false,
tiles = {
"scifi_nodes_gblock2_top.png",
"scifi_nodes_gblock.png",
"scifi_nodes_gblock2.png",
"scifi_nodes_gblock2_fx.png",
"scifi_nodes_gblock.png",
"scifi_nodes_gblock2_front1.png"
},
paramtype = "light",
paramtype2 = "facedir",
groups = {cracky=1}
})

minetest.register_node("ntm_extension:gblock3", {
description = "Green metal block 3",
sunlight_propagates = false,
tiles = {
"scifi_nodes_gblock2_top.png",
"scifi_nodes_gblock.png",
"scifi_nodes_gblock2.png",
"scifi_nodes_gblock2_fx.png",
"scifi_nodes_gblock.png",
"scifi_nodes_gblock2_screen.png"
},
paramtype = "light",
paramtype2 = "facedir",
groups = {cracky=1}
})



minetest.register_node("ntm_extension:green_light", {
description = "green lightbox",
sunlight_propagates = false,
tiles = {
"scifi_nodes_lighttop.png",
"scifi_nodes_lighttop.png",
"scifi_nodes_greenlight.png",
"scifi_nodes_greenlight.png",
"scifi_nodes_greenlight.png",
"scifi_nodes_greenlight.png"
},
light_source = 10,
paramtype = "light",
groups = {cracky=1}
})

minetest.register_node("ntm_extension:red_light", {
description = "red lightbox",
sunlight_propagates = false,
tiles = {
"scifi_nodes_lighttop.png",
"scifi_nodes_lighttop.png",
"scifi_nodes_redlight.png",
"scifi_nodes_redlight.png",
"scifi_nodes_redlight.png",
"scifi_nodes_redlight.png"
},
light_source = 10,
paramtype = "light",
groups = {cracky=1}
})

minetest.register_node("ntm_extension:discs", {
description = "disc shelves",
sunlight_propagates = false,
tiles = {
"scifi_nodes_box_top.png",
"scifi_nodes_box_top.png",
"scifi_nodes_discs.png",
"scifi_nodes_discs.png",
"scifi_nodes_discs.png",
"scifi_nodes_discs.png"
},
paramtype = "light",
groups = {cracky=1}
})

minetest.register_node("ntm_extension:disc", {
description = "disc",
drawtype = "torchlike",
sunlight_propagates = false,
tiles = {
"scifi_nodes_disc.png"
},
inventory_image = "scifi_nodes_disc.png",
wield_image = "scifi_nodes_disc.png",
paramtype = "light",
groups = {cracky=1}
})


minetest.register_node("ntm_extension:blink", {
description = "blinking light",
sunlight_propagates = false,
tiles = {{
name="scifi_nodes_lightbox.png",
animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.00},
}},
paramtype = "light",
groups = {cracky=1},
light_source = 5,
})

minetest.register_node("ntm_extension:black_lights", {
description = "black wallpanel",
sunlight_propagates = false,
tiles = {{
name="scifi_nodes_black_lights.png",
animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.50},
}},
paramtype = "light",
groups = {cracky=1},
})

minetest.register_node("ntm_extension:black_screen", {
description = "black wall screen",
sunlight_propagates = false,
tiles = {{
name="scifi_nodes_black_screen.png",
animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.00},
}},
paramtype = "light",
groups = {cracky=1},
light_source = 1,
})

minetest.register_node("ntm_extension:screen", {
description = "electronic screen",
sunlight_propagates = false,
tiles = {{
name="scifi_nodes_screen.png",
animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.50},
}},
paramtype = "light",
groups = {cracky=1},
light_source = 5,
})

minetest.register_node("ntm_extension:screen2", {
description = "electronic screen 2",
sunlight_propagates = false,
tiles = {{
name="scifi_nodes_screen2.png",
animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.50},
}},
paramtype = "light",
groups = {cracky=1},
light_source = 5,
})



minetest.register_node("ntm_extension:white_pad", {
description = "white keypad",
sunlight_propagates = false,
tiles = {
"scifi_nodes_white2.png",
"scifi_nodes_white2.png",
"scifi_nodes_white2.png",
"scifi_nodes_white2.png",
"scifi_nodes_white2.png",
"scifi_nodes_white_pad.png"
},
paramtype = "light",
paramtype2 = "facedir",
groups = {cracky=1}
})

minetest.register_node("ntm_extension:white_base", {
description = "white wall base",
sunlight_propagates = false,
tiles = {
"scifi_nodes_white2.png",
"scifi_nodes_white2.png",
"scifi_nodes_white_side.png",
"scifi_nodes_white_side.png",
"scifi_nodes_white_side.png",
"scifi_nodes_white_side.png"
},
paramtype = "light",
paramtype2 = "facedir",
groups = {cracky=1}
})

minetest.register_node("ntm_extension:grnpipe", {
description = "green pipe",
sunlight_propagates = false,
tiles = {
"scifi_nodes_greenpipe_front.png",
"scifi_nodes_greenpipe_front.png",
"scifi_nodes_greenpipe_top.png",
"scifi_nodes_greenpipe_top.png",
"scifi_nodes_greenpipe_top.png",
"scifi_nodes_greenpipe_top.png"
},
paramtype = "light",
paramtype2 = "facedir",
groups = {cracky=1},
on_place = minetest.rotate_node
})


minetest.register_node("ntm_extension:grnpipe2", {
description = "broken green pipe",
sunlight_propagates = false,
tiles = {
"scifi_nodes_greenpipe_front.png",
"scifi_nodes_greenpipe_front.png",
"scifi_nodes_greenpipe2_top.png",
"scifi_nodes_greenpipe2_top.png",
"scifi_nodes_greenpipe2_top.png",
"scifi_nodes_greenpipe2_top.png"
},
paramtype = "light",
paramtype2 = "facedir",
groups = {cracky=1},
on_place = minetest.rotate_node
})

minetest.register_node("ntm_extension:octrng", {
description = "Orange Octagon Glass",
sunlight_propagates = false,
drawtype = "glasslike",
tiles = {
"scifi_nodes_octrng.png",
},
paramtype = "light",
paramtype2 = "facedir",
use_texture_alpha = true,
light_source = 10,
groups = {cracky=2},
sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("ntm_extension:octgrn", {
description = "Green Octagon Glass",
sunlight_propagates = false,
drawtype = "glasslike",
tiles = {
"scifi_nodes_octgrn.png",
},
paramtype = "light",
paramtype2 = "facedir",
use_texture_alpha = true,
light_source = 10,
groups = {cracky=2},
sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("ntm_extension:octbl", {
description = "Blue Octagon Glass",
sunlight_propagates = false,
drawtype = "glasslike",
tiles = {
"scifi_nodes_octbl.png",
},
paramtype = "light",
paramtype2 = "facedir",
use_texture_alpha = true,
light_source = 10,
groups = {cracky=2},
sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("ntm_extension:octppl", {
description = "Purple Octagon Glass",
sunlight_propagates = false,
drawtype = "glasslike",
tiles = {
"scifi_nodes_octppl.png",
},
paramtype = "light",
paramtype2 = "facedir",
use_texture_alpha = true,
light_source = 10,
groups = {cracky=2},
sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("ntm_extension:tower", {
description = "Wind tower",
sunlight_propagates = false,
drawtype = "plantlike",
tiles = {{
name = "scifi_nodes_tower_anim.png",
animation = {type = "vertical_frames", aspect_w = 32, aspect_h = 32, length = 1.00},
}},
visual_scale = 2,
inventory_image = "scifi_nodes_tower.png",
paramtype = "light",
groups = {cracky=2},
})
local node = {}
-- This uses a trick: you can first define the recipes using all of the base
-- colors, and then some recipes using more specific colors for a few non-base
-- colors available. When crafting, the last recipes will be checked first.
--add new block using texture name(without "scifi_nodes_" prefix) then the description, and then the name of the block
node.types = {
{"blue",      "blue lines",        "blue"},
{"holes",       "metal with holes","holes"},
{"white2",      "plastic",         "white2"},
{"engine",      "engine",          "engine"},
{"wall",      "metal wall",        "wall"},
{"white",      "plastic wall",     "white"},
{"stripes2top",     "dirty metal block","metal2"},
{"rough",      "rough metal",      "rough"},
{"lighttop",      "metal block",      "metal"},
{"red",      "red lines",          "red"},
{"green",      "green lines",      "green"},
{"vent2",      "vent",              "vent"},
{"stripes",      "hazard stripes", "stripes"},
{"rust",      "rusty metal",       "rust"},
{"mesh",      "metal mesh",       "mesh"},
{"black",      "black wall",       "black"},
{"blackoct",      "black octagon",       "blackoct"},
{"blackpipe",      "black pipe",       "blackpipe"},
{"blacktile",      "black tile",       "blktl"},
{"blacktile2",      "black tile 2",       "blktl2"},
{"blackvent",      "black vent",       "blkvnt"},
{"bluebars",      "blue bars",       "bluebars"},
{"bluemetal",      "blue metal",       "blumtl"},
{"bluetile",      "blue tile",       "blutl"},
{"greytile",      "grey tile",       "grytl"},
{"mesh2",      "metal floormesh",       "mesh2"},
{"white",      "plastic wall",       "white"},
{"pipe",      "wall pipe",       "pipe2"},
{"pipeside",      "side pipe",       "pipe3"},
{"tile",      "white tile",       "tile"},
{"whiteoct",      "white octagon",       "whiteoct"},
{"whitetile",      "white tile2",       "whttl"},
{"black_detail",      "black detail",       "blckdtl"},
{"green_square",      "green metal block",       "grnblck"},
{"red_square",      "red metal block",       "redblck"},
{"grey_square",      "grey metal block",       "greyblck"},
{"blue_square",      "blue metal block",       "blublck"},
{"black_mesh",      "black vent block",       "blckmsh"},
{"dent",      "dented metal block",       "dent"},
{"greenmetal",      "green metal wall",       "grnmetl"},
{"greenmetal2",      "green metal wall2",       "grnmetl2"},
{"greenlights",      "green wall lights",       "grnlt", 10},
{"greenlights2",      "green wall lights2",       "grnlt2", 10},
{"greenbar",      "green light bar",       "grnlghtbr", 10},
{"green2",      "green wall panel",       "grn2"},
{"greentubes",      "green pipes",       "grntubes"},
{"grey",      "grey wall",       "gry"},
{"greybolts",      "grey wall bolts",       "gryblts"},
{"greybars",      "grey bars",       "grybrs"},
{"greydots",      "grey wall dots",       "grydts"},
{"greygreenbar",      "gray power pipe",       "grygrnbr", 10},
{"octofloor",      "Doom floor",       "octofloor"},
{"octofloor2",      "Brown Doom floor",       "octofloor2"},
{"doomwall1",      "Doom wall 1",       "doomwall1"},
{"doomwall2",      "Doom wall 2",       "doomwall2"},
{"doomwall3",      "Doom wall 3",       "doomwall3"},
{"doomwall4",      "Doom wall 4",       "doomwall4"},
{"doomwall41",      "Doom wall 4.1",       "doomwall4.1"},
{"doomwall42",      "Doom wall 4.2",       "doomwall4.2"},
{"doomwall43",      "Doom wall 4.3",       "doomwall4.3"},
{"doomwall431",      "Doom wall 4.3.1",       "doomwall4.3.1"},
{"doomwall44",      "Doom wall 4.4",       "doomwall4.4"},
{"blackdmg",      "Damaged black wall",       "blckdmg"},
{"blackdmgstripe",      "Damaged black wall(stripes)",       "blckdmgstripe"},
{"doomengine",      "Doom engine wall",       "doomengine"},
{"monitorwall",      "Wall monitors",       "monitorwall"},
{"screen3",      "Wall monitor",       "screen3"},
{"doomlight",      "Doom light",       "doomlight", 12},
{"bluwllight",      "Blue wall light", "capsule3", 20},
{"bluegrid",      "Blue Grid", "bluegrid", 5},
{"fan",      "Fan",       "fan"},
{"ppllght",      "Purple wall light", "", 50},
{"pplwll",      "Purple wall", "", 0},
{"pplwll2",      "Purple wall2", "", 0},
{"pplwll3",      "Purple wall3", "", 0},
{"pplwll4",      "Purple wall4", "", 0},
{"pplblk",      "Purple tile", "", 0},
{"purple",      "Purple node", "", 0},
{"rock",      "Moonstone", "", 0},
{"rock2",      "Moonstone2", "", 0},
{"blackvnt",      "Black vent", "", 0},
{"blackplate",      "Black plate", "", 0},
}

for _, row in ipairs(node.types) do
local name = row[1]
local desc = row[2]
local light = row[4]
-- Node Definition
minetest.register_node("ntm_extension:"..name, {
description = desc,
tiles = {"scifi_nodes_"..name..".png"},
groups = {cracky=1},
paramtype = "light",
paramtype2 = "facedir",
light_source = light,
})
node_texture_modifier.add_node_too_type("ntm_extension:"..name, "scifi")
end
node.plants = {
{"flower1", "Glow Flower", 1,0, 50},
{"flower2", "Pink Flower", 1.5,0, 10},
{"flower3", "Triffid", 2,5, 0},
{"flower4", "Weeping flower", 1.5,0, 0},
{"plant1", "Bulb Plant", 1,0, 0},
{"plant2", "Trap Plant", 1.5,0, 30},
{"plant3", "Blue Jelly Plant", 1.2,0, 10},
{"plant4", "Green Jelly Plant", 1.2,0, 10},
{"plant5", "Fern Plant", 1.7,0, 0},
{"plant6", "Curly Plant", 1,0, 10},
{"plant7", "Egg weed", 1,0, 0},
{"plant8", "Slug weed", 1,0, 10},
{"plant9", "Prickly Plant", 1,0, 0},
{"plant10", "Umbrella weed", 1,0, 10},
{"eyetree", "Eye Tree", 2.5,0, 0},
{"grass", "Alien Grass", 1,0, 0},
}

for _, row in ipairs(node.plants) do
local name = row[1]
local desc = row[2]
local size = row[3]
local dmg = row[4]
local light = row[5]
-- Node Definition
minetest.register_node("ntm_extension:"..name, {
description = desc,
tiles = {"scifi_nodes_"..name..".png"},
drawtype = "plantlike",
inventory_image = {"scifi_nodes_"..name..".png"},
groups = {snappy=1, oddly_breakable_by_hand=1, dig_immediate=3, flora=1},
paramtype = "light",
visual_scale = size,
buildable_to = true,
walkable = false,
damage_per_second = dmg,
selection_box = {
type = "fixed",
fixed = {
{-0.3, -0.5, -0.3, 0.3, 0.5, 0.3},
}
},
is_ground_content = false,
light_source = light,
})
node_texture_modifier.add_node_too_type("ntm_extension:"..name, "scifiplant")
end
minetest.register_node("ntm_extension:crate", {
description = "Crate",
tiles = {"scifi_nodes_crate.png"},
groups = {cracky = 1, oddly_breakable_by_hand = 2, fuel = 8},
})

minetest.register_node("ntm_extension:box", {
description = "Storage box",
tiles = {
"scifi_nodes_box_top.png",
"scifi_nodes_box_top.png",
"scifi_nodes_box.png",
"scifi_nodes_box.png",
"scifi_nodes_box.png",
"scifi_nodes_box.png"
},
groups = {cracky = 1},
})

minetest.register_node("ntm_extension:blumetlight", {
description = "blue metal light",
sunlight_propagates = false,
tiles = {
"scifi_nodes_bluemetal.png",
"scifi_nodes_bluemetal.png",
"scifi_nodes_blue_metal_light.png",
"scifi_nodes_blue_metal_light.png",
"scifi_nodes_blue_metal_light.png",
"scifi_nodes_blue_metal_light.png"
},
light_source = 10,
paramtype = "light",
groups = {cracky=1}
})


minetest.register_node("ntm_extension:lightstp", {
description = "twin lights",
sunlight_propagates = false,
tiles = {
"scifi_nodes_lightstripe.png"
},
light_source = 14,
paramtype = "light",
groups = {cracky=1}
})

minetest.register_node("ntm_extension:blklt2", {
description = "black stripe light",
sunlight_propagates = false,
tiles = {
"scifi_nodes_black_light2.png"
},
light_source = 10,
paramtype = "light",
groups = {cracky=1}
})

minetest.register_node("ntm_extension:blumetstr", {
description = "blue stripe light",
sunlight_propagates = false,
tiles = {
"scifi_nodes_blue_metal_stripes2.png"
},
light_source = 10,
paramtype = "light",
groups = {cracky=1}
})

minetest.register_node("ntm_extension:glass", {
description = "dark glass",
drawtype = "glasslike",
sunlight_propagates = false,
tiles = {
"scifi_nodes_glass.png"
},
use_texture_alpha = true,
paramtype = "light",
groups = {cracky=1}
})

minetest.register_node("ntm_extension:whtlightbnd", {
description = "white light stripe",
sunlight_propagates = false,
tiles = {
"scifi_nodes_lightband.png"
},
light_source = 10,
paramtype = "light",
groups = {cracky=1}
})


local SCI = {
"ntm_extension:white_pad",
"ntm_extension:black_lights",
"ntm_extension:octrng",
"ntm_extension:grassblk",
"ntm_extension:screen",
"ntm_extension:blumetstr",
"ntm_extension:blklt2",
"ntm_extension:octbl",
"ntm_extension:blumetlight",
"ntm_extension:box",
"ntm_extension:crate",
"ntm_extension:tower",
"ntm_extension:octppl",
"ntm_extension:grnpipe",
"ntm_extension:rfloor",
"ntm_extension:screen2",
"ntm_extension:black_screen",
"ntm_extension:blink",
"ntm_extension:disc",
"ntm_extension:red_light",
"ntm_extension:green_light",
"ntm_extension:gblock3",
"ntm_extension:glass",
"ntm_extension:stripes2",
"ntm_extension:bfloor",
"ntm_extension:white_base",
"ntm_extension:lightstp",
"ntm_extension:whtlightbnd",
"ntm_extension:light",
"ntm_extension:grnpipe2",
"ntm_extension:octgrn",
"ntm_extension:builder",
"ntm_extension:discs",
"ntm_extension:gblock",
"ntm_extension:gblock2",
}
for number = 1, 35 do
local scitrans = SCI[number]
node_texture_modifier.add_node_too_type(scitrans, "scifi")
end
node_texture_modifier.add_node_too_type("farming:seed_wheat", "scifiplant")
node_texture_modifier.add_node_too_type("ntm_extension:base_color", "scifi")


local FORMNAME = "guide:tos_fs"

local TOS = [[
This mod is an extension to node_texture_modifier
dyable blocks:
base block (432)
steel blocks (216)
stone blocks (432)
stone bricks (432)
cobble (216)
and any dyed variant of the ones above can be re dyed back to normal

chiselable blocks:

base block 
dirt
stone
cobble


and any chiseled variant of the ones above can be re chiseled back to normal
]]
local TOS_list = { } -- list[paragraph][word]
local par_wordlist
par_wordlist = { }
for line in TOS:gmatch("(.-)\n") do
	if line == "" then
		table.insert(TOS_list, par_wordlist)
		par_wordlist = { }
	end
	for word in line:gmatch("[%w][%w'_-]*") do
		table.insert(par_wordlist, word)
	end
end

local ord_suffix = { "st", "nd", "rd", [11] = "th", [12] = "th", [13] = "th" }
local function make_formspec()
	local fs = { "size[9,8]" }
	table.insert(fs, "textarea[0.5,0.5;8,7;TOS;Guide;"..TOS.."]")
	return table.concat(fs)
end

myform = smartfs.create("ntm_extension:guide",function(state)
    state:size(11,11)
    state:label(2,0,"lbl","SmartFS example formspec!")
    state:checkbox(2,1,"c","Easy code",false)
    return true
end)

minetest.register_craftitem("ntm_extension:guide", {
	description = "Guide book",
	stack_max = 1,
	inventory_image = "achievement_book.png",
	wield_image = "achievement_book.png",
	wield_scale = { x=1, y=1, z=2.25 },
	on_use = function(itemstack, user)
minetest.show_formspec(user:get_player_name(), FORMNAME, make_formspec())
	end,
	groups = { book=1 },
})
	minetest.register_craft({
		output = "ntm_extension:guide",
		recipe = {
			{ "default:book" },
			{ "ntm_extension:base_color" },
		}
	})
