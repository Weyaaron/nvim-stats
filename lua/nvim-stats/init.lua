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

local function new_key_mapp(mode, lhs, rhs, opts)
	print("run,", mode, lhs, rhs, vim.inspect(opts))
	old_func(mode, lhs, rhs, opts)
end

function config.glob_replace()
	vim.api.nvim_set_keymap = new_key_mapp
end
return config
