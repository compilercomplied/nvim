
local wk = require('which-key')

wk.setup{

	plugins = {
		marks = false,
		registers = false,
		spelling = { enabled = false }
	},

	window = {
		position = 'bottom'
	}

}

local opts = { prefix = "<leader>" }

wk.register({
	-- windows ------------------------------------------------------------------
	w = {
		name = 'windows',
		w = { 'focus prev' },
		W = { 'focus next' },
		s = { 'horizontal split' },
		v = { 'vertical split' },
		h = { 'focus left' },
		j = { 'focus down' },
		k = { 'focus up' },
		l = { 'focus left' },
		q = { 'save and close' },
		Q = { 'save and close all' },

		x = {
			name = 'resize',
			h = { 'expand left' },
			j = { 'expand down' },
			k = { 'expand up' },
			l = { 'expand right' },
		},

		m = {
			name = 'move',
			h = { 'left' },
			j = { 'down' },
			k = { 'up' },
			l = { 'right' },
		},

		['='] = { 'resize equally' }
	},
	-- buffers ------------------------------------------------------------------
	b = {
		name = 'buffers',
		d = 'delete',
		f = 'fuzzy find',
		n = 'next',
		p = 'previous',
		b = 'search'
	},
	-- editor -------------------------------------------------------------------
	e = {
		name = 'editor',
		m = 'reload config',
		e = 'toggle tree',
		f = 'find in tree',
		b = 'toggle background',
		s = 'save buffer',
		S = 'save all buffers',
		q = 'save and close buff',
		Q = 'save and quit',
	},
	-- fuzzy --------------------------------------------------------------------
	f = {
		name = 'fuzzy search',
		f = 'files',
		t = 'text',
		c = 'commands',
		k = 'keymaps',
	},
	-- code ---------------------------------------------------------------------
	c = {
		name = 'code',
		D = 'declaration',
		d = 'definition',
		i = 'implementation',
		t = 'type def',

		r = 'references',
		R = 'refactor',

		F = 'format',

		f = {
			name = 'find',
			t = 'types',
			f = 'functions'
		},

		z = 'signature help',
		a = 'actions',
		A = 'diagnostics/analysis',
		h = 'hover',

		w = {
			name = 'workspace',
			a = 'add folder',
			r = 'remove folder',
			l = 'list folders'
		}

	}

}, opts)
