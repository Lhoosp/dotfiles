-- neovim default configuration
vim.opt.background = 'light'
vim.cmd[[colorscheme shine]]
vim.opt.termguicolors = true

vim.opt.backspace = 'indent,eol,nostop'

vim.opt.wrap = false
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 7

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.title = true

vim.opt.clipboard:prepend { 'unnamed' , 'unnamedplus' }

vim.opt.autoread = true

vim.opt.swapfile = false

