---@alias WhichKeyColor "Azure" | "Blue" | "Cyan" | "Green" | "Grey" | "Orange" | "Purple" | "Red" | "Yellow"

---@class WhichKeyIcon
---@field icon string
---@field color WhichKeyColor

---@class WhichKeyMapping
---@field [1] string Key binding
---@field group string Group name
---@field icon? WhichKeyIcon Icon configuration

---@class WhichKey
---@field setup function
---@field add fun(mappings: WhichKeyMapping[], opts?: table)

local wk = require('which-key')

wk.setup {
	plugins = {
		marks = false,
		registers = false,
		spelling = { enabled = false }
	},
}

local opts = { prefix = "<leader>" }

wk.add({
	{ "<leader>b", group = "buffers", icon = { icon = "󱔗", color = "Green" } },
	{ "<leader>c", group = "code", icon = { icon = "󰅩", color = "Green" } },
	{ "<leader>cf", group = "find", icon = { icon = "", color = "Green" } },
	{ "<leader>cw", group = "workspace", icon = { icon = "", color = "Green" } },
	{ "<leader>cA", group = "diagnostics" },
	{ "<leader>e", group = "editor", icon = { icon = "", color = "Green" } },
	{ "<leader>f", group = "fuzzy search", icon = { icon = "", color = "Green" } },
	{ "<leader>w", group = "windows", icon = { icon = "", color = "Green" } },
	{ "<leader>wm", group = "move", icon = { icon = "", color = "Green" } },
	{ "<leader>wx", group = "resize", icon = { icon = "󰩨", color = "Green" } },
	{ "<leader>t", group = "tabs", icon = { icon = "󰓩", color = "Green" } },
}, opts)

