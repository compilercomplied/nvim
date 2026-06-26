require('easy-dotnet').setup({
	picker = 'telescope',
})

vim.api.nvim_create_autocmd('BufReadPost', {
	pattern = { '*.cs', '*.csproj', '*.sln', '*.fsproj', '*.fs' },
	once = true,
	callback = function()
		local roslyn_lsp = require('easy-dotnet.roslyn.lsp')
		if not roslyn_lsp.find_sln_or_csproj(vim.fn.getcwd()) then return end

		require('easy-dotnet.current_solution').get_or_pick_solution(function(solution)
			if not solution then return end
			roslyn_lsp.preload_roslyn({ preload_roslyn = true })
		end)
	end,
})
