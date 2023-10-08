local M = {}

M.g = {
    -- leader
    mapleader = " ",
    maplocalleader = " ",

    -- file encoding
    encoding = "UTF-8",
}

M.o = {
    -- file encoding
    fileencoding = "utf-8",

    -- surrounding
    scrolloff = 8,
    sidescrolloff = 14,
}

M.opt = {
    -- row number
    relativenumber = true,
    number = true,

    -- indent
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    autoindent = true,

    wrap = false,

    cursorline = true,

    -- default position of splited windows
    splitright = true,
    splitbelow = true,

    -- search
    ignorecase = true,
    smartcase = true,

    -- appearence
    termguicolors = true,
    signcolumn = "yes",
}

vim.opt.clipboard:append("unnamedplus")

return M
