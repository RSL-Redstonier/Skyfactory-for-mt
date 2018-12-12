local LINE_SIZE = 1/6

local line_id = terumet.id('xfer_hline')

-- Special thanks to Elepower (https://gitlab.icynet.eu/evert/elepower) by IcyDiamond on the forums
-- for revealing to me the magic of drawtype "nodebox", type "connected"
minetest.register_node( line_id, {
    description = 'Heatline',
    tiles = {terumet.tex('hline')},
    
    groups={cracky=3, oddly_breakable_by_hand=3, terumet_hline=1},

    drawtype = "nodebox",
    paramtype = 'light',
    node_box = {
        type = "connected",
        fixed = {-LINE_SIZE, -LINE_SIZE, -LINE_SIZE, LINE_SIZE, LINE_SIZE, LINE_SIZE},
        connect_front = {-LINE_SIZE, -LINE_SIZE, -1/2, LINE_SIZE, LINE_SIZE, -LINE_SIZE},
        connect_back = {-LINE_SIZE, -LINE_SIZE, LINE_SIZE, LINE_SIZE, LINE_SIZE, 1/2},
        connect_top = {-LINE_SIZE, LINE_SIZE, -LINE_SIZE, LINE_SIZE, 1/2, LINE_SIZE},
        connect_bottom = {-LINE_SIZE, -1/2, -LINE_SIZE, LINE_SIZE, -LINE_SIZE, LINE_SIZE},
        connect_left = {-1/2, -LINE_SIZE, -LINE_SIZE, LINE_SIZE, LINE_SIZE, LINE_SIZE},
        connect_right = {LINE_SIZE, -LINE_SIZE, -LINE_SIZE, 1/2, LINE_SIZE, LINE_SIZE},
    },
    connect_sides = { "top", "bottom", "front", "left", "back", "right" },
    is_ground_content = false,
    connects_to = {
        "group:terumet_hltarget",
        "group:terumet_hline",
    },
})

minetest.register_craft{ output = terumet.id('xfer_hline',6) , recipe = {
    {terumet.id('item_ceramic'), terumet.id('item_ceramic'), terumet.id('item_ceramic')},
    {terumet.id('item_coil_tgol'), terumet.id('item_coil_tgol'), terumet.id('item_coil_tgol')},
    {terumet.id('item_ceramic'), terumet.id('item_ceramic'), terumet.id('item_ceramic')}
}}

function terumet.register_heatline_block(base, code)
    local base_def = minetest.registered_nodes[base]
    if not base_def then error('base '..base..' is not defined') end
    local def = {}
    for k,v in pairs(base_def) do 
        if k == 'groups' then
            def.groups = {}
            for gk,gv in pairs(v) do 
                if not terumet.options.heatline.BLOCK_REMOVE_GROUPS[gk] then
                    def.groups[gk]=gv
                end
            end
        else
            def[k] = v
        end
    end
    if not def.groups then def.groups = {} end
    def.groups.terumet_hline = 1

    for tn,tile in ipairs(def.tiles) do
        def.tiles[tn] = tile .. '^' .. terumet.tex('blockov_hline')
    end
    def.description = 'Heatline '..def.description

    local hlblock_id = terumet.id('hline_block_'..code)
    minetest.register_node(hlblock_id, def)

    minetest.register_craft{ output = hlblock_id..' 4', recipe = {
        {base, line_id, base},
        {line_id, terumet.id('item_glue'), line_id},
        {base, line_id, base}}}
end

terumet.register_heatline_block('default:stone', 'stone')
terumet.register_heatline_block('default:cobble', 'cobble')
terumet.register_heatline_block('default:stonebrick', 'stonebrick')
terumet.register_heatline_block('default:stone_block', 'stoneblock')
terumet.register_heatline_block('default:desert_stone', 'desertstone')
terumet.register_heatline_block('default:desert_cobble', 'desertcobble')
terumet.register_heatline_block('default:desert_stonebrick', 'desertstonebrick')
terumet.register_heatline_block('default:wood', 'wood')
terumet.register_heatline_block('default:junglewood', 'junglewood')
terumet.register_heatline_block('default:pine_wood', 'pinewood')
terumet.register_heatline_block('default:acacia_wood', 'acaciawood')
terumet.register_heatline_block('default:aspen_wood', 'aspenwood')
terumet.register_heatline_block('terumet:block_pwood', 'pwood')
