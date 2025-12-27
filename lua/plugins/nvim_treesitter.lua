require("nvim-treesitter").install {
	"nu", "yaml", "markdown", "go", "rust", "typescript", "python"
}

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'nu' },
	callback = function() vim.treesitter.start() end,
})
