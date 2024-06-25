
vim.g.mapleader = " "
function keymap(mode, keybind, command, other)
	if mode == "i" then
		vim.api.nvim_set_keymap(mode, keybind, "<Esc><cmd>" .. command .. "<cr>", other or {})
	else
		vim.api.nvim_set_keymap(mode, keybind, "<cmd>" .. command .. "<cr>", other or {})
	end
end

function cmd(cmd)
	vim.cmd(cmd)
end

-- for file swapping
keymap('n', '<leader>ff', 'Telescope find_files', { noremap = true, silent = true })

keymap('n', '<leader><leader>c', 'NERDCommenterToggle', { noremap = true, silent = true })
keymap('v', '<leader><leader>c', 'NERDCommenterToggle', { noremap = true, silent = true })

-- better terminal
keymap("n","<leader>ft","FloatermNew")

-- common mappings
keymap("n","<leader>u","undo")
keymap("n","<leader>w","w")
keymap("n","<leader>q","q")
keymap("n","<leader>wq","q")
keymap("n", "<C-n>","NERDTreeToggle")
keymap("i", "<C-n>","NERDTreeToggle")

-- Airline configuration
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#formatter'] = 'default'

-- Floaterm configuration
vim.g.floaterm_keymap_toggle = '<F12>'
vim.g.floaterm_keymap_new = '<F7>'
vim.g.floaterm_keymap_prev = '<F8>'
vim.g.floaterm_keymap_next = '<F9>'
vim.g.floaterm_keymap_kill = '<F10>'
vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.7

-- Set colorscheme
cmd("colorscheme tokyonight")
