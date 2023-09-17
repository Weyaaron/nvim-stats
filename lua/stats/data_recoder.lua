-- luacheck: globals vim
local DataRecoder = {}

DataRecoder.__index = DataRecoder
function DataRecoder:new()
	local base = {}
	setmetatable(base, { __index = self })

	return base
end

function DataRecoder:setup() end

function DataRecoder:teardown() end

return DataRecoder
