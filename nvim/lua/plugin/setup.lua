local plugins = {
	-- TODO: replace setting as opt("plugin_name") opt = require("core.util").plug_opt
	{
		"NvChad/nvim-colorizer.lua",
		lazy = false,
		opts = {
			user_default_options = {
				css = true,
				names = false,
			},
		},
	},
}

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

require("lazy").setup(require("set"), lazy_opts)
