vim.g.mapleader = " " -- set leader key to space

-- for Russian language
--vim.cmd("set keymap=russian-jcukenwin")
--vim.cmd("set iminsert=0")
--vim.cmd("set imsearch=0")

local expr_opts = { noremap = true, expr = true, silent = true }

-- soft wrap remap
--vim.keymap.set( { "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", expr_opts )
--vim.keymap.set( { "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", expr_opts )
--vim.keymap.set( { "n", "v" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", expr_opts )
--vim.keymap.set( { "n", "v" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", expr_opts )

-- copy default register to/from system/mouse clipboard
vim.keymap.set( { "n", "v", "x" }, '<Leader>y', ':let @+=@"<CR>' )
vim.keymap.set( { "n", "v", "x" }, '<Leader>p', ':let @"=@+<CR>' )
vim.keymap.set( { "n", "v", "x" }, '<Leader>Y', ':let @*=@"<CR>' )
vim.keymap.set( { "n", "v", "x" }, '<Leader>P', ':let @"=@*<CR>' )

--clear search highlights
vim.keymap.set( "n", "<leader>nh", ":nohl<CR>" )
 
-- delete single character without copying into register
--vim.keymap.set( "n", "x", '"_x"' ) 

-- increment/decrement
vim.keymap.set( "n", "<leader>+", "<C-a>" )
vim.keymap.set( "n", "<leader>-", "<C-x>" )

-- navigate windows
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")

vim.keymap.set("n", "<leader>wr", "<C-w>r")
vim.keymap.set("n", "<leader>wR", "<C-w>R")

-- move line or v-block
--vim.keymap.set( "i", "<C-j>", "<Esc><cmd>m .+1<CR>==gi" )
--vim.keymap.set( "i", "<C-k>", "<Esc><cmd>m .-2<CR>==gi" )
--vim.keymap.set( "x", "J", ":m '>+1<CR>gv-gv", { noremap = true, silent = true } )
--vim.keymap.set( "x", "K", ":m '<-2<CR>gv-gv", { noremap = true, silent = true } )

-- stay in indent mode
--vim.keymap.set( "v", ">", ">gv", { noremap = true, silent = true } )
--vim.keymap.set( "v", "<", "<gv", { noremap = true, silent = true } )

-- window management
vim.keymap.set( "n", "<leader>wv", "<C-w>v" ) -- split window vertically
vim.keymap.set( "n", "<leader>wh", "<C-w>s" ) -- split window horizontally
vim.keymap.set( "n", "<leader>we", "<C-w>=" ) -- make split windows equal width & height
vim.keymap.set( "n", "<leader>wc", ":close<CR>" ) -- close current split window

-- tabs
vim.keymap.set( "n", "<leader>to", ":tabnew<CR>" ) -- open new tab
vim.keymap.set( "n", "<leader>tx", ":tabclose<CR>" ) -- close current tab
vim.keymap.set( "n", "<leader>tn", ":tabn<CR>" ) --  go to next tab
vim.keymap.set( "n", "<leader>tp", ":tabp<CR>" ) --  go to previous tab

-- buffers
vim.keymap.set( "n", "<leader>bo", ":new<CR>" ) -- open new tab
vim.keymap.set( "n", "<leader>bd", ":bdelete<CR>" ) -- close current tab
vim.keymap.set( "n", "<leader>bn", ":bn<CR>" ) --  go to next tab
vim.keymap.set( "n", "<leader>bp", ":bp<CR>" ) --  go to previous tab
