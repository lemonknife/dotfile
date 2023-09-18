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
    ft = {
        "lua",
        "rs",
    },
    opts = {
        filetype = {
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
