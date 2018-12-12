--- Global table definitions.
--
-- All functions, variables, and tables are held in a single global table
-- prefixed `_xtend` for uniqueness.
_xtend = {}     -- global table creation
_xtend.default_setting = {}   -- settings read from settingtypes.txt files


-- Initiate an xTend based mod.
--
-- For loading and parsing the configuration, and setting other stuff, all
-- xTend based mods need to initiate themselves by running this function first
-- and providing the mod name.
--
-- @return void
_xtend.init = function ()
    local name = minetest.get_current_modname()
    local path = minetest.get_modpath(name)
    local filename = path..DIR_DELIM..'settingtypes.txt'
    local file = io.open(filename, 'rb')

    if file ~= nil then
        local lines = {}
        for line in file:lines() do
            if line:match("^([a-zA-Z])") then
                local name = line:gsub(' .+', '')
                local value = line:gsub('^[^ ]+ %b() %a+ ', '')
                if value == line then value = '' end
                _xtend.default_setting[name] = value
            end
        end
    end

    _xtend[name] = {}
end
_xtend.init() -- init self


-- Clean up after mod processing
--
-- When not cleaning up after a mod unnecessary things from that mod could stay
-- in the globalk _xtend table. For the sake of cleanlyness and resources do
-- not pollute the global namespace or it’s tables.
--
-- @return void
_xtend.clean = function ()
    _xtend[minetest.get_current_modname()] = nil
end


--- Get a configuration or default value.
--
-- Because Minetest does not provide a valid and sane way to get a value from
-- the configuration or – if not present – get a given default value instead,
-- this function exists. It searches the configuration for a value and if the
-- value does not exist it returns the default value defined in this modpack’s
-- `settingtypes.txt` file instead.
--
-- @param value             The descriptor of the value in question without
--                          the mod’s prefix. The prefix is added automatically
--                          and the given value plus prefix will be searched
--                          in the configuration.
-- @return string|int|bool  The configuration value or the default value
_xtend.get_option = function (value, force_default, no_mod_prefix)
    local prefix = ''

    if no_mod_prefix ~= true then
        prefix = minetest.get_current_modname()..'_'
    end

    if force_default ~= true then
        local v = minetest.settings:get(prefix..value)
        return (v == nil and _xtend.default_setting[prefix..value] or v)
    else
        return _xtend.default_setting[prefix..value]
    end
end


--- Colorize the given text
--
-- Colors the given text in the set color and resets the color to the set reset
-- color and returns the result if colorization is enabled. If not enabled this
-- function simply returns the given text without any changes.
--
-- Attention mod authors: Use with care! Do not overdo it! :)
--
-- @param text    The text that has to be colorized if enabled
-- @return string The colored (or not colored) text
_xtend.colorize = function (text)
    if _xtend.get_option('enable_colorization') == 'true' then
        local color = '#'.._xtend.get_option('colorization_color')
        local reset = '#'.._xtend.get_option('reset_color')
        local color_escape = minetest.get_color_escape_sequence(color)
        local reset_escape = minetest.get_color_escape_sequence(reset)
        return color_escape..text..reset_escape
    else
        return text
    end
end


--- Return a translated string.
--
-- Since there currently is no valid convenient way to translate mods (nor
-- is gettext used to translate mod strings) this function only returns
-- the processed given string.
--
-- With release of Minetest 0.5.0 client-side translations will be introduced
-- and then the function will be altered to actually translate the string.
--
-- As of now only the positional arguments are replaced. This is fully
-- compatible with the previous syntax of this function. All mods using it
-- should be slowly migrated from gsub() to the new syntax.
--
-- @param string   The string that is to be translated. Variables @n (where n
--                 is a number between 1-9) can be used and will be replaced
--                 with the positional varargs.
-- @param ...      Up to 9 positional varargs. Those arguments are used for
--                 replacing @n in the `string` value.
-- @return result  A two values return. 1) the translated string, 2) the
--                 untranslated original string.
--
-- @link https://www.lua.org/pil/5.2.html
-- @link http://lua-users.org/wiki/VarargTheSecondClassCitizen
-- @link https://stackoverflow.com/questions/7183998
_xtend.translate = function (s, ...)
    local args = { ... }
    if #args > 0 then for n,v in pairs(args) do s = s:gsub('@'..n, v) end end
    return s
end


-- Output a debug message.
--
-- Checks if debugging messages are enabled and if so reads and parses the
-- given debug message format and prints a debug message wherever the function
-- is called.
--
-- @param information The information to be shown
-- @return void
_xtend.log = function (information, loglevel)
    local current_mod = minetest.get_current_modname()
    local loglevel_option = 'xtend_default_log_format'

    if loglevel == nil then
        loglevel = _xtend.get_option('xtend_default_loglevel', false, true)
    end

    local string = _xtend.get_option(loglevel_option, false, true):gsub('+.', {
        ['+i'] = information,
        ['+m'] = current_mod,
        ['+M'] = string.upper(current_mod),
        ['+n'] = '\n',
        ['+t'] = os.date('%H:%M:%S')
    })

    minetest.log(loglevel, string)
end
