local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

local wk = require("which-key")

-- Remap space as leader key
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

keymap("n", "<Leader>j", "<Esc>", opts)
keymap("i", "<Leader>j", "<Esc>", opts)
keymap("v", "<Leader>j", "<Esc>", opts)

-- Modes
--    normal_mode = "n",
--    insert_mode = "i",
--    visual_mode = "v",
--    visual_block_mode = "x",
--    term_mode = "t",
--    command_mode = "c",
--

-- Single
-- undotree
keymap("n", "U", ":MundoToggle<CR>", opts)

-- Explorer
keymap("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>", opts)
keymap("n", "<Leader>E", "<cmd>Vifm<CR>", opts)

-- Quickfix
keymap("n", "<Leader>qq", ":copen<CR>", opts)
keymap("n", "<A-l>", ":cnext<CR>", opts)
keymap("n", "<A-h>", ":cprevious<CR>", opts)

wk.register({
	a = {
		name = "Anki",
		n = { "<cmd>lua require('nvimanki').create_note()<cr>", "Create Note", noremap = false },
		d = { "<cmd>lua require('nvimanki').create_deck()<cr>", "Create Deck", noremap = false },
		u = { "<cmd>lua require('nvimanki').update_decks()<cr>", "Update Deck", noremap = false },
	},
}, {
	mode = "n",
	prefix = "<Leader>",
})

wk.register({
	f = {
		name = "Find",
		-- Telescope
		f = {
			"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({ previewer = false}))<cr>",
			"Find File",
			noremap = false,
		},
		s = { "<cmd>Telescope possession list<cr>", "Find Session", noremap = false },
		g = { "<cmd>Telescope live_grep<cr>", "Live Grep", noremap = false },
	},
}, {
	mode = "n",
	prefix = "<Leader>",
})

wk.register({
	s = {
		name = "Save and Source, Spell",
		s = { ":w<Cr>", "Write File", noremap = false },
		n = { "]sz=", "Correct Next Spelling Mistake", noremap = false },
		c = { ":source ~/.config/nvim/init.lua<Cr>", "Source Config", noremap = false },
	},
}, {
	mode = "n",
	prefix = "<Leader>",
})

wk.register({
	o = {
		name = "Obsidian",
		t = { "<cmd>ObsidianToday<cr>", "Open Today Node", noremap = false },
		y = { "<cmd>ObsidianYesterday<cr>", "Open Yesterdays Node", noremap = false },
		n = { "<cmd>ObsidianNew ", "New Node with Path", noremap = false },
		ll = { "<cmd>ObsidianLink<cr>", "Visual to Link", noremap = false },
		ln = { "<cmd>ObsidianLink<CR>", "New Link", noremap = false },
		f = { "<cmd>ObsidianFollowLink<cr>", "Follow Link", noremap = false },
		b = { "<cmd>ObsidianBacklinks<cr>", "Backlinks", noremap = false },
		o = { "<cmd>ObsidianOpen ", "Open Node", noremap = false },
		g = { "<cmd>Glow<cr>", "Glow", noremap = false },
		s = { "<cmd>ObsidianSearch<cr>", "Search", noremap = false },
	},
}, {
	mode = "n",
	prefix = "<Leader>",
})

wk.register({
	c = {
		name = "Colors and commends",
		c = { "<cmd>ColorPicker<cr>", "Color Picker", noremap = false },
		t = { "<cmd>ColorizerToggle<Cr>", "Toggle Colorizer", noremap = false },
		j = { "<cmd>CommentToggle<cr>", "Toggle Comment", noremap = false },
		d = { ":lcd %:p:h<CR>", "Change Working Directory", noremap = false },
	},
}, {
	mode = "n",
	prefix = "<Leader>",
})

wk.register({
	r = {
		name = "Search and Replace",
		r = { ":%s///gI<Left><Left><Left><Left>", "Replace in File", noremap = false },
		w = { ":%s/<C-r><C-w>//gI<Left><Left><Left>", "Replace Word in File", noremap = false },
		q = {
			vim.cmd(
				"nnoremap <expr> <leader>RQ ':vim ' . input('Search For: ') . ' **/*<CR>:call QuickFix_toggle()<CR>'"
			),
			"Populate Quick Fix List",
			noremap = false,
		},
		p = { ":cfdo %s//gIc<Left><Left><Left><Left><Left>", "Replace in Quick Fix List", noremap = false },
	},
}, {
	mode = "n",
	prefix = "<Leader>",
})

wk.register({
	r = {
		name = "Search and Replace Visual Selection",
		r = { ":s///gI<Left><Left><Left><Left>", "Replace in File", noremap = false },
		w = { ":s/<C-r><C-w>//gI<Left><Left><Left>", "Replace Word in File", noremap = false },
	},
}, {
	mode = "v",
	prefix = "<Leader>",
})

wk.register({
	l = {
		name = "Languages",
		-- vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
		-- vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		rr = {
			"<cmd>lua require('rust-tools').hover_actions.hover_actions()<CR><cmd>lua require('rust-tools').hover_actions.hover_actions()<CR>",
			"Rust Hover Actions",
			noremap = false,
		},
		ra = {
			"<cmd>lua require('rust-tools').code_action_group.code_action_group()<CR>",
			"Rust Code Actions",
			noremap = false,
		},
	},
}, {
	mode = "n",
	prefix = "<Leader>",
})

wk.register({
	t = {
		name = "Toggle",
		s = { "<cmd>setlocal spell!<CR>", "Spell", noremap = false },
		h = { "<cmd>set hls!<CR>", "Heighlight", noremap = false },
	},
}, {
	mode = "n",
	prefix = "<Leader>",
})

wk.register({
	h = {
		name = "Math",
		r = { ":HowMuch -r<CR>", "Replace Expression with Result", noremap = false },
		s = { ":HowMuch -s<CR>", "Sum", noremap = false },
		e = { ":HowMuch -=<CR>", "Result with Equalsign", noremap = false },
	},
}, {
	mode = "v",
	prefix = "<Leader>",
})

-- Remaps
-- Switch to last buffer
keymap("n", "<Leader>b", "<C-^>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Crtl Backspaced
keymap("n", "<C-bs>", "<C-w>", opts)

-- switch ; and , for f
keymap("n", "<S-l>", ";", opts)
keymap("n", "<S-h>", ",", opts)

-- Keep visual selection for indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Copy to EOL
keymap("n", "Y", "y$", opts)

-- fold
keymap("n", "<Space><Space>", "@=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>", opts)

-- Behavior
-- Undo break points
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "<", "<<c-g>u", opts)
keymap("i", ">", "><c-g>u", opts)
keymap("i", ":", ":<c-g>u", opts)

-- Move line or line selection
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("i", "<A-j>", "<ESC>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<ESC>:m .-2<CR>==gi", opts)
keymap("v", "<A-j>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '>+1<CR>gv=gv", opts)

-- do not populate delete register when pasting over visual selection
keymap("v", "p", '"_dp', opts)

-- Create
-- Adding ; to the end of line
keymap("n", "<Leader>d", "<Esc>A;", opts)
keymap("i", "<Leader>d", "<Esc>A;<Esc>", opts)

-- Create code block with {}
keymap("n", "<Leader>{", "<Esc>A<Space>{<CR>}<Esc>ko", opts)
keymap("i", "<Leader>{", "<Esc>A<Space>{<CR>}<Esc>ko", opts)

-- Create code block with []
keymap("n", "<Leader>[", "<Esc>A<Space>[<CR>]<Esc>ko", opts)
keymap("i", "<Leader>[", "<Esc>A<Space>[<CR>]<Esc>ko", opts)
