local M = {}

M.echo = function(str)
	vim.cmd("redraw")
	vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end

M.set_map = function()
	map = require("core.map")
	for mode, mode_values in pairs(map.general) do
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
    map = require("core.map")
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

return M
