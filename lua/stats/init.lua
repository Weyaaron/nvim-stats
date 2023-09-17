global_log = require("stats.log")

local os = require("os")
local date_pieces = os.date("*t")
--This is just fine for current purposes, but might be adjusted later
local date_as_log_name = date_pieces["year"] .. "-" .. date_pieces["month"] .. "-" .. date_pieces["day"]

--Currently, dirs are not supported in this path ...
global_log.outfile = "./ " .. date_as_log_name .. ".log"
global_log.info("Started current session.")
