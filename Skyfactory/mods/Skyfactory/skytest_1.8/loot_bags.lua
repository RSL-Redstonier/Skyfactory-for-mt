--texture for bag taken from cx384 inventory bags mod
--random item texture By Aha-Soft from https://www.iconfinder.com/icons/132708/about_help_mark_question_support_icon#size=16
local count = 0
local lucky_table = {}
for item,def in pairs(minetest.registered_items) do 
	count = count + 1
	lucky_table[count] = item
end
minetest.register_entity("skytest:item",{
	hp_max = 1,
	visual="wielditem",
	visual_size={x=.33,y=.33},
	collisionbox = {0,0,0,0,0,0},
	physical=false,
	textures={"random_item.png"},
	count = 0, --start at zero since counter adds before showing item
	timer = 0,
	expire = 0,
	counting = true,
	on_activate = function(self, staticdata)
		self.origin = self.object:getpos()
		self.object:set_armor_groups({immortal = 1})
		self.texture = ItemStack("skytest:random_item"):get_name()
		self.nodename = "skytest:random_item"
		self.object:set_properties({textures={self.texture}})
		self.object:set_properties({automatic_rotate=1})
		self.expire = math.random(1,20)+math.random()
	end,
	on_step = function(self,dtime)
		self.timer = self.timer + dtime
		self.object:setvelocity({x=0,y=0,z=0})
		self.object:setpos(self.origin)
		--if it's past expiration then stop and do some particles and showcase
		if self.timer >= self.expire then
			--turn off the counting sound
			if self.counting == true then
				self.counting = false
			end
			--turn on the win sound
		
			if self.timer >= self.expire + 2 then
					local pos = self.object:getpos()
					minetest.add_item(self.object:getpos(), lucky_table[self.count])
					self.object:remove()
			end
		else --show all the items and cycle
			self.count = self.count + 1
			if self.count > count then
				self.count = 1
			end
			self.nodename = lucky_table[self.count]
		end
		

	end,
})
minetest.register_craftitem("skytest:random_item", {
        description = "random_item",
        inventory_image = "random_item.png",
    })

minetest.register_craftitem("skytest:lootbag_common", {
        description = "Common loot bag",
        inventory_image = "lootbag_base.png^[colorize:blue:40",
        on_use = function(itemstack, user, pointed_thing)
		minetest.add_entity(pointed_thing.above, "skytest:item")
		minetest.add_entity(pointed_thing.above, "skytest:item")
				itemstack:take_item()
				return itemstack
	end,
    })
	minetest.register_craftitem("skytest:lootbag_uncommon", {
        description = "Uncommon loot bag",
        inventory_image = "lootbag_base.png^[colorize:blue:80",
        on_use = function(itemstack, user, pointed_thing)
		minetest.add_entity(pointed_thing.above, "skytest:item")
		minetest.add_entity(pointed_thing.above, "skytest:item")
		minetest.add_entity(pointed_thing.above, "skytest:item")
		minetest.add_entity(pointed_thing.above, "skytest:item")
				itemstack:take_item()
				return itemstack
	end,
    })
	minetest.register_craftitem("skytest:lootbag_rare", {
        description = "Rare loot bag",
        inventory_image = "lootbag_base.png^[colorize:blue:130",
        on_use = function(itemstack, user, pointed_thing)
		local rare = 0
while( rare < 9 )
do
	minetest.add_entity(pointed_thing.above, "skytest:item")
   rare = rare+1
end
			itemstack:take_item()
				return itemstack
	end,
    })
		minetest.register_craftitem("skytest:lootbag_epic", {
        description = "Epic loot bag",
        inventory_image = "lootbag_base.png^[colorize:blue:160",
        on_use = function(itemstack, user, pointed_thing)
				local epic = 0
while( epic < 27 )
do
	minetest.add_entity(pointed_thing.above, "skytest:item")
   epic = epic+1
end
				itemstack:take_item()
				return itemstack
	end,
    })
		minetest.register_craftitem("skytest:lootbag_legendary", {
        description = "Legendary loot bag",
        inventory_image = "lootbag_base.png^[colorize:purple:90",
        on_use = function(itemstack, user, pointed_thing)
		local legendary = 0
while( legendary < 60 )
do
	minetest.add_entity(pointed_thing.above, "skytest:item")
   legendary = legendary+1
end
				itemstack:take_item()
				return itemstack
	end,  
	})
		minetest.register_craftitem("skytest:lootbag_ultimate", {
        description = "Ultimate loot bag\n"..minetest.colorize("black","R.I.P frames"),
        inventory_image = "lootbag_base.png^[colorize:purple:130",
        on_use = function(itemstack, user, pointed_thing)
				local ultimate = 0
while( ultimate < 170 )
do
	minetest.add_entity(pointed_thing.above, "skytest:item")
   ultimate = ultimate+1
end
			itemstack:take_item()
				return itemstack
	end,
	})
	
	
	minetest.register_craft({
        output = "skytest:lootbag_ultimate",
        recipe = {
            {"skytest:lootbag_legendary"},
            {"skytest:lootbag_legendary"}
        }
    })
		minetest.register_craft({
        output = "skytest:lootbag_legendary",
        recipe = {
            {"skytest:lootbag_epic"},
            {"skytest:lootbag_epic"}
        }
    })
			minetest.register_craft({
        output = "skytest:lootbag_epic",
        recipe = {
            {"skytest:lootbag_rare"},
            {"skytest:lootbag_rare"}
        }
    })
				minetest.register_craft({
        output = "skytest:lootbag_rare",
        recipe = {
            {"skytest:lootbag_uncommon"},
            {"skytest:lootbag_uncommon"}
        }
    })
				minetest.register_craft({
        output = "skytest:lootbag_uncommon",
        recipe = {
            {"skytest:lootbag_common"},
            {"skytest:lootbag_common"}
        }
    })
minetest.register_craft({
        output = "skytest:lootbag_common",
        recipe = {
				{"","skytest:enchanted_fiber",""},
				{"skytest:enchanted_fiber","skytest:silicon","skytest:enchanted_fiber"},
				{"","skytest:enchanted_fiber",""},
        }
    })