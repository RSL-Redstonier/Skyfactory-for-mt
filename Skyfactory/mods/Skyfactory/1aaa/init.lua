
registered_items = {}
for itemname, value in pairs(minetest.registered_items) do
      table.insert(registered_items, itemname)
end
 unified_inventory.register_craft_type("aaa", {
    description = "Dummy Crafting\nCan't really craft just to have\nall items show up",
    icon = "blank.png",
    width=1,
    height=1,
})
minetest.register_node("1aaa:null", {
    drawtype = "airlike",
    walkable = false,
    pointable = false,
    diggable = true,
    climbable = false,
    buildable_to = true,
    light_source = 1,
    paramtype = light
})

for _, itemname in pairs(registered_items) do
		if itemname ~= ""
		  and itemname ~= ":"
		  and minetest.get_all_craft_recipes(itemname) == nil then
    unified_inventory.register_craft{
        type = "aaa",
        output = itemname,  -- change here if yield updated
        items = {"1aaa:null"}
    }
		end
		end