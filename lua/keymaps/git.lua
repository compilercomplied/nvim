local set = require('editor_scripting/keymaps').set


set("Git push", 'n', '<leader>gp', [[:Git push<CR>]])
set("Git add .", 'n', '<leader>ga', [[:Git add .<CR>]])

set("Toggle git view", 'n', '<leader>gg', function()
	-- Iterate over all opened windows to see if there is a window opened with
	-- `fugitive_status` variable. If there is, close it, otherwise open
	-- fugitive's :Git view.
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local success, _ = pcall(vim.api.nvim_win_get_var, win, "fugitive_status")

		if success then
			vim.api.nvim_win_close(win, false)
			return
		end
	end

	vim.cmd("Git")
end)

set("Toggle diff", 'n', '<leader>gd', function()
	if next(require("diffview.lib").views) == nil then
		vim.cmd("DiffviewOpen")
	else
		vim.cmd("DiffviewClose")
	end
end)
