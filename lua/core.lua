

-- ----- Editor ---------------------------------------------------------------
vim.opt.tabstop = 2       -- show existing tab with $value spaces width
vim.opt.softtabstop = 2   -- number of spaces tab counts for while editing
vim.opt.shiftwidth = 2    -- when indenting with '>', use $value spaces width
vim.opt.expandtab = false -- on pressing tab, insert spaces
vim.opt.autoindent = true -- copy indent from current line

vim.opt.clipboard = "unnamedplus"	-- yank

vim.opt.number = true					-- show line numbers
vim.opt.relativenumber = true -- use relative line numbers

vim.opt.completeopt = "menu,menuone,noselect,preview"
vim.opt.pumwidth = 60

vim.opt.textwidth = 0					-- line's 'max char count
vim.opt.foldmethod = 'indent'	-- indent= lines with equal indent create a fold
vim.opt.foldlevel = 95				-- folds with a higher level will be closed
vim.opt.colorcolumn = "80"		-- color column

vim.opt.backspace="indent,eol,start"	-- backspace behavior in normal mode

-- adds color column of line, width set with `set colorcolumn`
vim.cmd [[ highlight ColorColumn ctermbg=8 guibg=lightgrey ]]

vim.cmd[[let g:everforest_background = 'hard']]
vim.cmd[[set termguicolors]]
vim.cmd[[colorscheme everforest]]
vim.cmd[[set background=dark]]


-- ----- Accesibility ---------------------------------------------------------
vim.opt.ruler = true				-- show cursor position
vim.opt.wildmenu = true			-- tab-completion for command-line
vim.opt.autoread = true			-- reload files changed externally
vim.opt.autowrite = true		-- :w automatically when a bunch of stuff happens
vim.opt.timeout = true			-- disable bind combo timeout
vim.opt.scrolloff = 1       -- minimal number of screen lines to keep above & below cursor
vim.opt.sidescrolloff = 5		-- minimal number of screen columns to keep to left and right
-- vim.opt.display+=lastline	-- :help 'display'
-- vim.opt.formatoptions+=j		-- delete comment character when joining commented lines


-- ----- Performance ----------------------------------------------------------
vim.opt.lazyredraw = true -- avoid redrawing when executing macros and other cmds
vim.opt.synmaxcol = 200		-- Don't highlight anything longer than 200 chars

vim.cmd [[let did_install_default_menus = 1]]  -- Don't load gvim menu stuff
