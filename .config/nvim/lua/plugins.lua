-- сначала объявление, потом конфигурация
-- editorconfig-vim -- get own settings for each unique project

return require("packer").startup(function(use)

	--- Definition ---
	use "wbthomason/packer.nvim" -- Packer can manage itself
	use "williamboman/mason.nvim" -- Mason
	use "williamboman/mason-lspconfig.nvim"
	use "neovim/nvim-lspconfig"
	use "preservim/nerdtree" -- Advanced version of buildin Netrw plugin
	use "Xuyuanp/nerdtree-git-plugin" -- NerdTree git support 
	use "ryanoasis/vim-devicons" -- Icons for NerdTree and Airline
	use { "hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp", -- nvim-lsp
			"hrsh7th/cmp-buffer", -- buffer
			"hrsh7th/cmp-path", -- path
			"hrsh7th/cmp-cmdline", -- cmdline
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip", -- luasnip
			"rafamadriz/friendly-snippets"
		}
	}
	use "tpope/vim-dotenv" -- по-моему не работает


	--- Configuration ---

	--> packer
	--> mason
	require("mason").setup({
		ui = {
			check_outdated_packages_on_open = true,
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
			keymaps = {
				toggle_package_expand = "<CR>", -- expand a package
				install_package = "i", -- install the package
				update_package = "u", -- update the package
				check_package_version = "c", -- check for new version
				update_all_packages = "U", -- update all
				check_outdated_packages = "C", -- check which installed packages are outdated
				uninstall_package = "X", -- uninstall a package
				cancel_installation = "<C-c>", -- cancel a package installation
				apply_language_filter = "<C-f>", -- apply language filter
			},
		},
	})

	--> mason-lspconfig
	require("mason-lspconfig").setup({})

	--> nvim-lspconfig
	require("lspconfig").lua_ls.setup({ -- Lua
		settings = {
			Lua = {
				diagnostics = {
					globals = {'vim'}, -- get the language server to recognize the `vim` global
				},
			},
		},
	})
	require("lspconfig").clangd.setup({}) -- C-language
	require("lspconfig").texlab.setup({}) -- LaTex
	require("lspconfig").pkgbuild_language_server.setup({}) -- Bash

	--> nerdtree
	--> nerdtree-git-plugin
	--> vim-devicons
	--> nvim-cmp -- нет настройки для friendly-snippets
	require "cmp".setup {
		snippet = {
			expand = function(args)
				require "luasnip".lsp_expand(args.body)
			end,
		},
		sources = {
			{ name = 'nvim_lsp' },
			{ name = 'buffer', option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end},
			},
			{ name = 'path' },
			{ name = 'cmdline' },
			{ name = 'luasnip' },
		},
	}
	--> tpope/vim-dotenv


end)
