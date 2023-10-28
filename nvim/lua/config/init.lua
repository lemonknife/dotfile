require("config.default")

vim.api.nvim_create_autocmd("user", {
    pattern = "VeryLazy",
    callback = function()
        require("config.map")
    end,
})
