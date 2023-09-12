-- init each modules
-- init basic config
local util = require("util")
util.set_vim(require("config.default"))
util.set_map("general")

-- init plugin
util.init_plug(util.load_plug())
