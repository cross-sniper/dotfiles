local globals = vim.g
local fns = require '../fns'
local keymap = fns.keymap
-- for file swapping
keymap('n', '<leader>ff', 'Telescope find_files', { noremap = true, silent = true })
