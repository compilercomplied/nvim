local M = {}

--- Clears the cached configuration modules and re-sources the main configuration file.
---
--- It iterates through `package.loaded` and removes modules that match the user's
--- configuration structure (editor, keybindings, lsp, plugins, etc.) before
--- executing the `init.lua` file.
function M.reload_config()
	local user_modules = {
		'^editor$', '^editor%.',           -- matches 'editor' and 'editor.*'
		'^keybindings$', '^keybindings%.', -- matches 'keybindings' and 'keybindings.*'
		'^lsp$', '^lsp%.',                 -- matches 'lsp' and 'lsp.*'
		'^plugins$', '^plugins%.',         -- matches 'plugins' and 'plugins.*'
		'^package_manager$',               -- matches 'package_manager'
		'^editor_scripting$', '^editor_scripting%.' -- matches 'editor_scripting' and 'editor_scripting.*'
	}

	for name, _ in pairs(package.loaded) do
		for _, pattern in ipairs(user_modules) do
			if name:match(pattern) then
				package.loaded[name] = nil
				break
			end
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

return M
