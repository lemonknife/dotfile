local util = require("util")
local vim_setting = {}
vim_setting.g = {
    loaded_netrw = 1,
    loaded_netrwPlugin = 1,
}

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    init = util.set_vim(vim_setting),
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = util.lazy_map("tree"),
    config = function()
        require("nvim-tree").setup({})
    end,
}
