require('mason').setup()
require('mason-lspconfig').setup({
	automatic_enable = {
		-- roslyn_ls is managed by easy-dotnet.
		exclude = { "roslyn_ls" },
	},
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"basedpyright",
		"ruff",
		"kotlin_language_server",
		"vue_ls",
		"terraformls",
	}
})
