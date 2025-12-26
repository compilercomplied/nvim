local map = require('editor_scripting/keybindings').map

map("Delete buffer", 'n', '<leader>bd', [[:bdelete<CR>]])
map("Next buffer", 'n', '<leader>bn', [[:bnext<CR>]])
map("Previous buffer", 'n', '<leader>bp', [[:bprevious<CR>]])
map("List buffers", 'n', '<leader>bb', [[:Telescope buffers<CR>]])
map("Fuzzy find in buffer", 'n', '<leader>bf', [[:Telescope current_buffer_fuzzy_find<CR>]])
