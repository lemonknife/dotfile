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
			local options = type(keybind) == "table" and keybind[2] or { noremap = true, silent = true }
			vim.keymap.set(modes, mapping, actual_key, options)
		end
	end
end

M.set_vim = function(setting)
	for section, opt_table in pairs(setting) do
		for opt, set in pairs(opt_table) do
			if type(set) == "string" and string.sub(set, 1, 1) == ":" then
				vim[section][opt]:append(string.sub(set, 2))
			else
				vim[section][opt] = set
			end
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

M.load_plug = function()
	local lfs = require("lfs")
	local plugins = {}
	path = os.getenv("HOME") .. "/.config/nvim/lua/plugin/"

	for file in lfs.dir(path) do
		if lfs.attributes(path .. file).mode == "file" then
			table.insert(plugins, require("plugin." .. string.gsub(file, "%.lua$", "")))
		end
	end
	return plugins
end

M.init_plug = function(plugins)
	local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazy_path) then
		F.echo("  Installing lazy.nvim & plugins ...")
		local repo = "https://github.com/folke/lazy.nvim.git"
		shell_call({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazy_path })
	end
	vim.opt.rtp:prepend(lazy_path)

	local lazy_opts = require("config.lazy")
	require("lazy").setup(plugins, lazy_opts)
end

return M
