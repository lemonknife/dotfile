-- install lazy
require("plugin.boostrap").lazy()

-- setup plugins
local plugins = require("util").load_plug()

local lazy_opts = {
	defaults = { lazy = true },
	ui = {
		icons = {
			ft = "",
			lazy = "󰂠 ",
			loaded = "",
			not_loaded = "",
		},
	},
}

require("lazy").setup(plugins, lazy_opts)
