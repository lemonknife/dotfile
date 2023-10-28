local M = {}
local mode_n = { "n", "v", "o" }
local mode_v = { "v" }
local mode_i = { "i" }

local mapping = {
    { from = "<C-k>", to = "<C-j>", mode = mode_i },
    { from = "<C-j>", to = "<C-h>", mode = mode_i },

    -- replacement for movement
    { from = "i", to = "k", mode = mode_n },
    { from = "I", to = "K", mode = mode_n },
    { from = "k", to = "j", mode = mode_n },
    { from = "K", to = "J", mode = mode_n },
    { from = "j", to = "h", mode = mode_n },
    { from = "J", to = "H", mode = mode_n },
    { from = "h", to = "i", mode = mode_n },
    { from = "H", to = "I", mode = mode_n },
    { from = "<C-j>", to = "<C-w>h", mode = mode_n },
    { from = "<C-k>", to = "<C-w>j", mode = mode_n },
    { from = "<C-i>", to = "<C-w>k", mode = mode_n },
    { from = "<C-l>", to = "<C-w>l", mode = mode_n },
    { from = ";", to = ":", mode = mode_n },
    { from = "<leader>nh", to = ":nohl<CR>", mode = mode_n },

    { from = "<leader>sv", to = "<C-w>v" },
    { from = "<leader>sh", to = "<C-w>s" },
    { from = "<leader>sc", to = "<C-w>q" },
    -- close all highlight for searching results

    -- resize with arrows
    { from = "<C-Up>", to = ":resize -2<CR>" },
    { from = "<C-Down>", to = ":resize +2<CR>" },
    { from = "<C-Left>", to = ":vertical resize -2<CR>" },
    { from = "<C-Right>", to = ":vertical resize +2<CR>" },

    -- save files
    { from = "<C-s>", to = ":w <CR>" },
    -- ["t"] = {
    -- Terminal window navigation
    -- ["<C-j>"] = "<C-\\><C-N><C-w>h",
    -- ["<C-k>"] = "<C-\\><C-N><C-w>j",
    -- ["<C-i>"] = "<C-\\><C-N><C-w>k",
    -- ["<C-l>"] = "<C-\\><C-N><C-w>l",
    -- },
    -- Move current line / block with Alt-j/k ala vscode.
    { from = "<A-i>", to = ":m '<-2<CR>gv-gv", mode = mode_v },
    { from = "<A-k>", to = ":m '>+1<CR>gv-gv", mode = mode_v },
}

for _, map in ipairs(mapping) do
    vim.keymap.set(map.mode or "n", map.from, map.to, { noremap = true })
end

return M
