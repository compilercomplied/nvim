---@type table<string, string> Key: parser name, Value: filetype pattern
local languages = {
	css = "css",
	go = "go",
	html = "html",
	json = "json",
	markdown = "md",
	lua = "lua",
	nu = "nu",
	python = "py",
	rust = "rs",
	typescript = "ts",
	yaml = "yaml",
}

local to_install = {}

for parser, filetype in pairs(languages) do
	table.insert(to_install, parser)
	vim.api.nvim_create_autocmd('FileType', {
		pattern = filetype,
		callback = function()
			vim.treesitter.start()
		end,
	})
end

require("nvim-treesitter").install(to_install)
