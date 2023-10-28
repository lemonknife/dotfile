return {
    "narutoxy/silicon.lua",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        font = "CaskaydiaCove Nerd Font Propo",
    },
    event = "VeryLazy",
    init = function()
        vim.keymap.set("n", "<leader>s", function()
            require("silicon").visualise_api({ to_clip = false, visible = true })
        end, { noremap = true, silent = true })
        vim.keymap.set("x", "<leader>s", function()
            require("silicon").visualise_api({ to_clip = false })
        end, { noremap = true, silent = true })
        local silicon_utils = require("silicon.utils")
        vim.api.nvim_create_augroup("SiliconRefresh", { clear = true })
        vim.api.nvim_create_autocmd({ "ColorScheme" }, {
            group = "SiliconRefresh",
            callback = function()
                silicon_utils.build_tmTheme()
                silicon_utils.reload_silicon_cache({ async = true })
            end,
            desc = "Reload silicon themes cache on colorscheme switch",
        })
    end,
}
