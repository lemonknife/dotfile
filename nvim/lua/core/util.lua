local M = {}

M.echo = function(str)
	vim.cmd("redraw")
	vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end

M.set_map = function(section)
	map = require("core.map")
	for mode, mode_values in pairs(map[section]) do
		local modes = {}
		for char in mode:gmatch(".") do
			table.insert(modes, char)
		end

		for _, current_mode in ipairs(modes) do
			for mapping, keybind in pairs(mode_values) do
				local actual_key = type(keybind) == "table" and keybind[1] or keybind
				local options = type(keybind) == "table" and keybind[2] or { noremap = true, silent = true }
				vim.keymap.set(current_mode, mapping, actual_key, options)
			end
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
return M
