--facade tool
minetest.register_tool("microfacade:facade_tool", {
	description = "Facade Tool",
	inventory_image = ".png",
	metadata = "",
	on_place = function(itemstack, placer, pointed_thing)
		if placer == nil or pointed_thing == nil or pointed_thing.type ~= "node" then
			return itemstack
		end
		local pos = minetest.get_pointed_thing_position(pointed_thing)
		local node = minetest.get_node(pos).name
		itemstack:set_metadata(node)
		minetest.chat_send_player(placer:get_player_name(), "Facade setting set to: "..node)
		return itemstack
	end,
		
	on_use = function(itemstack, user, pointed_thing)
		if user == nil or pointed_thing == nil or pointed_thing.type ~= "node" then
			return nil
		end
		local pos  = minetest.get_pointed_thing_position(pointed_thing)
		local nodetable = minetest.get_node(pos)
		local node = nodetable.name
		if user:get_player_control()["sneak"] then
			itemstack:set_metadata("")
			minetest.chat_send_player(user:get_player_name(), "Facade setting cleared")
			return itemstack
		end
		
		local metadata = itemstack:get_metadata()
		local inv = user:get_inventory()
		
		if not inv:contains_item("main", "microfacade:facade_material") then
			return nil
		end
		
		if metadata == "" then
		return nil
		else
			if minetest.registered_nodes[metadata] then
				inv:remove_item("main", "microfacade:facade_material")
				local nodeent = minetest.add_entity(pos, "microfacade:block")
				nodeent:get_luaentity().nodename = metadata
			end
		end
		return nil
	end,
})

minetest.register_entity("microfacade:block", {
    hp_max = 1,
    physical = true,
    --collide_with_objects = false,
    collisionbox = {-0.5,-0.5,-0.5, 0.5,0.5,0.5},
    visual = "wielditem",
    visual_size = {x=0.667, y=0.667},
    textures={"air"},
    --nodename = "",
    old_nodename = "",
    makes_footstep_sound = true,
    set_node = function(self,dtime)
		if self.nodename == nil then
			self.nodename = "default:dirt"
		end
		self.texture = ItemStack(self.nodename):get_name()
		self.old_nodename = self.nodename
		self.object:set_properties({textures={self.texture}})
    end,

    on_activate = function(self,dtime)
		self.set_node(self,dtime)
    end,

    on_punch = function(self,dtime)
			minetest.add_item(self.object:getpos(),"microfacade:facade_material")
		self.object:remove()
    end,
    
    on_step = function(self)
		if self.old_nodename ~= self.nodename then
			self.set_node(self,dtime)
		end
    end,
})

minetest.register_craftitem("microfacade:facade_material", {
	description = "Facade Material",
	inventory_image = ".png",
})
minetest.register_craft({
        output = "microfacade:facade_material 16",
        recipe = {
            {"default:paper","default:stick","default:paper"},
            {"default:paper","default:steel_ingot","default:paper"},
            {"default:paper","default:stick","default:paper"},
        }
    })
	minetest.register_craft({
        output = "microfacade:facade_tool",
        recipe = {
            {"microfacade:facade_material"},
            {"default:stick"},
        }
    })