-- init each modules
-- init basic config
util = require("util")
util.set_vim(require("config.default"))
util.set_map(require("config.map"))

-- init plugin
require("plugin")
