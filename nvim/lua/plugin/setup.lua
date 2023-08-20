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
    }
    },
}

require("lazy").setup(plugins, require("set.lazy"))
