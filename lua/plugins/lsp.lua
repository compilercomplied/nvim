---@diagnostic disable: unused-local, unused-function

local runtime_path = vim.split(package.path, ';')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Helpers --------------------------------------------------------------------
Seek_types = function ()
	local opts = {
		symbols = { 'interface', 'class', 'enum' }
	}
	require('telescope.builtin').lsp_workspace_symbols(opts)
end

Seek_functions = function ()
	local opts = {
		symbols = { 'function', 'method' }
	}
	require('telescope.builtin').lsp_workspace_symbols(opts)
end

-- LUA -------------------------------------------------------------------------
require'lspconfig'.sumneko_lua.setup {
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
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
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

require'lspconfig'.gopls.setup {
	cmd =  { 'gopls', 'serve' },
	capabilities = capabilities
}


-- C# -------------------------------------------------------------------------
local pid = vim.fn.getpid()
local omnisharp_bin = '/opt/omnisharp/run'

require'lspconfig'.omnisharp.setup {
	cmd =  { omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) },
	capabilities = capabilities
}
