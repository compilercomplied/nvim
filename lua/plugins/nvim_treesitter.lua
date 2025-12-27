require("nvim-treesitter").install { "nu" }

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'nu' },
  callback = function() vim.treesitter.start() end,
})
