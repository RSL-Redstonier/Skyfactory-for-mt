local _register = _xtend.xvessels.register


_register('xvessels:brazier_lava', {
    name = _xtend.translate('Lava Brazier'),
    top_material = 'default:obsidian',
    foot_material = {'skytest:bedrockium_ingot', 'skytest:bedrockium_ingot'},
    light_source = 5,
    groups = { cracky = 1 },
    sounds = default.node_sound_stone_defaults(),
    liquid_texture = 'default_lava.png',
    items = {
        craft = 'bucket:bucket_lava',
        get = {
            {'bucket:bucket_empty', 'bucket:bucket_lava'}
        }
    }
})

_register('xvessels:trough_water', {
    name = _xtend.translate('Water Trough'),
    top_material = 'default:wood',
    foot_material = {'default:steel_ingot', 'default:steel_block'},
    light_source = false,
    groups = { choppy = 1, oddly_breakable_by_hand = 1 },
    sounds = default.node_sound_wood_defaults(),
    liquid_texture = 'default_water.png',
    items = {
        craft = 'bucket:bucket_water',
        get = {
            {'bucket:bucket_empty', 'bucket:bucket_water'}
        }
    }
})

_register('xvessels:trough_river_water', {
    name = _xtend.translate('River Water Trough'),
    top_material = 'default:wood',
    foot_material = {'default:steel_ingot', 'default:steel_block'},
    light_source = false,
    groups = { choppy = 1, oddly_breakable_by_hand = 1 },
    sounds = default.node_sound_wood_defaults(),
    liquid_texture = 'default_river_water.png',
    items = {
        craft = 'bucket:bucket_river_water',
        get = {
            {'bucket:bucket_empty', 'bucket:bucket_river_water'}
        }
    }
})

_register('xvessels:trough_water', {
    name = _xtend.translate('Water Trough'),
    top_material = 'default:wood',
    foot_material = {'default:steel_ingot', 'default:steel_block'},
    light_source = false,
    groups = { choppy = 1, oddly_breakable_by_hand = 1 },
    sounds = default.node_sound_wood_defaults(),
    liquid_texture = 'default_water.png',
    items = {
        craft = 'skytest:bucket_wood_water',
        get = {
            {'skytest:bucket_wood_empty', 'skytest:bucket_wood_water'}
        }
    }
})


_register('xvessels:trough_water', {
    name = _xtend.translate('Water Trough'),
    top_material = 'default:wood',
    foot_material = {'default:steel_ingot', 'default:steel_block'},
    light_source = false,
    groups = { choppy = 1, oddly_breakable_by_hand = 1 },
    sounds = default.node_sound_wood_defaults(),
    liquid_texture = 'default_water.png',
    items = {
        craft = 'skytest:bucket_clay_water',
        get = {
            {'skytest:bucket_clay_empty', 'skytest:bucket_clay_water'}
        }
    }
})
