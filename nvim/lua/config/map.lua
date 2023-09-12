local M = {}

M.general = {
    ["i"] = {
        ["<C-j>"] = "<C-h>",
    },
    ["nox"] = {
        -- replacement for movement
        ["i"] = "k",
        ["I"] = "K",
        ["k"] = "j",
        ["K"] = "J",
        ["j"] = "h",
        ["J"] = "H",
        ["h"] = "i",
        ["H"] = "I",
        ["<C-j>"] = "<C-w>h",
        ["<C-k>"] = "<C-w>j",
        ["<C-i>"] = "<C-w>k",
        ["<C-l>"] = "<C-w>l",
        [";"] = ":",
    },
    ["n"] = {
        ["<leader>sv"] = "<C-w>v",
        ["<leader>sh"] = "<C-w>s",
        ["<leader>sc"] = "<C-w>q",
        -- close all highlight for searching results
        ["<leader>nh"] = ":nohl<CR>",

        -- resize with arrows
        ["<C-Up>"] = ":resize -2<CR>",
        ["<C-Down>"] = ":resize +2<CR>",
        ["<C-Left>"] = ":vertical resize -2<CR>",
        ["<C-Right>"] = ":vertical resize +2<CR>",

        -- save files
        -- ["<C-s>"] = "<cmd> w <CR>",
    },

    ["t"] = {
        -- Terminal window navigation
        ["<C-j>"] = "<C-\\><C-N><C-w>h",
        ["<C-k>"] = "<C-\\><C-N><C-w>j",
        ["<C-i>"] = "<C-\\><C-N><C-w>k",
        ["<C-l>"] = "<C-\\><C-N><C-w>l",
    },
    ["x"] = {
        -- Move current line / block with Alt-j/k ala vscode.
        ["<A-i>"] = ":m '<-2<CR>gv-gv",
        ["<A-k>"] = ":m '>+1<CR>gv-gv",
    },
}

M.treesitter = {
    ["n"] = {
        ["<C-,>"] = "gg=G"
    }
}

local function check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

M.coc= {
    ["i"] = {
        ["<CR>"] = { function ()
            if vim.fn['coc#pum#visible']() == 1 then
                return vim.fn['coc#_select_confirm']();
            end
            return "<CR>"
        end,
            { expr = true }
        },
        ["<Tab>"] = { function()
            if vim.fn['coc#pum#visible']() == 1 then
                return vim.fn['coc#pum#next'](1)
            end
            return "<Tab>"
        end,
            { expr = true }
        },
        ["<S-Tab>"] = { function ()
            if vim.fn['coc#pum#visible']() == 1 then
                return vim.fn['coc#pum#prev'](1)
            end
            if check_back_space then
                return vim.fn['coc#refresh']()
            end
            return "<S-Tab>"
        end,
            { expr = true }
        },
        ["<Esc>"] = { function ()
            if vim.fn["coc#pum#visible"]() == 1 then
                return vim.fn["coc#pum#cancel"]()
            end
            return "<Esc>"
        end,
            { expr = true }
        }
    }
}


return M
