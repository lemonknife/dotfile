local function prettier()
    return {
        exe = "prettier",
        args = {
            "--config-precedence",
            "prefer-file",
            "--single-quote",
            "--no-bracket-spacing",
            "--prose-wrap",
            "always",
            "--arrow-parens",
            "always",
            "--trailing-comma",
            "all",
            "--no-semi",
            "--end-of-line",
            "lf",
            "--tab-width",
            vim.bo.tabstop,
            "--print-width",
            vim.bo.textwidth,
            "--stdin-filepath",
            vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
        },
        stdin = true,
    }
end

return {
    "mhartington/formatter.nvim",
    init = function()
        local auto_indent = vim.api.nvim_create_augroup("AUTO_INDENT", { clear = true })
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            pattern = "*",
            group = auto_indent,
            command = "FormatWrite",
        })
    end,
    lazy = false,
    opts = {
        filetype = {
            javascript = { prettier },
            typescript = { prettier },
            javascriptreact = { prettier },
            typescriptreact = { prettier },
            vue = { prettier },
            ["javascript.jsx"] = { prettier },
            ["typescript.tsx"] = { prettier },
            markdown = { prettier },
            css = { prettier },
            json = { prettier },
            jsonc = { prettier },
            scss = { prettier },
            less = { prettier },
            yaml = { prettier },
            graphql = { prettier },
            html = { prettier },
            lua = {
                function()
                    return {
                        exe = "stylua",
                        args = {
                            "--indent-type",
                            "Spaces",
                            "--line-endings",
                            "Unix",
                            "-",
                            "--indent-width",
                            vim.bo.tabstop,
                        },
                        stdin = true,
                    }
                end,
            },
            rust = {
                function()
                    return {
                        exe = "rustfmt",
                        args = {
                            "--emit=stdout",
                        },
                        stdin = true,
                    }
                end,
            },
            python = {
                function()
                    return {
                        exe = "black",
                        args = {
                            "--quiet",
                            "-",
                        },
                        stdin = true,
                    }
                end,
            },
        },
    },
}
