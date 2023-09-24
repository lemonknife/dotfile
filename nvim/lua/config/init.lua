local util = require("util")
util.set_vim(require("config.default"))

vim.api.nvim_create_autocmd("user", {
    pattern = "VeryLazy",
    callback = function()
        util.set_map("general")
    end,
})

vim.api.nvim_create_autocmd("ExitPre", {
    group = vim.api.nvim_create_augroup("Exit", { clear = true }),
    command = "set guicursor=a:ver90",
    desc = "Set cursor back to beam when leaving Neovim.",
})
