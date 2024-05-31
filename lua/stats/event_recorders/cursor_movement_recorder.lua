local Event = require("stats.event_recorder")

local CursorMovedEventRecorder = Event:new()
CursorMovedEventRecorder.__index = CursorMovedEventRecorder

function CursorMovedEventRecorder:new(args)
	local base = args or {}
	setmetatable(base, { __index = self })

	vim.api.nvim_create_autocmd({ "CursorMoved" }, {
		callback = function(event_args)
			base:record(event_args, args.session)
		end,
	})

	return base
end

function CursorMovedEventRecorder:record(args, session)
	local file = io.open("/tmp/dump.json", "a+")

	local x_y_pos = vim.api.nvim_win_get_cursor(0)

	args["x"] = x_y_pos[1]
	args["y"] = x_y_pos[2]
	for i, v in pairs(session:retrieve_data()) do
		args[i] = v
	end

	local data = vim.json.encode(args)
	file:write(data)
	file:close()
end


return CursorMovedEventRecorder
