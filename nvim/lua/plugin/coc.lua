local util = require("util")

local vim_setting = {}
vim_setting.g = {
    coc_global_extensions = {
        "coc-webview",
        "coc-sumneko-lua",
        "coc-pairs",
        "coc-highlight",
        "coc-git",
        "coc-yaml",
        "coc-xml",
        "coc-toml",
        "coc-rust-analyzer",
        "coc-pyright",
        "coc-omnisharp",
        "coc-ltex",
        "coc-json",
    },
}

return {
    "neoclide/coc.nvim",
    lazy = false,
    branch = "master",
    build = "npm ci",
    init = function()
        util.set_map("coc")
        util.set_vim(vim_setting)
    end,
}
