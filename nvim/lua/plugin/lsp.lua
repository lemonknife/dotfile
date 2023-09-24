return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "utilyre/barbecue.nvim",
    },
    lazy = false,
    init = function()
        vim.o.updatetime = 250
        function OpenDiagnosticIfNoFloat()
            for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
                if vim.api.nvim_win_get_config(winid).zindex then
                    return
                end
            end
            -- THIS IS FOR BUILTIN LSP
            vim.diagnostic.open_float(0, {
                scope = "cursor",
                focusable = false,
                close_events = {
                    "CursorMoved",
                    "CursorMovedI",
                    "BufHidden",
                    "InsertCharPre",
                    "WinLeave",
                },
            })
        end
        -- Show diagnostics under the cursor when holding position
        vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
        vim.api.nvim_create_autocmd({ "CursorHold" }, {
            pattern = "*",
            command = "lua OpenDiagnosticIfNoFloat()",
            group = "lsp_diagnostics_hold",
        })
        vim.diagnostic.config({
            float = { border = "rounded" },
            virtual_text = false,
        })
        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
    end,
    config = function()
        local lsp = require("lspconfig")
        local cap = require("cmp_nvim_lsp").default_capabilities()
        local servers = require("config.lspserver")
        for _, server in pairs(servers) do
            lsp[server].setup({
                capabilities = cap,
            })
        end
    end,
}
