local M = {}
local Util = require("config.utils")

local defaults = {
    defaults = {
        autocmds = true,
        keymaps = true,
    },
    colorscheme = "tokyonight",
    -- used by other plugins
    icons = {
        misc = {
            dots = "󰇘",
        },
        dap = {
            Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
            Breakpoint = " ",
            BreakpointCondition = " ",
            BreakpointRejected = { " ", "DiagnosticError" },
            LogPoint = ".>",
        },
        diagnostics = {
            Error = " ",
            Warn = " ",
            Hint = " ",
            Info = " ",
        },
        git = {
            added = " ",
            modified = " ",
            removed = " ",
        },
        kinds = {
            Array = " ",
            Boolean = "󰨙 ",
            Class = " ",
            Codeium = "󰘦 ",
            Color = " ",
            Control = " ",
            Collapsed = " ",
            Constant = "󰏿 ",
            Constructor = " ",
            Copilot = " ",
            Enum = " ",
            EnumMember = " ",
            Event = " ",
            Field = " ",
            File = " ",
            Folder = " ",
            Function = "󰊕 ",
            Interface = " ",
            Key = " ",
            Keyword = " ",
            Method = "󰊕 ",
            Module = " ",
            Namespace = "󰦮 ",
            Null = " ",
            Number = "󰎠 ",
            Object = " ",
            Operator = " ",
            Package = " ",
            Property = " ",
            Reference = " ",
            Snippet = " ",
            String = " ",
            Struct = "󰆼 ",
            TabNine = "󰏚 ",
            Text = " ",
            TypeParameter = " ",
            Unit = " ",
            Value = " ",
            Variable = "󰀫 ",
        },
    },
    kind_filter = {
        default = {
            "Class",
            "Constructor",
            "Enum",
            "Field",
            "Function",
            "Interface",
            "Method",
            "Module",
            "Namespace",
            "Package",
            "Property",
            "Struct",
            "Trait",
        },
        markdown = false,
        help = false,
        lua = {
            "Class",
            "Constructor",
            "Enum",
            "Field",
            "Function",
            "Interface",
            "Method",
            "Module",
            "Namespace",
            -- "Package", -- remove package since luals uses it for control flow structures
            "Property",
            "Struct",
            "Trait",
        },
    },
}

local options

function M.setup()
    options = vim.tbl_deep_extend("force", defaults, opts or {}) or {}
    require("config.utils").setup()
    local lazy_autocmds = vim.fn.argc(-1) == 0
    if not lazy_autocmds then
        M.load("autocmds")
    end
    local group = vim.api.nvim_create_augroup("LnVim", { clear = true })
    vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = "VeryLazy",
        callback = function()
            if lazy_autocmds then
                M.load("autocmds")
            end
            M.load("keymaps")
            Util.track("colorscheme")
            Util.try(function()
                if type(M.colorscheme) == "function" then
                    M.colorscheme()
                else
                    vim.cmd.colorscheme(M.colorscheme)
                end
            end, {
                msg = "Could not load your colorscheme",
                on_error = function(msg)
                    Util.error(msg)
                    vim.cmd.colorscheme("habamax")
                end,
            })
            Util.track()
        end,
    })
end

function M.load(name)
    local function _load(mod)
        -- currently without lazy nvim
        if require("lazy.core.cache").find(mod)[1] then
            Util.try(function()
                require(mod)
            end, { msg = "Failed loading " .. mod })
        end
        require(mod)
    end
    _load("config." .. name)
    if vim.bo.filetype == "lazy" then
        -- HACK: LazyVim may have overwritten options of the Lazy ui, so reset this here
        vim.cmd([[do VimResized]])
    end
    local pattern = "LnVim" .. name:sub(1, 1):upper() .. name:sub(2)
    vim.api.nvim_exec_autocmds("User", { pattern = pattern, modeline = false })
end

M.did_init = false

function M.init()
    if M.did_init then
        return
    end
    M.did_init = true
    M.load("options")
end

setmetatable(M, {
    __index = function(_, key)
        if options == nil then
            return vim.deepcopy(defaults)[key]
        end
        return options[key]
    end,
})

return M
