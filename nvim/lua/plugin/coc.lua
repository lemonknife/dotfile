return {
    "neoclide/coc.nvim",
    lazy = false,
    branch = "master",
    build = "npm ci",
    init = require("util").set_map("coc")
}
