
-- luacheck: globals vim
local DataAnalyzer = {}

DataAnalyzer.__index = DataAnalyzer
function DataAnalyzer:new()
	local base = {}
	setmetatable(base, { __index = self })

	return base
end

function DataAnalyzer:setup() end

function DataAnalyzer:teardown() end

return DataAnalyzer
