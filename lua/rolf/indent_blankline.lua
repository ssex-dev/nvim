vim.cmd [[highlight IndentBlanklineChar guifg=#002539 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#486E3B gui=nocombine]]

vim.opt.list = true

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
}
