local set = require('editor_scripting/keymaps').set
local actions = require('editor_scripting.actions')

set("AI", {'n', 't'}, '<leader>ea', actions.toggle_gemini)
set("Terminal", {'n', 't'}, '<leader>et', actions.toggle_terminal)
set("Find file in tree", 'n', '<leader>eF', [[:NvimTreeFindFile<cr>]])
set("Toggle file tree", 'n', '<leader>ee', [[:NvimTreeToggle<cr>]])
set("Save all buffers", 'n', '<leader>es', [[<cmd>:wa<CR>]])
set("Save and quit", 'n', '<leader>eq', [[<cmd>:wq<CR>]])
set("Save all and quit", 'n', '<leader>eQ', '[[<cmd>:wqa<CR>]]')
set("Reload config", 'n', '<leader>em', actions.reload_config)
set("Toggle night mode", 'n', '<leader>eb', [[:let &background = ( &background == "dark"? "light" : "dark" )<CR>]])
set("Colorschemes", 'n', '<leader>ec', actions.open_colorschemes)
