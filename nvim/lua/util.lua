local M = {}

M.shell_call = function(args)
    local output = vim.fn.system(args)
    assert(vim.v.shell_error == 0, "External call failed with error code: " .. vim.v.shell_error .. "\n" .. output)
end

M.echo = function(str)
    vim.cmd("redraw")
    vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end

M.set_map = function(section)
    local map = require("config.map")
    for mode, mode_values in pairs(map[section]) do
        local modes = {}
        for char in mode:gmatch(".") do
            table.insert(modes, char)
        end

        for mapping, keybind in pairs(mode_values) do
            local actual_key = type(keybind) == "table" and keybind[1] or keybind
            local options = type(keybind) == "table" and keybind[2] or { noremap = true, silent = false }
            vim.keymap.set(modes, mapping, actual_key, options)
        end
    end
end

M.set_vim = function(setting)
    for section, opt_table in pairs(setting) do
        for opt, set in pairs(opt_table) do
            vim[section][opt] = set
        end
    end
end

M.lazy_map = function(plug)
    local map = require("config.map")
    local keys = {}
    for mode, mode_values in pairs(map[plug]) do
        local modes = {}
        for char in mode:gmatch(".") do
            table.insert(modes, char)
        end

        for mapping, keybind in pairs(mode_values) do
            local actual_key = type(keybind) == "table" and keybind[1] or keybind
            local options = type(keybind) == "table" and keybind[2] or { noremap = true, silent = true }
            table.insert(keys, { mapping, actual_key, modes, options })
        end
    end
    return keys
end

M.init_plug = function()
    local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazy_path) then
        M.echo("  Installing lazy.nvim & plugins ...")
        local repo = "https://github.com/folke/lazy.nvim.git"
        M.shell_call({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazy_path })
    end
    vim.opt.rtp:prepend(lazy_path)

    local lazy_opts = require("config.lazy")
    require("lazy").setup(lazy_opts)
end

return M
