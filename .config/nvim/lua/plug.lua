-- ~/.config/nvim/lua/plugins/init.lua
vim.cmd [[packadd packer.nvim]]

return require ('packer').startup(function(use)

	--> Packer:
	use	'wbthomason/packer.nvim' 


	--> Mason:
	use {'williamboman/mason.nvim', run = ':MasonUpdate'} -- :MasonUpdate updates registry contents

	require("mason").setup({
		ui = {
			icons = {
				package_installed = "",
				package_pending = "",
				package_uninstalled = "",
			},
		}
	})


	--> Mason-LSPconfig:
	use 'williamboman/mason-lspconfig.nvim'

	require("mason-lspconfig").setup()
	require("lspconfig").pyright.setup {}
	require("lspconfig").lua_ls.setup {}
	require("lspconfig").clangd.setup {}


	--> Nvim-LSPconfig: adding lsp servers
	use 'neovim/nvim-lspconfig'


	--> Completion framework:
    use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'--> LSP completion source:
	--> Useful completion sources:
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/vim-vsnip'

	
	--> Nvim-Treesitter Setup
	use 'nvim-treesitter/nvim-treesitter'

	require('nvim-treesitter.configs').setup {
		ensure_installed = { "lua", "rust", "toml" },
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting=false,
		},
		ident = { enable = true }, 
		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = nil,
		}
	}

	--> nvim DAP (Debug Adapter Protocol)
	use 'mfussenegger/nvim-dap'


	--> Linter and Formater
	use({"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup()
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})

	local null_ls = require("null-ls")
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.diagnostics.eslint,
			null_ls.builtins.completion.spell,
		},
	})

	
	--> Mason Tool-installer 
	--> Allow you to automatically install and update tools via Mason:
	use 'WhoIsSethDaniel/mason-tool-installer.nvim'

	require('mason-tool-installer').setup {

	  ensure_installed = {
		-- you can pin a tool to a particular version { 'golangci-lint', version = 'v1.47.0' },
		-- you can turn off/on auto_update per tool { 'bash-language-server', auto_update = true },
		'lua-language-server',
		'vim-language-server',
		'gopls',
		'stylua',
		'shellcheck',
		'editorconfig-checker',
		'gofumpt',
		'golines',
		'gomodifytags',
		'gotests',
		'impl',
		'json-to-struct',
		'luacheck',
		'misspell',
		'revive',
		'shellcheck',
		'shfmt',
		'staticcheck',
		'vint',
	  },
	  auto_update = false,
	  run_on_start = true,
	  start_delay = 3000, -- 3 second delay
	  debounce_hours = 5, -- at least 5 hours between attempts to install/update
	}


	--> Mason Null-ls
	--> Automatically install the required tools for null-ls sources to work via Mason.
	use 'jay-babu/mason-null-ls.nvim'

	require("mason-null-ls").setup({
    	automatic_setup = true,
	})


	--> Mason DAP
	--> Automatically install the required tools for nvim-dap adapters to work via Mason.
	use 'jay-babu/mason-nvim-dap.nvim'

	require("mason-nvim-dap").setup({
		ensure_installed = {},
		automatic_installation = false,
		handlers = nil
	})


end)
