local cmp = require('cmp')

cmp.setup({

	completion = { autocomplete = false },

	sources = { { name = 'nvim_lsp' } },

	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		-- Specify `cmp.config.disable` if you want to
		-- remove the default `<C-y>` mapping.
		['<C-y>'] = cmp.config.disable,
		['<C-e>'] = cmp.mapping.close(),
		-- Accept currently selected item. Set `select` to `false`
		-- to only confirm explicitly selected items.
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		}),
    ['<Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		['<S-Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
	}
})
