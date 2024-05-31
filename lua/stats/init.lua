local user_config = require("stats.user_config")
local exposed_funcs = {}

function exposed_funcs.setup(args)
	for i, v in pairs(args) do
		user_config[i] = v
	end
end
return exposed_funcs
