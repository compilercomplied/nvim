require('blink.cmp').setup {
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
		}
	},
	keymap = {
		preset = 'default',
		-- map 'tab' to jump to the next argument
		['<Tab>'] = { 'snippet_forward', 'fallback' },
		['<S-Tab>'] = { 'snippet_backward', 'fallback' },
	},
}
