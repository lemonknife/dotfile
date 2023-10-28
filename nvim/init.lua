-- init each modules
require("config")

-- init plugin
local shell_call = function(args)
    local output = vim.fn.system(args)
    assert(vim.v.shell_error == 0, "External call failed with error code: " .. vim.v.shell_error .. "\n" .. output)
end

local echo = function(str)
    vim.cmd("redraw")
    vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end

local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
    echo("  Installing lazy.nvim & plugins ...")
    local repo = "https://github.com/folke/lazy.nvim.git"
    shell_call({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazy_path })
end
vim.opt.rtp:prepend(lazy_path)

local lazy_opts = require("config.lazy")
require("lazy").setup(lazy_opts)

if vim.g.neovide then
    vim.o.guifont = "CaskaydiaCove Nerd Font Propo"
    vim.g.neovide_scale_factor = 1.5
    vim.g.neovide_transparency = 1
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_padding_top = 10
    vim.g.neovide_padding_bottom = 10
    vim.g.neovide_padding_right = 10
    vim.g.neovide_padding_left = 10
end
