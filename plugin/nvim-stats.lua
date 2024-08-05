if vim.g.loaded_stats == 1 then
	print("Already loaded")
	return
end

local utility = require("nvim-stats.utility")
local config = {}

--[[
Parameters:
{mode} Mode short-name (map command prefix: "n", "i", "v", "x", …) or "!" for :map!, or empty string for :map. "ia", "ca" or "!a" for abbreviation in Insert mode, Cmdline mode, or both, respectively
{lhs} Left-hand-side {lhs} of the mapping.
{rhs} Right-hand-side {rhs} of the mapping.
{opts} Optional parameters map: Accepts all :map-arguments as keys except <buffer>, values are booleans (default false). Also:
"noremap" disables recursive_mapping, like :noremap
"desc" human-readable description.
"callback" Lua function called in place of {rhs}.
"replace_keycodes" (boolean) When "expr" is true, replace keycodes in the resulting string (see nvim_replace_termcodes()). Returning nil from the Lua "callback" is equivalent to returning an empty string.
]]

local old_func = vim.api.nvim_set_keymap

local actual_mapping = {}

local function new_key_mapp(mode, lhs, rhs, opts)
	-- print("run,", mode, vim.inspect(lhs), vim.inspect(rhs), vim.inspect(opts))
	local mapping_data = { mode, lhs, rhs, utility.copy_table_shallow(opts) }
	actual_mapping[lhs] = mapping_data

	local path = "/tmp/data_ " .. lhs .. ".json"
	local file = io.open(path, "a+")
	file:write(vim.json.encode({ mapping_data[1], mapping_data[2] }))
	file:close()

	opts.callback = function()
		local path = "/tmp/data.json"

		print("Data", lhs, opts.callback)
		actual_mapping[lhs][4]["callback"]()

		local file = io.open(path, "a+")
		file:write(vim.json.encode({ mapping_data[1] }))
		file:close()
	end
	old_func(mode, lhs, rhs, opts)
end

local function new_buildin(lhs)
	vim.api.nvim_set_keymap(hls, "", { callback = function() end })
end

--vim.api.nvim_set_keymap = new_key_mapp

--new_buildin("dd")
