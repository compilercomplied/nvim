local M = {}

function M.peek_definition()
	local params = vim.lsp.util.make_position_params()
	vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result)
		if not result or vim.tbl_isempty(result) then
			vim.notify("No definition found", vim.log.levels.INFO)
			return
		end
		local location = vim.islist(result) and result[1] or result
		local uri  = location.uri or location.targetUri
		local lnum = (location.range or location.targetRange).start.line + 1
		local filepath = vim.uri_to_fname(uri)
		require("editor_scripting.ui_components").open_file_float(filepath, lnum)
	end)
end

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
	opts = vim.tbl_deep_extend("keep", opts or {}, {
		layout_strategy = "vertical",
		layout_config = { vertical = { mirror = false } },
	})

	if not opts.entry_maker then
		local default_maker = require("telescope.make_entry").gen_from_quickfix(opts)
		opts.entry_maker = function(entry)
			local base = default_maker(entry)
			base.display = function(e)
				local tail = vim.fn.fnamemodify(e.filename or "", ":t")
				local parent = vim.fn.fnamemodify(e.filename or "", ":h:t")
				local path = (parent ~= "" and parent ~= ".") and (parent .. "/" .. tail) or tail
				local lnum, col = tostring(e.lnum or 0), tostring(e.col or 0)
				local text = (e.text or ""):gsub("^%s+", "")

				local p, l = #path, #lnum
				return string.format("%s:%s:%s\t%s", path, lnum, col, text), {
					{ { 0,         p         }, "Directory"             },
					{ { p,         p + 1     }, "TelescopeResultsComment" },
					{ { p + 1,     p + 1 + l }, "@string"               },
					{ { p + 1 + l, p + 2 + l }, "TelescopeResultsComment" },
					{ { p + 2 + l, p + 2 + l + #col }, "@string"        },
				}
			end
			return base
		end
	end

	with_telescope_builtin(function(t) t.lsp_references(opts) end)
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

function M.buffers(opts)
	with_telescope_builtin(function(telescope_module)
		local actions = require("telescope.actions")
		telescope_module.buffers(vim.tbl_deep_extend("keep", opts or {}, {
			attach_mappings = function(_, map)
				map({ 'i', 'n' }, '<C-d>', function(prompt_bufnr)
					local current = require("telescope.actions.state").get_selected_entry()
					actions.close(prompt_bufnr)
					if current then
						vim.api.nvim_buf_delete(current.bufnr, { force = false })
					end
					M.buffers()
				end)
				return true
			end,
		}))
	end)
end

return M
