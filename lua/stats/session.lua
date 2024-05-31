local Session = {}
Session.__index = Session

function Session:new(args)
	local base = args or {}
	setmetatable(base, { __index = self })
	base.data_storage = {}
	return base
end

function Session:start()
	self.data_storage["session_start"] = os.time()
end

function Session:add_datum(key, value) end

function Session:retrieve_data()
	return self.datastorage
end
return Session
