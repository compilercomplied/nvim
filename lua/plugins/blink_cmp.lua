require('blink.cmp').setup {
	keymap = {
		preset = 'default',
		-- map 'tab' to jump to the next argument
		['<Tab>'] = { 'snippet_forward', 'fallback' },
		['<S-Tab>'] = { 'snippet_backward', 'fallback' },
	},
}
