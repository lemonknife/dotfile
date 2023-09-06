return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- lazy = false,
    opts = {
        ensure_installed = {
            "bash",
            "bibtex",
            "c_sharp",
            "comment",
            "cpp",
            "css",
            "diff",
            "fish",
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore", 
            "java",
            "json",
            "json5",
            "latex",
            "lua",
            "markdown_inline",
            "python",
            "scss",
            "toml",
            "vim",
            "vimdoc",
            "yaml",
            "yuck",
        },

        highlight = { enable = true },
        indent = { enable = true },

        -- 不同括号颜色区分
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
        },

        --启用增量选择
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<CR>",
                node_incremental = "<CR>",
                node_decremental = "<BS>",
                scope_incremental = "<TAB>",
            },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
    keys = require("util").lazy_map("treesitter"),
}
