local map = require('editor_scripting/keybindings').map

map("Live grep", 'n', '<leader>ft', [[:Telescope live_grep<CR>]])
map("Find files", 'n', '<leader>ff', [[:Telescope find_files<CR>]])
map("Search commands", 'n', '<leader>fc', [[:Telescope commands<CR>]])
map("Search keymaps", 'n', '<leader>fk', [[:Telescope keymaps<CR>]])
