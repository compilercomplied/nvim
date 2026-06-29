local M = {}

local function with_telescope_builtin(callback)
	local telescope_loaded, telescope_module = pcall(require, "telescope.builtin")
	if not telescope_loaded then
		vim.notify("Telescope not found", vim.log.levels.ERROR)
		return
	end

	callback(telescope_module)
end

local function telescope_lsp_wrap(opts, documentscope)
	with_telescope_builtin(function(telescope_module)
		if documentscope then
			telescope_module.lsp_document_symbols(opts)
		else
			telescope_module.lsp_dynamic_workspace_symbols(opts)
		end
	end)
end

function M.lsp_references(opts)
	with_telescope_builtin(function(telescope_module)
		telescope_module.lsp_references(opts or {})
	end)
end

function M.workspace_diagnostics(opts)
	with_telescope_builtin(function(telescope_module)
		telescope_module.diagnostics(opts or {})
	end)
end

function M.document_diagnostics(opts)
	with_telescope_builtin(function(telescope_module)
		telescope_module.diagnostics(vim.tbl_extend("force", { bufnr = 0 }, opts or {}))
	end)
end

function M.fuzzy_search_types(documentscope)
	local opts = {
		symbols = { 'interface', 'class', 'enum' }
	}
	telescope_lsp_wrap(opts, documentscope)
end

function M.fuzzy_search_functions(documentscope)
	local opts = {
		symbols = { 'function', 'method' }
	}
	telescope_lsp_wrap(opts, documentscope)
end

return M
