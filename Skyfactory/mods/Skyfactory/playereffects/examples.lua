----- EXAMPLE EFFECT TYPES -----
--[[ This is just a helper function to inform the user of the chat command
of the result and, if successful, shows the effect ID. ]]
local function notify(name, retcode)
	if(retcode == false) then
		minetest.chat_send_player(name, "Effect application failed. Effect was NOT applied.")
	else
		minetest.chat_send_player(name, "Effect applied. Effect ID: "..tostring(retcode))
	end
end

--[[ Null effect. The apply function always returns false, which means applying the
effect will never succeed ]]
playereffects.register_effect_type("null", "No effect", nil, {},
	function()
		return false
	end
)


playereffects.register_effect_type("creative", "Creative mode available", "playereffects_example_fly.png", {"creative"},
	function(player)
		local playername = player:get_player_name()
		local privs = minetest.get_player_privs(playername)
		privs.creative = true
		minetest.set_player_privs(playername, privs)
	end,
	function(effect, player)
		local privs = minetest.get_player_privs(effect.playername)
		privs.creative = nil
		minetest.set_player_privs(effect.playername, privs)
	end,
	false, -- not hidden
	false  -- do NOT cancel the effect on death
)

minetest.register_chatcommand("cancelall", {
	params = "",
	description = "Cancels all your effects.",
	privs = {},
	func = function(name, param)
		local effects = playereffects.get_player_effects(name)
		for e=1, #effects do
			playereffects.cancel_effect(effects[e].effect_id)
		end
		minetest.chat_send_player(name, "All effects cancelled.")
	end,
})
