
local Event = require("stats.event_recorder")

local BufEnterRecorder = Event:new()
BufEnterRecorder.__index = BufEnterRecorder

function BufEnterRecorder:new(args)
	local base = args or {}
	setmetatable(base, { __index = self })

	vim.api.nvim_create_autocmd({ "BufEnter" }, {
		callback = function(event_args)
			base:record(event_args, args.session)
		end,
	})

	return base
end

function BufEnterRecorder:record(args, session)
	local file = io.open("/tmp/dump.json", "a+")

	local x_y_pos = vim.api.nvim_win_get_cursor(0)

	args["cursor_x"] = x_y_pos[1]
	args["cursor_y"] = x_y_pos[2]
	for i, v in pairs(session:retrieve_data()) do
		args[i] = v
	end

	local data = vim.json.encode(args)
	file:write(data)
	file:close()
end

return BufEnterRecorder
