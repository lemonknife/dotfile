return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>e", ":NvimTreeToggle<CR>", "n", { noremap = true, silent = true } },
    },
    config = function()
        require("nvim-tree").setup({})
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
}
