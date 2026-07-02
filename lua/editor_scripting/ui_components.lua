local M = {}

function M.create_floating_window(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	local buf = nil
	if opts.buf and vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		-- No file, scratch buffer
		buf = vim.api.nvim_create_buf(false, true)
	end

	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded",
	}

	local win = vim.api.nvim_open_win(buf, true, win_config)
	-- By unlisting the buffer, we remove it from the buffer list. This means
	-- that we won't find the floating window when moving between nvim buffers.
	vim.bo[buf].buflisted = false

	return { buf = buf, win = win }
end

--- Open a file in a centred floating window.
--- The buffer is a real, non-listed buffer so the LSP attaches and all
--- LSP commands (references, implementation, hover, …) work normally.
--- When the window is closed (q / <Esc> / :q) the buffer is wiped only if
--- it did not already exist before the preview was opened.
---@param filepath string absolute path to the file to open
---@param lnum?    number  1-based line to jump to after opening
---@param opts?    table   optional width/height overrides
function M.open_file_float(filepath, lnum, opts)
	opts = opts or {}
	local width  = opts.width  or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines   * 0.8)
	local col    = math.floor((vim.o.columns - width)  / 2)
	local row    = math.floor((vim.o.lines   - height) / 2)

	-- bufadd reuses the existing buffer if the file is already open,
	-- or creates a new unlisted one — no name-collision possible.
	local bufnr      = vim.fn.bufadd(filepath)
	local was_loaded = vim.fn.bufloaded(bufnr) == 1
	if not was_loaded then
		vim.fn.bufload(bufnr)
	end
	vim.bo[bufnr].buflisted = false  -- keep off the :ls list

	local win = vim.api.nvim_open_win(bufnr, true, {
		relative = "editor",
		width    = width,
		height   = height,
		col      = col,
		row      = row,
		style    = "minimal",
		border   = "rounded",
	})

	if lnum and lnum > 0 then
		vim.api.nvim_win_set_cursor(win, { lnum, 0 })
		vim.cmd("normal! zz")
	end

	-- Only wipe the buffer on close if we created it; if it was already
	-- open the user may still want it around.
	local function close()
		if vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_win_close(win, true)
		end
		if not was_loaded and vim.api.nvim_buf_is_valid(bufnr) then
			vim.api.nvim_buf_delete(bufnr, { force = true })
		end
	end

	local kmap_opts = { buffer = bufnr, nowait = true, silent = true }
	vim.keymap.set('n', 'q',     close, kmap_opts)
	vim.keymap.set('n', '<Esc>', close, kmap_opts)

	vim.api.nvim_create_autocmd("WinClosed", {
		pattern  = tostring(win),
		once     = true,
		callback = function()
			if not was_loaded and vim.api.nvim_buf_is_valid(bufnr) then
				vim.api.nvim_buf_delete(bufnr, { force = true })
			end
		end,
	})

	return { buf = bufnr, win = win }
end

return M
