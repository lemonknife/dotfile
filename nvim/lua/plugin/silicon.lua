return {
    "narutoxy/silicon.lua",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        font = "CaskaydiaCove Nerd Font Propo",
    },
    event = "VeryLazy",
    init = function()
        require("util").set_map("silicon")
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
