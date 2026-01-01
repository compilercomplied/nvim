local create_floating_window =
		require('editor_scripting.ui_components').create_floating_window

local M = {}

--- Clears the cached configuration modules and re-sources the main configuration file.
---
--- It iterates through `package.loaded` and dynamically identifies user modules
--- by checking if they exist within the Neovim configuration directory.
--- These modules are then removed from the cache before re-executing `init.lua`.
function M.reload_config()
	for name, _ in pairs(package.loaded) do
		local name_path = name:gsub("%.", "/")
		local config_path = vim.fn.stdpath("config")
		local path_lua = config_path .. "/lua/" .. name_path .. ".lua"
		local path_init = config_path .. "/lua/" .. name_path .. "/init.lua"

		if (vim.fn.filereadable(path_lua) == 1 or vim.fn.filereadable(path_init) == 1) then
			package.loaded[name] = nil
		end
	end

	dofile(vim.env.MYVIMRC)
	vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

--- Opens a Telescope colorscheme picker with a filtered list of themes.
---
--- This function retrieves all available colorschemes and filters out the default
--- Vim themes (e.g., "blue", "desert", "elflord") to show only user-installed
--- or preferred themes. It then launches the Telescope `colorscheme` builtin
--- with `enable_preview` set to true, allowing live preview of the selected theme.
function M.open_colorschemes()
	local status_ok, builtin = pcall(require, "telescope.builtin")
	if not status_ok then
		vim.notify("Telescope not found!", vim.log.levels.ERROR)
		return
	end

	local finders = require("telescope.finders")
	local ignore_list = {
		"blue", "darkblue", "default", "delek", "desert", "elflord", "evening",
		"industry", "koehler", "morning", "murphy", "pablo", "peachpuff", "ron",
		"shine", "slate", "torte", "zellner", "habamax", "quiet",
		"sorbet", "wildcharm", "zaibatsu", "unokai", "vim", "lunaperche"
	}
	local ignore_set = {}
	for _, v in ipairs(ignore_list) do ignore_set[v] = true end

	local all_colors = vim.fn.getcompletion("", "color")
	local filtered_colors = {}
	for _, color in ipairs(all_colors) do
		if not ignore_set[color] then
			table.insert(filtered_colors, color)
		end
	end

	builtin.colorscheme({
		enable_preview = true,
		finder = finders.new_table {
			results = filtered_colors
		}
	})
end


function M.toggle_terminal()
	if vim.api.nvim_win_is_valid(_G.TerminalFloatingWindowState.floating.win) then
		vim.api.nvim_win_hide(_G.TerminalFloatingWindowState.floating.win)
		return
	end

	_G.TerminalFloatingWindowState.floating = create_floating_window(
		{ buf = _G.TerminalFloatingWindowState.floating.buf }
	)

	if vim.bo[_G.TerminalFloatingWindowState.floating.buf].buftype ~= "terminal" then
		vim.cmd.terminal("nu")
	end

	vim.cmd("startinsert")
end

function M.toggle_gemini()
	if vim.api.nvim_win_is_valid(_G.GeminiFloatingWindowState.floating.win) then
		vim.api.nvim_win_hide(_G.GeminiFloatingWindowState.floating.win)
		return
	end

	_G.GeminiFloatingWindowState.floating = create_floating_window(
		{ buf = _G.GeminiFloatingWindowState.floating.buf }
	)

	if vim.bo[_G.GeminiFloatingWindowState.floating.buf].buftype ~= "terminal" then
		vim.cmd.terminal("gemini")
	end

	vim.cmd("startinsert")
end

return M
