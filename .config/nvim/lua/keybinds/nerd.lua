local globals = vim.g
local fns = require '../fns'
local keymap = fns.keymap
keymap('n', '<leader><leader>c', 'NERDCommenterToggle', { noremap = true, silent = true })
keymap('v', '<leader><leader>c', 'NERDCommenterToggle', { noremap = true, silent = true })
keymap("n", "<C-n>","NERDTreeToggle")
keymap("i", "<C-n>","NERDTreeToggle")
