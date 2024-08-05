local stats = {}

function stats.setup()
	local recorders = {}
	local session_recorder = require("stats.session_recorder"):new()
	session_recorder:setup()

	table.insert(recorders, session_recorder)

	local autocmds = { "BufEnter", "VimEnter", "VimLeave" }

	for i, recorder_el in pairs(recorders) do
		for ii, autocmd_el in pairs(autocmds) do
			if recorder_el[autocmd_el] then
				local function callback_wrapper(cmd_args)
					recorder_el[autocmd_el](recorder_el, cmd_args)
				end
				local _ = vim.api.nvim_create_autocmd({ autocmd_el }, { callback = callback_wrapper })
			end
		end
	end
end

function stats.analyze()
	local analyzers = {}
	local session_analyzer = require("stats.session_analyzer")
	table.insert(analyzers, session_analyzer)
	session_analyzer:setup()
end

return stats
