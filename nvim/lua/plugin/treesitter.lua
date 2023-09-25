return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
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
            "regex",
            "rust",
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
    },
    init = function()
        local util = require("util")
        util.set_map("treesitter")
    end,
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
