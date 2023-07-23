--> termiguicolors & colorscheme
vim.opt.termguicolors = true -- set 256 colors
vim.opt.background = "light" -- if availabe "dark" or "light" set light
vim.opt.signcolumn = "yes" -- show sign column so that text doestn't shift
vim.cmd[[highlight clear SignColumn]] -- when no sign define shows empty column
vim.cmd[[colorscheme lunaperche]] -- set colorscheme

--> line wrapping
vim.opt.wrap = false -- disable line wrapping
vim.opt.linebreak = true -- to wrap on word boundaries (if used wrap)
vim.opt.textwidth = 110 -- maximum width of text that is being inserted

--> tabs & indention
vim.opt.shiftwidth = 4 -- 4 spaces for indent width
vim.opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
vim.opt.autoindent = true -- copy indent from current line when starting new one
vim.opt.cindent = true -- smart indent for C-like languages
vim.opt.backspace = "indent,eol,nostop" -- correct work backspace when indent, end of line or insert mode start position

--> line number
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 11 -- lines above or below cursor when scrolling

--> cursor line 
vim.opt.cursorline = true -- highlight the current cursor line

--> search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- mixed case in your search, assumes you want case-sensitive

--> title
vim.opt.title = true -- title for opened panes

--> clipboard
vim.opt.clipboard:append ("unnamedplus") -- use system clipboard as default register

--> split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

--> spelling
vim.opt.spell = true -- get underline for mistaken words
vim.opt.spelllang = {"en_us", "ru"} -- rus & en dictionaries

--> default nvim auto complete 
vim.opt.completeopt= {"menu", "menuone", "noselect"}

--> redundancy
vim.opt.autoread = true -- read again files that has been changed outside of Vim
vim.opt.swapfile = false -- disable create swap file for specific buffer
vim.opt.undofile = true -- keep undo history between sessions
vim.opt.undodir = ".vim/undo/" -- keep undo files out of file dir
vim.opt.directory = ".vim/swp/" -- keep unsaved changes away from file dir
vim.opt.backupdir = ".vim/backup/" -- backups also should not go to git
