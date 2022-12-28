-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
	auto_reload_on_write = true,
	open_on_setup = true,
	hijack_unnamed_buffer_when_opening = true,
	hijack_cursor = true,
	sync_root_with_cwd = true,
	reload_on_bufenter = true,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = true,
		debounce_delay = 50,
		show_on_dirs = true,
		icons = { hint = "", info = "", warning = "", error = "" },
	},
	git = {
		enable = false,
		ignore = true,
		show_on_dirs = false,
		timeout = 400,
	},
	view = {
		adaptive_size = true,
		centralize_selection = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
				{ key = "l", action = "edit" },
				{ key = "<C-c>", action = "cd" },
				{ key = "h", action = "close_node" },
			},
		},
	},
	renderer = {
		group_empty = true,
		full_name = true,
		indent_width = 1,
		indent_markers = {
			enable = true,
			inline_arrows = false,
		},
	},
	filters = {
		dotfiles = false,
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
		remove_file = {
			close_window = true,
		},
	},
})
