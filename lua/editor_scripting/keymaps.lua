---@class Keymaps
---@brief A utility module for managing Neovim keybindings with a simplified API.
local M = {}

---@alias MapMode "n" | "i" | "v" | "x" | "t" | "c"

--- A convenient wrapper around `vim.keymap.set` that enforces common options.
---
---
---@param desc string The human-readable description for the keybinding (used by plugins like which-key).
---@param mode MapMode|MapMode[] The mode(s) for the keybinding (e.g., "n" for normal, "i" for insert).
---@param lhs string The keybinding to map (Left-Hand Side).
---@param rhs string|function The action to execute (Right-Hand Side).
function M.set(desc, mode, lhs, rhs)
	local options = { noremap = true, silent = true, desc = desc }
	vim.keymap.set(mode, lhs, rhs, options)
end

return M
