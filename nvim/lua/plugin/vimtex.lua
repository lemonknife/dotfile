return {
    "lervag/vimtex",
    init = function()
        vim.g.tex_flavor = "latex"
        vim.g.vimtex_view_general_viewer = "zathura"
        vim.g.vimtex_view_method = "zathura"
        vim.g.Tex_CompileRule_pdf = "xelatex -synctex=1 --interaction=nonstopmode $*"
        vim.g.vimtex_compiler_latexmk_engines = {
            _ = "-xelatex",
        }
        vim.g.tex_comment_nospell = 1
        vim.g.vimtex_compiler_progname = "nvr"
        vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_quickfix_mode = 0
    end,
    ft = "tex",
}
