-- ~/.config/nvim/lua/plugins/init.lua
vim.cmd [[packadd packer.nvim]]

return require ('packer').startup(function(use)

	use 'wbthomason/packer.nvim'

	use 'williamboman/mason.nvim'
		-- Mason Setup
		require("mason").setup({
		    ui = {
		        icons = {
		            package_installed = "",
		            package_pending = "",
		            package_uninstalled = "",
		        },
		    }
		})
	
	use 'williamboman/mason-lspconfig.nvim'
		-- Mason-lspconfig Setup	
		require("mason-lspconfig").setup()
	
	use 'neovim/nvim-lspconfig'

	use 'simrat39/rust-tools.nvim'
		-- Rust-tools Setup
		local rt = require("rust-tools")
		rt.setup({
		    server = {
		    	on_attach = function(_, bufnr)
		      -- Hover actions
		      	vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
		      -- Code action groups
		      	vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		    	end,
			},
		})	

	-- Completion framework:
    use 'hrsh7th/nvim-cmp' 

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'                             
    use 'hrsh7th/cmp-path'                              
    use 'hrsh7th/cmp-buffer'                            
    use 'hrsh7th/vim-vsnip'
	
	use 'nvim-treesitter/nvim-treesitter'
		-- Treesitter Plugin Setup
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
	

end)
