-- Inspire recipes.lua
-- Copyright Duane Robertson (duane@duanerobertson.com), 2017
-- Distributed under the LGPLv2.1 (https://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html)


for _, i in pairs({
  'default:cobble',
  'default:stone',
  'default:coal_lump',
  'default:steel_ingot',
  'default:copper_ingot',
  'default:gold_ingot',
  'default:diamond',
  'default:stone_block',
  'default:coalblock',
  'default:steelblock',
  'default:copperblock',
  'default:goldblock',
  'default:diamondblock',
}) do
  minetest.register_craft({
    output = i..' 2',
    type = 'shapeless',
    recipe = {i, 'inspire:inspiration'},
  })
  minetest.register_craft({
    output = i..' 9',
    recipe = {
      {'inspire:inspiration', 'inspire:inspiration', 'inspire:inspiration'},
      {'inspire:inspiration', i, 'inspire:inspiration'},
      {'inspire:inspiration', 'inspire:inspiration', 'inspire:inspiration'},
    },
  })
end


minetest.register_craftitem("inspire:random_node", {
	description = "Random Node",
	inventory_image = "inspire_question_mark.png",
})

minetest.register_craft({
  output = 'inspire:random_node',
  recipe = {
    {'inspire:inspiration', '', ''},
    {'', 'inspire:inspiration', ''},
    {'', '', 'inspire:inspiration'},
  },
})

minetest.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
	if itemstack:get_name() ~= "inspire:random_node" then
		return
	end

  local ks = {}
  for k, _ in pairs(minetest.registered_nodes) do
    ks[#ks+1] = k
  end
	itemstack:replace(minetest.registered_nodes[ks[math.random(#ks)]])
end)
