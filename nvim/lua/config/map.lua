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
        ["<leader>sv"] = "<C-w>v",
        ["<leader>sh"] = "<C-w>s",
        ["<leader>sc"] = "<C-w>q",
        -- close all highlight for searching results
        ["<leader>nh"] = ":nohl<CR>",

        -- resize with arrows
        ["<C-Up>"] = ":resize -2<CR>",
        ["<C-Down>"] = ":resize +2<CR>",
        ["<C-Left>"] = ":vertical resize -2<CR>",
        ["<C-Right>"] = ":vertical resize +2<CR>",

        -- save files
        ["<C-s>"] = ":w <CR>",
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
}

-- nvim-tree keymap
M.tree = {
    ["n"] = {
        ["<leader>e"] = { ":NvimTreeToggle<CR>", { noremap = true, silence = true } },
    },
}

-- treesitter keymap
M.treesitter = {
    ["n"] = {
        ["<C-,>"] = "gg=G``",
    },
}

return M
