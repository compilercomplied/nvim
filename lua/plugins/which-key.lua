local wk = require('which-key')

wk.setup {

	plugins = {
		marks = false,
		registers = false,
		spelling = { enabled = false }
	},

	win = {
		position = 'bottom'
	}

}

local opts = { prefix = "<leader>" }

wk.add({
	-- buffers ------------------------------------------------------------------
	{ "<leader>b",   group = "buffers" },
	{ "<leader>bb",  desc = "search" },
	{ "<leader>bd",  desc = "delete" },
	{ "<leader>bf",  desc = "fuzzy find" },
	{ "<leader>bn",  desc = "next" },
	{ "<leader>bp",  desc = "previous" },

	-- code ---------------------------------------------------------------------
	{ "<leader>c",   group = "code" },
	{ "<leader>cA",  desc = "diagnostics/analysis" },
	{ "<leader>cD",  desc = "declaration" },
	{ "<leader>cF",  desc = "format" },
	{ "<leader>cR",  desc = "refactor" },
	{ "<leader>ca",  desc = "actions" },
	{ "<leader>cd",  desc = "definition" },

	{ "<leader>cf",  group = "find" },
	{ "<leader>cfF", desc = "workspacefunctions" },
	{ "<leader>cfT", desc = "workspace types" },
	{ "<leader>cff", desc = "document functions" },
	{ "<leader>cft", desc = "document types" },
	{ "<leader>ch",  desc = "hover" },
	{ "<leader>ci",  desc = "implementation" },
	{ "<leader>cr",  desc = "references" },
	{ "<leader>ct",  desc = "type def" },

	{ "<leader>cw",  group = "workspace" },
	{ "<leader>cwa", desc = "add folder" },
	{ "<leader>cwl", desc = "list folders" },
	{ "<leader>cwr", desc = "remove folder" },
	{ "<leader>cz",  desc = "signature help" },

	-- editor -------------------------------------------------------------------
	{ "<leader>e",   group = "editor" },
	{ "<leader>eQ",  desc = "save and quit" },
	{ "<leader>eb",  desc = "toggle background" },
	{ "<leader>ee",  desc = "toggle tree" },
	{ "<leader>ef",  desc = "find in tree" },
	{ "<leader>em",  desc = "reload config" },
	{ "<leader>eq",  desc = "save and close buff" },
	{ "<leader>es",  desc = "save all buffers" },

	-- fuzzy --------------------------------------------------------------------
	{ "<leader>f",   group = "fuzzy search" },
	{ "<leader>fc",  desc = "commands" },
	{ "<leader>ff",  desc = "files" },
	{ "<leader>fk",  desc = "keymaps" },
	{ "<leader>ft",  desc = "text" },

	-- windows ------------------------------------------------------------------
	{ "<leader>w",   group = "windows" },
	{ "<leader>w=",  desc = "resize equally" },
	{ "<leader>wQ",  desc = "save and close all" },
	{ "<leader>wW",  desc = "focus next" },
	{ "<leader>wh",  desc = "focus left" },
	{ "<leader>wj",  desc = "focus down" },
	{ "<leader>wk",  desc = "focus up" },
	{ "<leader>wl",  desc = "focus left" },
	{ "<leader>wm",  group = "move" },
	{ "<leader>wmh", desc = "left" },
	{ "<leader>wmj", desc = "down" },
	{ "<leader>wmk", desc = "up" },
	{ "<leader>wml", desc = "right" },
	{ "<leader>wq",  desc = "save and close" },
	{ "<leader>ws",  desc = "horizontal split" },
	{ "<leader>wv",  desc = "vertical split" },
	{ "<leader>ww",  desc = "focus prev" },
	{ "<leader>wx",  group = "resize" },
	{ "<leader>wxh", desc = "expand left" },
	{ "<leader>wxj", desc = "expand down" },
	{ "<leader>wxk", desc = "expand up" },
	{ "<leader>wxl", desc = "expand right" },
}, opts)
