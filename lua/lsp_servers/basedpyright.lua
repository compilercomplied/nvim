vim.lsp.config('basedpyright', {
	settings = {
		basedpyright = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = 'openFilesOnly',
			},
		},
	},
})
vim.lsp.enable('basedpyright')
