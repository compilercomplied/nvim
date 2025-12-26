local map = require('editor_scripting/keybindings').map
local actions = require('editor_scripting.actions')

map("Find file in tree", 'n', '<leader>eF', [[:NvimTreeFindFile<cr>]])
map("Toggle file tree", 'n', '<leader>ee', [[:NvimTreeToggle<cr>]])
map("Save all buffers", 'n', '<leader>es', [[<cmd>:wa<CR>]])
map("Save and quit", 'n', '<leader>eq', [[<cmd>:wq<CR>]])
map("Save all and quit", 'n', '<leader>eQ', '[[<cmd>:wqa<CR>]]')
map("Reload config", 'n', '<leader>em', actions.reload_config)
map("Toggle background", 'n', '<leader>eb', [[:let &background = ( &background == "dark"? "light" : "dark" )<CR>]])
map("Colorschemes", 'n', '<leader>ec', actions.open_colorschemes)