local utility = require("stats.utility")
local Session = {}
Session.__index = Session

function Session:new(args)
	local base = args or {}
	setmetatable(base, { __index = self })
	base.data_storage = { session_uuid = utility:generate_uuid() }

	return base
end

function Session:start()
	self.data_storage["session_start"] = os.time()
end

function Session:add_datum(key, value)
	self.data_storage[key] = value
end

function Session:retrieve_data()
	return self.data_storage
end
return Session
