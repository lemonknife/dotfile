return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        signs = {
            -- icons / text used for a diagnostic
            error = "",
            warning = "",
            hint = "",
            information = "",
            other = "",
        },
        action_keys = {
            previous = "i", -- previous item
            next = "k", -- next item
        },
    },
}
