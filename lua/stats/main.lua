

local stats ={}
global_log = require("stats.log")

local os = require("os")
local date_pieces = os.date("*t")
--This is just fine for current purposes, but might be adjusted later
local date_as_log_name = date_pieces["year"] .. "-" .. date_pieces["month"] .. "-" .. date_pieces["day"]

--Currently, dirs are not supported in this path ...
global_log.outfile = "./ " .. date_as_log_name .. ".log"
global_log.info("Started current session.")


local autocmds= {}
function stats.buff_enter(args)
    print("Entered Buffer" .. tostring(args.file))
    global_log.info("Entered Buffer" .. tostring(args.file))
end

function stats.setup()


    autocmds = {"BufEnter"}
    --Todo: What about startup?
    local buf_enter_cmd = vim.api.nvim_create_autocmd({"BufEnter"},{callback = stats.buff_enter})
    table.insert(autocmds, buf_enter_cmd)
    end

return stats