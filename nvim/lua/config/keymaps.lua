local M = {}
local mode_n = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }

local map = vim.keymap.set

map(mode_i, "<C-k>", "<C-j>")
map(mode_i, "<C-j>", "<C-h>")

map(mode_n, "<C-h>", "<C-w>h")
map(mode_n, "<C-j>", "<C-w>j")
map(mode_n, "<C-k>", "<C-w>k")
map(mode_n, "<C-l>", "<C-w>l")
map(mode_n, "s", "")
map(mode_n, ";", ":")

-- close all highlight for searching results
map(mode_n, "<leader>nh", ":nohl<CR>")

map("n", "<leader>sv", "<C-w>v")
map("n", "<leader>sh", "<C-w>s")
map("n", "<leader>sc", "<C-w>q")

-- resize with arrows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- save files
map("n", "<C-s>", ":w <CR>")
map(mode_v, "<A-k>", ":m '<-2<CR>gv-gv")
map(mode_v, "<A-j>", ":m '>+1<CR>gv-gv")
