local set = require('editor_scripting/keymaps').set



set("ToggleDiffview", 'n', '<leader>gd', function()
  if next(require("diffview.lib").views) == nil then
    vim.cmd("DiffviewOpen")
  else
    vim.cmd("DiffviewClose")
  end
end)
