local set = require('editor_scripting/keymaps').set

-- toggle highlight search
set("Toggle highlight search", 'n', '<leader>hh', function()
	if vim.v.hlsearch == 1 and vim.o.hlsearch then
		vim.cmd.nohlsearch()
	else
		vim.o.hlsearch = true
	end
end)

set("Escape insert mode", 'i', 'jk', '<esc>')
set("Escape insert mode", 'i', 'kj', '<esc>')
set("New line below", 'n', 'zj', 'o<esc>')
set("New line above", 'n', 'zk', 'O<esc>')
set("Split line", 'n', '<leader>lj', 'i<Enter><Esc>')
set("Move selected block down", 'v', 'J', '>+1<CR>gv=gv')
set("Move selected block up", 'v', 'K', '<-2<CR>gv=gv')
