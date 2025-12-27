local set = require('editor_scripting/keymaps').set

set("Live grep", 'n', '<leader>ft', [[:Telescope live_grep<CR>]])
set("Find files", 'n', '<leader>ff', [[:Telescope find_files<CR>]])
set("Search commands", 'n', '<leader>fc', [[:Telescope commands<CR>]])
set("Search keymaps", 'n', '<leader>fk', [[:Telescope keymaps<CR>]])
