local M = {}

M.general = {
	["i"] = {
		["<C-k>"] = "<C-j>",
		["<C-j>"] = "<C-h>",
	},
	["nox"] = {
		-- replacement for movement
		["i"] = "k",
		["I"] = "K",
		["k"] = "j",
		["K"] = "J",
		["j"] = "h",
		["J"] = "H",
		["h"] = "i",
		["H"] = "I",
		["<C-j>"] = "<C-w>h",
		["<C-k>"] = "<C-w>j",
		["<C-i>"] = "<C-w>k",
		["<C-l>"] = "<C-w>l",
		[";"] = ":",
	},
	["n"] = {
		-- close all highlight for searching results
		["<leader>nh"] = ":nohl<CR>",

		-- resize with arrows
		["<C-Up>"] = ":resize -2<CR>",
		["<C-Down>"] = ":resize +2<CR>",
		["<C-Left>"] = ":vertical resize -2<CR>",
		["<C-Right>"] = ":vertical resize +2<CR>",

		-- save files
		-- ["<C-s>"] = "<cmd> w <CR>",
	},

	["t"] = {
		-- Terminal window navigation
		["<C-j>"] = "<C-\\><C-N><C-w>h",
		["<C-k>"] = "<C-\\><C-N><C-w>j",
		["<C-i>"] = "<C-\\><C-N><C-w>k",
		["<C-l>"] = "<C-\\><C-N><C-w>l",
	},
	["x"] = {
		-- Move current line / block with Alt-j/k ala vscode.
		["<A-i>"] = ":m '<-2<CR>gv-gv",
		["<A-k>"] = ":m '>+1<CR>gv-gv",
	},

	["c"] = {
		-- navigate tab completion with <c-j> and <c-k>
		-- runs conditionally
		["<C-k>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
		["<C-i>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
	},
}

M.treesitter = {
    ["n"] = {
        ["<C-,>"] = "gg=G"
    }
}

return M
