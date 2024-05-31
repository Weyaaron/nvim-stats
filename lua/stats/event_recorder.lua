local EventRecorder = {}
EventRecorder.__index = EventRecorder

function EventRecorder:new(args)
	local base = args or {}
	setmetatable(base, { __index = self })
	return base
end

function EventRecorder:record() end

return EventRecorder
