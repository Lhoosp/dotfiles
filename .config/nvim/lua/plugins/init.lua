-- ~/.config/nvim/lua/plugins/init.lua
vim.cmd [[packadd packer.nvim]]

return require ('packer').startup(function(use)

	use 'wbthomason/packer.nvim'

	use 'neovim/nvim-lspconfig'

 	-- highlight hex name of color
	use 'brenoprata10/nvim-highlight-colors'

end)
