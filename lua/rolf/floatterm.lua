vim.cmd("let g:floaterm_keymap_toggle = '<leader>ht'")
vim.cmd("let g:floaterm_keymap_kill = '<leader>hk'")

local wk = require("which-key")
wk.register({
	h = {
		name = "Floterm",
		l = { ":FloatermNew --autoclose=2 lazygit<CR>", "Lazygit", noremap = false },
		h = { ":FloatermNew --autoclose=2 dijo<CR>", "Habittracker", noremap = false },
		r = { ":FloatermNew --autoclose=0 cargo run<CR>", "Rust", noremap = false },
	},
}, {
	mode = "n",
	prefix = "<Leader>",
})
