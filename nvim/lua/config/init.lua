local util = require("util")
util.set_vim(require("config.default"))

vim.api.nvim_create_autocmd("user", {
    pattern = "VeryLazy",
    callback = function()
        util.set_map("general")
    end,
})
