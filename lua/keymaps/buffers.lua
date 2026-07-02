local set = require('editor_scripting/keymaps').set
local telescope = require('editor_scripting.telescope_extensions')

set("Delete buffer", 'n', '<leader>bd', [[:bdelete<CR>]])
set("Next buffer", 'n', '<leader>bn', [[:bnext<CR>]])
set("Previous buffer", 'n', '<leader>bp', [[:bprevious<CR>]])
set("List buffers", 'n', '<leader>bb', function() telescope.buffers() end)
set("Fuzzy find in buffer", 'n', '<leader>bf', [[:Telescope current_buffer_fuzzy_find<CR>]])
