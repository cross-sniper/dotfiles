local globals = vim.g
local fns = require '../fns'
local keymap = fns.keymap
-- better command mode
keymap('n', ':', 'FineCmdline', {noremap = true})
