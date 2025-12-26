local map = require('editor_scripting/keybindings').map

-- toggle highlight search
map("Toggle highlight search", 'n', '<leader>hh', function()
	if vim.v.hlsearch == 1 and vim.o.hlsearch then
		vim.cmd.nohlsearch()
	else
		vim.o.hlsearch = true
	end
end)

map("Escape insert mode", 'i', 'jk', '<esc>')
map("Escape insert mode", 'i', 'kj', '<esc>')
map("New line below", 'n', 'zj', 'o<esc>')
map("New line above", 'n', 'zk', 'O<esc>')
map("Split line", 'n', '<leader>lj', 'i<Enter><Esc>')
map("Move selected block down", 'v', 'J', '>+1<CR>gv=gv')
map("Move selected block up", 'v', 'K', '<-2<CR>gv=gv')
