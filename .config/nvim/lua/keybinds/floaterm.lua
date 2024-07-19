local globals = vim.g
local fns = require '../fns'
local keymap = fns.keymap
-- better terminal
keymap("n","<leader>ft","FloatermNew")

-- Floaterm configuration
globals.floaterm_keymap_toggle = '<F12>'
globals.floaterm_keymap_new = '<F7>'
globals.floaterm_keymap_prev = '<F8>'
globals.floaterm_keymap_next = '<F9>'
globals.floaterm_keymap_kill = '<F10>'
globals.floaterm_width = 0.8
globals.floaterm_height = 0.7
