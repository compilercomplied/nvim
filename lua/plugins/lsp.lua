---@diagnostic disable: unused-local, unused-function

local runtime_path = vim.split(package.path, ';')
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
-- 	properties = {
-- 		'documentation',
-- 		'detail',
-- 		'additionalTextEdits',
-- 	}
-- }
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local util = require("lspconfig/util")

-- AutoCmd to format buffer on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

-- Helpers --------------------------------------------------------------------
local function telescope_lsp_wrap(opts, documentscope)
	if documentscope then
		require('telescope.builtin').lsp_document_symbols(opts)
	else
		require('telescope.builtin').lsp_workspace_symbols(opts)
	end
end

Seek_types = function(documentscope)
	local opts = {
		symbols = { 'interface', 'class', 'enum' }
	}
	telescope_lsp_wrap(opts, documentscope)
end

Seek_functions = function(documentscope)
	local opts = {
		symbols = { 'function', 'method' }
	}
	telescope_lsp_wrap(opts, documentscope)
end

-- LUA -------------------------------------------------------------------------
require 'lspconfig'.lua_ls.setup {
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file('', true),
				checkThirdParty = false
			},
			-- Do not send telemetry data containing a
			-- randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

-- GO -------------------------------------------------------------------------
require 'lspconfig'.gopls.setup {
	cmd = { 'gopls', 'serve' },
	capabilities = capabilities,
	filetypes = { 'go', 'gomod' },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		}
	}
}

-- Typescript -----------------------------------------------------------------
require 'lspconfig'.tsserver.setup {}

-- Frontend -------------------------------------------------------------------
require 'lspconfig'.cssmodules_ls.setup {}
require 'lspconfig'.cssls.setup {}

-- C# -------------------------------------------------------------------------
local pid = vim.fn.getpid()
local omnisharp_bin = '/opt/omnisharp/run'

require 'lspconfig'.omnisharp.setup {
	cmd = { omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) },
	capabilities = capabilities
}

-- Terraform ------------------------------------------------------------------
require 'lspconfig'.terraformls.setup {}

-- Python ---------------------------------------------------------------------
require 'lspconfig'.ruff_lsp.setup {
	on_attach = function(client, buffer)
		client.server_capabilities.hoverProvider = false
	end
}
require 'lspconfig'.pyright.setup {
	capabilities = capabilities
}
