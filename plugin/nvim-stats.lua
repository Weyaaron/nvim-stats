-- luacheck: globals vim
if vim.g.loaded_stats == 1 then
	print("Already loaded")
	return
end
vim.g.loaded_stats = 1
--
-- local current_session = Session:new()
-- local TimedEvent = ""
--
-- local subcommand_tbl = {
--
-- 	start = {
-- 		impl = function(args, opts)
-- 			print("Start called")
-- 			current_session:start()
-- 			TimedEvent = CursorMovedEventRecorder:new({ session = current_session })
-- 			-- BufEnterRecorder:new({ session = current_session })
-- 			-- Implementation (args is a list of strings)
-- 		end,
-- 		-- This subcommand has no completions
-- 	},
--
-- 	analyze = {
-- 		impl = function(args, opts)
-- 			-- TimedEvent:stop()
--
-- 			local hard_coded_path = "/tmp/dump8a7e61b1-e6a6-4818-91f8-753f13fe9d62.json"
-- 			local hard_coded_path = "/tmp/cleaner_json.json"
-- 			local file = io.open(hard_coded_path, "r")
--
-- 			local all_tables = {}
--
-- 			for line in file:lines() do
-- 				all_tables[#all_tables + 1] = vim.json.decode(line)
-- 			end
-- 			local buf_names = {}
-- 			for i, table_el in pairs(all_tables) do
-- 				buf_names[#buf_names + 1] = table_el["buf_name"]
-- 			end
--
-- 			local unique_buf_names = {}
--
-- 			for i, buff_name in pairs(buf_names) do
-- 				if not unique_buf_names[buff_name] then
-- 					unique_buf_names[buff_name] = buff_name
-- 				end
-- 			end
-- 			print(unique_buf_names)
--
-- 			vim.cmd("e result.txt")
-- 			vim.api.nvim_buf_set_lines(0, 0, 25, false, buf_names)
--
-- 			local expandet_c_words = {}
-- 			for i, table_el in pairs(all_tables) do
-- 				expandet_c_words[#expandet_c_words + 1] = table_el["expandet_cword"]
-- 			end
-- 		end,
-- 		-- This subcommand has no completions
-- 	},
-- 	install = {
-- 		impl = function(args, opts)
-- 			print("Install called")
-- 			-- Implementation
-- 		end,
-- 		complete = function(subcmd_arg_lead)
-- 			-- Simplified example
-- 			local install_args = {
-- 				"neorg",
-- 				"rest.nvim",
-- 				"rustaceanvim",
-- 			}
-- 			return vim.iter(install_args)
-- 				:filter(function(install_arg)
-- 					-- If the user has typed `:Rocks install ne`,
-- 					-- this will match 'neorg'
-- 					return install_arg:find(subcmd_arg_lead) ~= nil
-- 				end)
-- 				:totable()
-- 		end,
-- 		-- ...
-- 	},
-- }
--
-- local function my_cmd(opts)
-- 	local fargs = opts.fargs
-- 	local subcommand_key = fargs[1]
-- 	-- Get the subcommand's arguments, if any
-- 	local args = #fargs > 1 and vim.list_slice(fargs, 2, #fargs) or {}
-- 	local subcommand = subcommand_tbl[subcommand_key]
-- 	if not subcommand then
-- 		vim.notify("Rocks: Unknown command: " .. subcommand_key, vim.log.levels.ERROR)
-- 		return
-- 	end
-- 	-- Invoke the subcommand
-- 	subcommand.impl(args, opts)
-- end
--
-- vim.api.nvim_create_user_command("Stats", my_cmd, {
-- 	nargs = "+",
-- 	desc = "My awesome command with subcommand completions",
-- 	complete = function(arg_lead, cmdline, _)
-- 		-- Get the subcommand.
-- 		local subcmd_key, subcmd_arg_lead = cmdline:match("^Stats *%s(%S+)%s(.*)$")
-- 		if subcmd_key and subcmd_arg_lead and subcommand_tbl[subcmd_key] and subcommand_tbl[subcmd_key].complete then
-- 			-- The subcommand has completions. Return them.
-- 			return subcommand_tbl[subcmd_key].complete(subcmd_arg_lead)
-- 		end
-- 		-- Check if cmdline is a subcommand
-- 		if cmdline:match("^Rocks[!]*%s+%w*$") then
-- 			-- Filter subcommands that match
-- 			local subcommand_keys = vim.tbl_keys(subcommand_tbl)
-- 			return vim.iter(subcommand_keys)
-- 				:filter(function(key)
-- 					return key:find(arg_lead) ~= nil
-- 				end)
-- 				:totable()
-- 		end
-- 	end,
-- 	bang = true, -- If you want to support ! modifiers
-- })
--
--

if vim.g.loaded_training == 1 then
	print("Already loaded")
	return
end
vim.g.loaded_training = 1

vim.api.nvim_create_user_command("Data", function()
	print("Called")
end, {
	nargs = "*",
})
