-- luacheck: globals vim
local SessionRecoder = require("stats.data_recoder"):new()
local utility = require("stats.utility")

SessionRecoder.__index = SessionRecoder
function SessionRecoder:new()
	local base = {}
	setmetatable(base, { __index = self })
	base.start_file = ""
	base.end_file = ""
	base.start_time = nil
	base.end_time = nil
	base.file_path = "./data/sessions.csv"
	return base
end

function SessionRecoder:VimLeave(cmd_args)
	self.end_time = os.time()
	self.end_file = vim.api.nvim_buf_get_name(0)

	utility.write_table_to_file({ self.start_time, self.end_time, self.start_file, self.end_file }, self.file_path)
end

function SessionRecoder:setup()
	self.start_time = os.time()
	self.start_file = vim.api.nvim_buf_get_name(0)
end

function SessionRecoder:teardown() end

return SessionRecoder
