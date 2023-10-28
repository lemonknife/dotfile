return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
        vim.keymap.set("n", "<A-l>", ":bnext<CR>", { noremap = true })
        vim.keymap.set("n", "<A-j>", ":bprevious<CR>", { noremap = true })
    end,
    opts = {
        options = {
            -- 使用 nvim 内置lsp
            diagnostics = "nvim_lsp",
            -- 左侧让出 nvim-tree 的位置
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "left",
                },
            },
        },
    },
}
