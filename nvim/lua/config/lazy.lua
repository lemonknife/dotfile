local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
    spec = { { import = "plugins" }, { import = "plugins.lang" } },
    defaults = {
        lazy = false,
        version = false,
    },
    install = { colorscheme = { "tokyonight" } },
    checker = { enabled = true },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
