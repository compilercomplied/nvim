-- Enable diagnostic inline text in the whole buffer.
vim.diagnostic.config({ virtual_text = true })

-- AutoCmd to format buffer on save.
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

-- Custom configuration for the hover buffer.
local _hover = vim.lsp.buf.hover
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function(opts)
	opts = opts or {}
	opts.focusable = opts.focusable ~= nil and opts.focusable or false
	opts.border = opts.border or "rounded"
	return _hover(opts)
end

require('lsp_servers.lua_ls')
require('lsp_servers.typescript_tools')

-- Language servers ------------------------------------------------------------
vim.lsp.enable('gopls')
vim.lsp.enable('terraformls')
vim.lsp.enable('nushell')
