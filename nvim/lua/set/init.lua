local lfs = require("lfs")
local M = {}

path = os.getenv( "HOME" ) .. "/.config/nvim/lua/set/"

for file in lfs.dir(path) do
    if lfs.attributes(path .. file).mode == "file" and file ~= "init.lua" then
        table.insert(M, require("set." .. string.gsub(file, "%.lua$", "")))
    end
end

return M
