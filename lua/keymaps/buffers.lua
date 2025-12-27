local set = require('editor_scripting/keymaps').set

set("Delete buffer", 'n', '<leader>bd', [[:bdelete<CR>]])
set("Next buffer", 'n', '<leader>bn', [[:bnext<CR>]])
set("Previous buffer", 'n', '<leader>bp', [[:bprevious<CR>]])
set("List buffers", 'n', '<leader>bb', [[:Telescope buffers<CR>]])
set("Fuzzy find in buffer", 'n', '<leader>bf', [[:Telescope current_buffer_fuzzy_find<CR>]])
