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

vim.keymap.set("n", "<leader>wr", "<C-w>r") -- round clockwise
vim.keymap.set("n", "<leader>wR", "<C-w>R") -- round conterclockwise

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
vim.keymap.set( "n", "<leader>ws", "<C-w>s" ) -- split window horizontally
vim.keymap.set( "n", "<leader>we", "<C-w>=" ) -- make split windows equal width & height
vim.keymap.set( "n", "<leader>wc", ":close<CR>" ) -- close current split window

vim.keymap.set( "n", "<leader>e", ":NERDTreeToggle<CR>" ) -- open explore

-- tabs
vim.keymap.set( "n", "<leader>to", ":tabnew<CR>" ) -- open new tab
vim.keymap.set( "n", "<leader>tc", ":tabclose<CR>" ) -- close current tab
vim.keymap.set( "n", "<leader>tn", ":tabn<CR>" ) --  go to next tab
vim.keymap.set( "n", "<leader>tp", ":tabp<CR>" ) --  go to previous tab

-- buffers
vim.keymap.set( "n", "<leader>bo", ":new<CR>" ) -- open new tab
vim.keymap.set( "n", "<leader>bc", ":bdelete<CR>" ) -- close current tab
vim.keymap.set( "n", "<leader>bn", ":bn<CR>" ) --  go to next tab
vim.keymap.set( "n", "<leader>bp", ":bp<CR>" ) --  go to previous tab

-- for telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- for LuaShip
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

-- Debugger
vim.api.nvim_set_keymap("n", "<leader>dt", "<cmd> DapUiToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>db", "<cmd> DapToggleBreakpoint<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>dc", "<cmd> DapContinue<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>dr", "<cmd> lua require('dapui').open({reset = true})<CR>", {noremap=true})

