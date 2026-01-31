-- Force globals initialization first.
require('editor_scripting.globals')

-- plugin_manager has the bootstrapping configuration for the plugins
-- we have to load it before  the rest of the modules so we can successfully
-- bootstrap in a clean install.
require('plugin_manager')

require('editor')
require('keymaps')
require('lsp')
