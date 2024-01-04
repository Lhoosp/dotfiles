return require("packer").startup(function(use)
-----------------------------------------------------------------------------------------

	--- DEFINITION ---

-----------------------------------------------------------------------------------------
	use "wbthomason/packer.nvim" -- packer can manage itself
	use "williamboman/mason.nvim" -- mason
	use "williamboman/mason-lspconfig.nvim"
	use "neovim/nvim-lspconfig"
	use "preservim/nerdtree" -- advanced version of buildin Netrw plugin
	use "Xuyuanp/nerdtree-git-plugin" -- nerdTree git support 
	use "ryanoasis/vim-devicons" -- icons for NerdTree and Airline
	use { "hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp", -- nvim-lsp
			"hrsh7th/cmp-buffer", -- buffer
			"hrsh7th/cmp-path", -- path
			"hrsh7th/cmp-cmdline", -- cmdline
			"L3MON4D3/LuaSnip", -- luasnip
			"saadparwaiz1/cmp_luasnip", -- luasnip
			"rafamadriz/friendly-snippets" -- vscode style snippet
		}
	}
	--use "tpope/vim-dotenv" -- по-моему не работает, ожидается, что будет импортировать глобальные переменные
	use {"nvim-telescope/telescope.nvim", -- fuzzy search
  		requires = {
			"nvim-lua/plenary.nvim", -- all lua function
		},
	}
	use "numToStr/Comment.nvim" -- comment to gc(line comment) and gb(block comment) in all language
	-- use "shaunsingh/solarized.nvim" -- nvim solarized colorscheme
	use "sainnhe/gruvbox-material" -- modified nvim gruvbox theme
	-- use "lervag/vimtex" -- LaTex in neovim

	-- DAP +++
	use "jay-babu/mason-nvim-dap.nvim"
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
	--use "theHamsta/nvim-dap-virtual-text"
	require("dapui").setup()
	-- require("codelldb").setup()
	require("mason-nvim-dap").setup({
    	automatic_setup = true,
	})
	require("dap").adapters.lldb = {
		type = "executable",
		command = "/usr/bin/lldb-vscode", -- adjust as needed
		name = "lldb",
	}

	local lldb = {
		name = "Launch lldb",
		type = "lldb", -- matches the adapter
		request = "launch", -- could also attach to a currently running process
		program = function()
			return vim.fn.input(
				"Path to executable: ",
				vim.fn.getcwd() .. "/",
				"file"
			)
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		runInTerminal = false,
	}
	require('dap').configurations.c = {
		lldb -- different debuggers or more configurations can be used here
	}

    local dap = require('dap')
    dap.configurations.python = {
      {
        type = 'python';
        request = 'launch';
        name = "Launch file";
        program = "${file}";
        pythonPath = function()
          	return '/usr/bin/python'
        end;
      },
    }


-----------------------------------------------------------------------------------------

	--- CONFIGURATION ---

-----------------------------------------------------------------------------------------

	--> packer

	-----------
	-- mason -- 
	-----------
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

	---------------------
	-- mason-lspconfig --
	---------------------
	require("mason-lspconfig").setup({})

	--------------------
	-- nvim-lspconfig --
	--------------------
	require("lspconfig").lua_ls.setup({ -- Lua
		settings = {
			Lua = {
				diagnostics = {
					globals = {'vim', 'ls'}, -- get the language server to recognize the `vim` global
				},
			},
		},
	})
	require("lspconfig").clangd.setup({}) -- C-language
	require("lspconfig").texlab.setup({}) -- LaTex
	require("lspconfig").pkgbuild_language_server.setup({}) -- Bash
	require'lspconfig'.vale_ls.setup{}

	--> nerdtree

	--> nerdtree-git-plugin

	--> vim-devicons

	--------------
	-- nvim-cmp -- 
	--------------

	local has_words_before = function()
		unpack = unpack or table.unpack
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	  	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	local luasnip = require("luasnip")
	local cmp = require("cmp")

	require("cmp").setup({
		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		  	end,
		},
		window = {
       		completion = cmp.config.window.bordered(),
      		documentation = cmp.config.window.bordered(),
    	},
		sources = {
			{name = "nvim_lsp"},
			{name = "buffer", option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end},
			},
			{name = "path"},
			{name = "luasnip"},
		},
		mapping = {
			['<C-Space>'] = cmp.mapping.complete(),
			['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

			["<Tab>"] = cmp.mapping(function(fallback) -- map <tab> for choose cmp suggestion
			  	if cmp.visible() then
					cmp.select_next_item()
			  	elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
			  	elseif has_words_before() then
					cmp.complete()
			  	else
					fallback()
			  	end
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
			  	if cmp.visible() then
					cmp.select_prev_item()
			  	elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
			  	else
					fallback()
			  	end
			end, { "i", "s" }),
		},
		diagnostics = {
			globals = {'ls'}, -- get the language server to recognize the `vim` global
		},

	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
	 	sources = cmp.config.sources({
	   		{ name = 'path' },
	   		{ name = 'cmdline' }
	 	})
	})

	require("luasnip.loaders.from_vscode").lazy_load({}) -- activate friendly-snippets

	--> tpope/vim-dotenv

	---------------
	-- telescope --
	---------------
	require("telescope").setup({})

	-------------
	-- comment --
	-------------
	require("Comment").setup({}) -- "gc" for comment line; "gb" comment block

	---------------
	-- solarized --
	---------------
	--require("solarized").set()

	--> sainnhe/gruvbox-material

	--> lervag/vimtex 
end)
-----------------------------------------------------------------------------------------

-- editorconfig-vim -- get own settings for each unique project
