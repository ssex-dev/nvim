local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Anki
	use({ "52617365/nvimanki", requires = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" } })

	-- Vifm
	use("vifm/vifm.vim")

	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use({ "kevinhwang91/nvim-bqf" }) --  Better Quickfix window

	-- Vimspector
	use({ "puremourning/vimspector" })

	-- Floatterm
	use("voldikss/vim-floaterm")

	-- Telescope
	use("nvim-telescope/telescope.nvim") -- Teslecope fuzzy finder
	use("nvim-telescope/telescope-media-files.nvim")

	-- HowMuch
	use("sk1418/HowMuch")

	-- Obsidian
	use({
		"epwalsh/obsidian.nvim",
		config = function()
			require("obsidian").setup({
				dir = "~/Dropbox/Obsidian/Rolf/",
				daily_notes = {
					folder = "dailies",
				},
				completion = {
					nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
				},
			})
		end,
	})

	-- reach
	use("toppair/reach.nvim")

	-- nvim-markdown
	use("ixru/nvim-markdown")

	-- which-key
	use("folke/which-key.nvim")

	-- undotree
	use({
		"simnalamburt/vim-mundo",
		config = function()
			vim.cmd("let g:mundo_preview_bottom = 1")
			vim.cmd("let g:mundo_preview_height = 35")
			vim.cmd("let g:mundo_width = 25")
		end,
	})

	-- colorscheme
	use("aktersnurra/no-clown-fiesta.nvim")

	-- vue
	use("digitaltoad/vim-pug")

	-- Github Copilot
	use("github/copilot.vim")

	-- Rust-tools
	use("simrat39/rust-tools.nvim")
	use("mfussenegger/nvim-dap")

	-- My colorscheme
	use("ssex-dev/stargate-color-nvim")

	-- Colorizer
	use("norcalli/nvim-colorizer.lua")

	-- Colorpicker
	use("blindFS/vim-colorpicker")

	-- autopairs
	use({ "windwp/nvim-autopairs" })

	-- neoscroll
	use({ "karb94/neoscroll.nvim" })

	-- nvim-tree
	use({ "nvim-tree/nvim-tree.lua", requires = {
		"nvim-tree/nvim-web-devicons",
	} })

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- Markdown preview
	use("ellisonleao/glow.nvim")

	-- comment
	use("terrortylor/nvim-comment")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- indent-blankline
	use("lukas-reineke/indent-blankline.nvim")

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/playground")

	-- vim-illuminate
	use("RRethy/vim-illuminate")

	-- neodim
	use({
		"zbirenbaum/neodim",
		event = "LspAttach",
		config = function()
			require("neodim").setup({
				alpha = 0.75,
				blend_color = "#000000",
				update_in_insert = {
					enable = true,
					delay = 100,
				},
				hide = {
					virtual_text = true,
					signs = true,
					underline = true,
				},
			})
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all pluginsjose-elias-alvarez/null-ls.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
