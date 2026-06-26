-- Vue Language Server (vue_ls / volar v2+) for Vue 3.
-- hybridMode = false: vue_ls handles both Vue templates and TypeScript in
-- <script lang="ts"> blocks independently (no tsserver coordination needed).
-- on_new_config resolves the workspace TypeScript so vue_ls can analyse
-- cross-file references into .ts files.
vim.lsp.config('vue_ls', {
	filetypes = { 'vue' },
	on_new_config = function(new_config, new_root_dir)
		local tsdk = new_root_dir .. '/node_modules/typescript/lib'
		if vim.fn.isdirectory(tsdk) == 1 then
			new_config.init_options.typescript.tsdk = tsdk
		end
	end,
	init_options = {
		typescript = {
			tsdk = '',
		},
		vue = {
			hybridMode = false,
		},
	},
})
vim.lsp.enable('vue_ls')
