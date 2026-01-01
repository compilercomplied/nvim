---@type table<string, string[]> Key: parser name, Value: filetype patterns
local languages = {
	css = { "css" },
	go = { "go" },
	html = { "html" },
	json = { "json" },
	markdown = { "md" },
	lua = { "lua" },
	nu = { "nu" },
	python = { "py" },
	rust = { "rs" },
	typescript = { "ts" },
	yaml = { "yaml", "yml" },
}

local to_install = {}

for parser, filetypes in pairs(languages) do
	table.insert(to_install, parser)
	for _, filetype in ipairs(filetypes) do
		vim.api.nvim_create_autocmd('FileType', {
			pattern = filetype,
			callback = function()
				vim.treesitter.start()
			end,
		})
	end
end

require("nvim-treesitter").install(to_install)
