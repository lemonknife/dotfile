local util = require("util")

local vim_setting = {}
vim_setting.g = {
    tex_flavor = "latex",
    vimtex_view_general_viewer = "zathura",
    vimtex_view_method = "zathura",
    Tex_CompileRule_pdf = "xelatex -synctex=1 --interaction=nonstopmode $*",
    vimtex_compiler_latexmk_engines = {
        _ = "-xelatex",
    },
    tex_comment_nospell = 1,
    vimtex_compiler_progname = "nvr",
    vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]],
    vimtex_compiler_method = "latexmk",
    vimtex_quickfix_mode = 0,
}

return {
    "lervag/vimtex",
    init = util.set_vim(vim_setting),
    ft = "tex",
}
