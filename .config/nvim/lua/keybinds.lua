
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

-- COC

-- coc.nvim configuration
keymap('i', '<TAB>', 'pumvisible() ? "\\<C-n>" : "\\<TAB>"', { noremap = true, silent = true, expr = true })
keymap('i', '<S-TAB>', 'pumvisible() ? "\\<C-p>" : "\\<C-h>"', { noremap = true, silent = true, expr = true })

keymap('i', '<C-Space>', 'coc#refresh()', { noremap = true, silent = true, expr = true })

keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', { noremap = true, silent = true })
keymap('n', ']g', '<Plug>(coc-diagnostic-next)', { noremap = true, silent = true })

keymap('n', 'gd', '<Plug>(coc-definition)', { noremap = true, silent = true })
keymap('n', 'gy', '<Plug>(coc-type-definition)', { noremap = true, silent = true })
keymap('n', 'gi', '<Plug>(coc-implementation)', { noremap = true, silent = true })
keymap('n', 'gr', '<Plug>(coc-references)', { noremap = true, silent = true })

keymap('n', 'K', ':lua show_documentation()<CR>', { noremap = true, silent = true })
function _G.show_documentation()
  local filetype = vim.bo.filetype
  if filetype == 'vim' or filetype == 'help' then
    vim.cmd('h ' .. vim.fn.expand('<cword>'))
  else
    vim.fn.CocActionAsync('doHover')
  end
end

keymap('n', '<leader>rn', '<Plug>(coc-rename)', { noremap = true, silent = true })
keymap('n', '<leader>f', '<Plug>(coc-format)', { noremap = true, silent = true })

cmd([[
  augroup mygroup
    autocmd!
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end
]])

cmd('command! -nargs=0 Format :call CocAction("format")')
cmd('command! -nargs=? Fold :call CocAction("fold", <f-args>)')
cmd('command! -nargs=0 OR :call CocAction("runCommand", "editor.action.organizeImport")')

keymap('x', '<leader>a', '<Plug>(coc-codeaction-selected)', { noremap = true, silent = true })
keymap('n', '<leader>a', '<Plug>(coc-codeaction-selected)', { noremap = true, silent = true })
keymap('n', '<leader>ac', '<Plug>(coc-codeaction)', { noremap = true, silent = true })
keymap('n', '<leader>qf', '<Plug>(coc-fix-current)', { noremap = true, silent = true })
keymap('n', '<leader>cl', '<Plug>(coc-codelens-action)', { noremap = true, silent = true })

keymap('x', 'if', '<Plug>(coc-funcobj-i)', { noremap = true, silent = true })
keymap('o', 'if', '<Plug>(coc-funcobj-i)', { noremap = true, silent = true })
keymap('x', 'af', '<Plug>(coc-funcobj-a)', { noremap = true, silent = true })
keymap('o', 'af', '<Plug>(coc-funcobj-a)', { noremap = true, silent = true })
keymap('x', 'ic', '<Plug>(coc-classobj-i)', { noremap = true, silent = true })
keymap('o', 'ic', '<Plug>(coc-classobj-i)', { noremap = true, silent = true })
keymap('x', 'ac', '<Plug>(coc-classobj-a)', { noremap = true, silent = true })
keymap('o', 'ac', '<Plug>(coc-classobj-a)', { noremap = true, silent = true })

keymap('x', '<leader>f', '<Plug>(coc-format-selected)', { noremap = true, silent = true })
keymap('n', '<leader>f', '<Plug>(coc-format-selected)', { noremap = true, silent = true })

