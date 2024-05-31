-- luacheck: globals vim

local SessionAnalyzer = require("stats.data_analyzer"):new()
local utility = require("stats.utility")

SessionAnalyzer.__index = SessionAnalyzer
function SessionAnalyzer:new()
	local base = {}
	setmetatable(base, { __index = self })
	return base
end

function SessionAnalyzer:setup()
	local base_path = "./data/sessions.csv"
	local current_file = io.open(base_path, "r")
	local lines = current_file:read()
	current_file:close()
	for i, line_el in pairs(lines) do
		print(tostring(i))
	end
end

function SessionAnalyzer:teardown() end

return SessionAnalyzer
