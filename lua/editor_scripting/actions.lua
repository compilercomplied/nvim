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

return M