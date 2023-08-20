local M = {}

F = require("core.function")

local function shell_call(args)
	local output = vim.fn.system(args)
	assert(vim.v.shell_error == 0, "External call failed with error code: " .. vim.v.shell_error .. "\n" .. output)
end

M.lazy = function()
	local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazy_path) then
		F.echo("  Installing lazy.nvim & plugins ...")
		local repo = "https://github.com/folke/lazy.nvim.git"
		shell_call({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazy_path })
	end
	vim.opt.rtp:prepend(lazy_path)
end

return M
