
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '


-- toggle highlight search
vim.api.nvim_set_keymap('n',
	'<leader>hh', [[(&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"]], opts
)

-- use jk/kj to escape from insert mode
vim.api.nvim_set_keymap('i',
	'jk', '<esc>', opts
)
vim.api.nvim_set_keymap('i',
	'kj', '<esc>', opts
)


-- open new lines above or below
vim.api.nvim_set_keymap('n',
	'zj', 'o<esc>', opts
)

vim.api.nvim_set_keymap('n',
	'zk', 'O<esc>', opts
)


-- split line, the move to beginning of new line
vim.api.nvim_set_keymap('n',
	'<leader>lj', 'i<Enter><Esc>', opts
)

-- use J K in visual mode to move around selected block
vim.api.nvim_set_keymap('v',
	'J', '>+1<CR>gv=gv', opts
)
vim.api.nvim_set_keymap('v',
	'K', '<-2<CR>gv=gv', opts
)

-- whereas in normal mode J K moves between tabs
vim.api.nvim_set_keymap('n',
	'<silent><leader>tk', 'gt', opts
)
vim.api.nvim_set_keymap('n',
	'<silent><leader>tj', 'gT', opts
)


-- windows --------------------------------------------------------------------
vim.api.nvim_set_keymap('n',
	'<leader>ww', '<C-W>w', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>wW', '<C-W>W', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>ws', '<C-W>s', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>wv', '<C-W>v', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>wh', '<C-W>h', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>wj', '<C-W>j', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>wj', '<C-W>j', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>wk', '<C-W>k', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>wl', '<C-W>l', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>w=', '<C-W>l', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>w=', '<C-W>=', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>wq', '<C-W>q', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>wQ', ':qa<cr>', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>wxh', '<C-W>5<', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>wxj', ':resize +5<cr>', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>wxk', ':resize -5<cr>', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>wxl', '<C-W>5>', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>wmh', '<C-W>H', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>wmj', '<C-W>J', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>wmk', '<C-W>K', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>wml', '<C-W>L', opts
)

-- editor ---------------------------------------------------------------------
vim.api.nvim_set_keymap('n',
	'<leader>es', [[<cmd>:w<CR>]], opts
)
vim.api.nvim_set_keymap('n',
	'<leader>eq', [[<cmd>:wq<CR>]], opts
)
vim.api.nvim_set_keymap('n',
	'<leader>eS', 'ZZ', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>eQ', '[[<cmd>:wqa<CR>]]', opts
)

vim.api.nvim_set_keymap('n',
	'<leader>em', [[<cmd>:source $MYVIMRC<CR>]], opts
)

vim.api.nvim_set_keymap('n',
	'<leader>eb', [[:let &background = ( &background == "dark"? "light" : "dark" )<CR>]], opts
)


-- buffers --------------------------------------------------------------------
vim.api.nvim_set_keymap('n',
	'<leader>bd', [[:bdelete<CR>]], opts
)
vim.api.nvim_set_keymap('n',
	'<leader>bn', [[:bnext<CR>]], opts
)
vim.api.nvim_set_keymap('n',
	'<leader>bp', [[:bprevious<CR>]], opts
)
vim.api.nvim_set_keymap('n',
	'<leader>bb', [[:Telescope buffers<CR>]], opts
)
vim.api.nvim_set_keymap('n',
	'<leader>bf', [[:Telescope current_buffer_fuzzy_find<CR>]], opts
)

-- fuzzy ----------------------------------------------------------------------
vim.api.nvim_set_keymap('n',
	'<leader>ff', [[:Telescope live_grep<CR>]], opts
)

vim.api.nvim_set_keymap('n',
	'<leader>fc', [[:Telescope commands<CR>]], opts
)

vim.api.nvim_set_keymap('n',
	'<leader>fk', [[:Telescope keymaps<CR>]], opts
)

-- code -----------------------------------------------------------------------
vim.api.nvim_set_keymap('n',
	'<leader>cD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>cd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>ch', '<cmd>lua vim.lsp.buf.hover()<CR>', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>ci', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>cz', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>cwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>cwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>cwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>ct', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>cR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>cr', '<cmd>lua vim.lsp.buf.references()<CR>', opts
)
vim.api.nvim_set_keymap('n',
	'<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts
)
