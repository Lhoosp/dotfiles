--nvim-colorscheme 
	-- For default colorschemes
	-- vim.cmd[[colorscheme lunaperche]] -- setup colorscheme
	-- vim.opt.background = "light" -- if availabe "dark" or "light" set light

	-- For solarized theme--
	--[[ vim.g.solarized_italic_comments = true
	vim.g.solarized_italic_keywords = true
	vim.g.solarized_italic_functions = true
	vim.g.solarized_italic_variables = false
	vim.g.solarized_contrast = true
	vim.g.solarized_borders = false
	vim.g.solarized_disable_background = false ]]

	-- For light version gruvbox
	vim.opt.background = "light"
	vim.g.gruvbox_material_background = "medium"
	vim.g.gruvbox_material_better_performance = 1
	vim.cmd[[ colorscheme gruvbox-material ]] -- setup colorscheme


--> For VimText Plugin
	vim.g.tex_flavor = "latex"
	--vim.g.vimtex_quickfix_mode = 0
	vim.cmd('filetype plugin indent on')
	vim.cmd('syntax enable')
	vim.g.vimtex_view_method = 'zathura'
	vim.g.vimtex_view_general_viewer = 'zathura'--'okular'
	--vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
	vim.g.vimtex_compiler_method = 'latexrun' -- если захочется изменить компилятор то синтаксис такой
	--vim.g.maplocalleader = "," -- по-умолчанию '\'
