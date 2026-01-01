local M = {}

local function telescope_lsp_wrap(opts, documentscope)
	local telescope_loaded, telescope_module = pcall(require, "telescope.builtin")
	if not telescope_loaded then
		vim.notify("Telescope not found", vim.log.levels.ERROR)
		return
	end

	if documentscope then
		telescope_module.lsp_document_symbols(opts)
	else
		telescope_module.lsp_workspace_symbols(opts)
	end
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
