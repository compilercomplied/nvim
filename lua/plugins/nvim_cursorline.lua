-- Define a highlighting style for the word under cursor 
local cursorword_hl = {
	underline = true,
}

vim.api.nvim_set_hl(0, 'CursorWord', cursorword_hl)

-- Reapply style after colorscheme change
vim.api.nvim_create_autocmd('ColorScheme', {
	group = vim.api.nvim_create_augroup('cursorword-highlight', { clear = true }),
	callback = function()
		vim.api.nvim_set_hl(0, 'CursorWord', cursorword_hl)
	end,
})

require('nvim-cursorline').setup {
	cursorline = {
		enable = true,
		timeout = 750
	},
	cursorword = {
		enable = true,
		min_length = 2,
		hl = cursorword_hl
	}

}
