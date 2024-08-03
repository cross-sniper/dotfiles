local globals = vim.g
local fns = require '../fns'
local keymap = fns.keymap
keymap('n', '<leader><leader>c', 'NERDCommenterToggle', { noremap = true, silent = true })
keymap('v', '<leader><leader>c', 'NERDCommenterToggle', { noremap = true, silent = true })
keymap("n", "<C-n>","NERDTreeToggle")
keymap("i", "<C-n>","NERDTreeToggle")
keymap("i", "<C-S-v>", "vsplit")
keymap("n", "<C-S-v>", "vsplit")

keymap("i", "<C-S-h>", "split")
keymap("n", "<C-S-h>", "split")


