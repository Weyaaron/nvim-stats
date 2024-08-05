local Event = require("stats.event_recorder")

local CursorMovedEventRecorder = Event:new()
CursorMovedEventRecorder.__index = CursorMovedEventRecorder

function CursorMovedEventRecorder:new(args)
	local base = args or {}
	setmetatable(base, { __index = self })

	base.timer = vim.loop.new_timer()

	-- This will wait 1000ms and then continue inside the callback
	base.timer:start(0, 200, function()
		vim.schedule_wrap(function()
			base:record({}, args.session)
		end)()

		-- -- You must always close your uv handles or you'll leak memory
		-- -- We can't depend on the GC since it doesn't know enough about libuv.
		-- timer:close()
	end)

	-- vim.api.nvim_create_autocmd({ "CursorMoved" }, {
	-- 	callback = function(event_args)
	-- 		base:record(event_args, args.session)
	-- 	end,
	-- })

	return base
end

function CursorMovedEventRecorder:record(args, session)
	local file = io.open("/tmp/dump" .. session:retrieve_data()['session_uuid'] ..".json", "a+")

	local x_y_pos = vim.api.nvim_win_get_cursor(0)
	local current_buf_num = vim.api.nvim_win_get_buf(0)
	args["buf_name"] = vim.api.nvim_buf_get_name(current_buf_num)
	args["buf_type"] = vim.api.nvim_get_option_value("buftype", {})
	args["cursor_x"] = x_y_pos[1]
	args["cursor_y"] = x_y_pos[2]
	args["buf_num"] = current_buf_num
	args["expandet_cword"] = vim.fn.expand("<cword>")
	args["expandet_%"] = vim.fn.expand("%")
	args["event_timestamp"] = os.time()
        args["event_type"] = "regular"

	for i, v in pairs(session:retrieve_data()) do
		args[i] = v
	end

	local data = vim.json.encode(args)
	file:write(data .. "\n")
	file:close()
end

function CursorMovedEventRecorder:stop() 
    -- self.timer:stop()
end

return CursorMovedEventRecorder
