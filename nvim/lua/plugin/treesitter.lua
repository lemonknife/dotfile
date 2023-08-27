return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"vim",
			"vimdoc",
			"fish",
			"cpp",
			"python",
			"json",
			"lua",
			"c_sharp",
			"markdown_inline",
			"java",
			"latex",
			"json5",
			"bash",
			"comment",
			"bibtex",
			"diff",
			"toml",
			"yaml",
			"css",
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
}
