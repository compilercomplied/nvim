--- Global state for the terminal floating window.
---
---                 +------------+  (Yes)  +--------+
---  (toggle) ----> | Win Valid? | ------> |  Hide  |
---                 +-----+------+         +--------+
---                       | (No)
---                       v
---                 +------------+  (No)   +---------+      +----------+
---                 | Buf Valid? | ------> | New Buf | ---> | Open Win |
---                 +-----+------+         +---------+      +----+-----+
---                       |                                      ^
---                       +--------------- (Yes) ----------------+
---
--- INVALID STATES:
--- - Win Invalid: Re-open existing (or new) buffer in a new floating window.
--- - Buf Invalid: Create a new scratch buffer before opening the window.
_G.TerminalFloatingWindowState = _G.TerminalFloatingWindowState or {
	floating = {
		buf = -1,
		win = -1
	}
}

--- Global state for the Gemini CLI floating window.
--- Follows the same logic and persistence rules as TerminalFloatingWindowState.
_G.GeminiFloatingWindowState = _G.GeminiFloatingWindowState or {
	floating = {
		buf = -1,
		win = -1
	}
}
