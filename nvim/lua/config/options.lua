-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- file encoding
vim.g.encoding = "UTF-8"

-- file encoding
vim.o.fileencoding = "utf-8"

-- surrounding
vim.o.scrolloff = 8
vim.o.sidescrolloff = 14

-- row number
vim.opt.relativenumber = true
vim.opt.number = true

-- indent
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.cursorline = true

-- default position of splited windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- appearence
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.clipboard:append("unnamedplus")
