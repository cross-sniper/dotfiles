globals = vim.g
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

-- better command mode
keymap('n', ':', 'FineCmdline', {noremap = true})

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
globals['airline#extensions#tabline#enabled'] = 1
globals['airline#extensions#tabline#formatter'] = 'default'

-- Floaterm configuration
globals.floaterm_keymap_toggle = '<F12>'
globals.floaterm_keymap_new = '<F7>'
globals.floaterm_keymap_prev = '<F8>'
globals.floaterm_keymap_next = '<F9>'
globals.floaterm_keymap_kill = '<F10>'
globals.floaterm_width = 0.8
globals.floaterm_height = 0.7
