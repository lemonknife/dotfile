local icons = require("config.icon")

return {
    "lewis6991/gitsigns.nvim",
    opts = {
        signs = {
            add = {
                hl = "GitSignsAdd",
                text = icons.ui.BoldLineLeft,
                numhl = "GitSignsAddNr",
                linehl = "GitSignsAddLn",
            },
            change = {
                hl = "GitSignsChange",
                text = icons.ui.BoldLineLeft,
                numhl = "GitSignsChangeNr",
                linehl = "GitSignsChangeLn",
            },
            delete = {
                hl = "GitSignsDelete",
                text = icons.ui.Triangle,
                numhl = "GitSignsDeleteNr",
                linehl = "GitSignsDeleteLn",
            },
            topdelete = {
                hl = "GitSignsDelete",
                text = icons.ui.Triangle,
                numhl = "GitSignsDeleteNr",
                linehl = "GitSignsDeleteLn",
            },
            changedelete = {
                hl = "GitSignsChange",
                text = icons.ui.BoldLineLeft,
                numhl = "GitSignsChangeNr",
                linehl = "GitSignsChangeLn",
            },
        },
    },
}
