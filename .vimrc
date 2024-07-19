" Enable syntax highlighting
syntax on

" Set relative line numbers
set relativenumber

" Enable mouse support in all modes
set mouse=a

" Use the system clipboard
set clipboard=unnamedplus

" Set the path for file searching
set path+=.,**,~/bin

" Highlight the current line
set cursorline

" Initialize plugin system
call plug#begin('~/.vim/plugged')
" List your plugins here
Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', { 'do': 'npm ci' }
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'voldikss/vim-floaterm'
Plug 'ghifarit53/tokyonight-vim'
Plug 'habamax/vim-godot'
Plug 'whleucka/melody.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/lazy.nvim'
call plug#end()

" Set leader key
let mapleader = ' '
let maplocalleader = '\\'

set tabstop=4

" Map leader + f to FZF
nmap <leader>ff :FZF<CR>
nmap <leader><leader>f :Files<CR>
nmap <leader><leader>c :NERDCommenterToggle<CR>
vmap <leader><leader>c :NERDCommenterToggle<CR>
nmap <C-n> :NERDTreeToggle<CR>
imap <C-n> :NERDTreeToggle<CR>

" Open terminal in a floating window
nmap <leader>ft :FloatermNew<CR>

" Common command mappings
nmap <leader>u :undo<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>wq :wq<CR>

" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

" Floaterm configuration
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_keymap_new = '<F7>'
let g:floaterm_keymap_prev = '<F8>'
let g:floaterm_keymap_next = '<F9>'
let g:floaterm_keymap_kill = '<F10>'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.7

" Set colorscheme
colorscheme tokyonight

" coc.nvim configuration
" Use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Use <leader>rn to rename
nmap <leader>rn <Plug>(coc-rename)

" Use <leader>f to format code
nmap <leader>f <Plug>(coc-format)

" Setup formatexpr specified filetype(s)
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format the current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold the current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Remap for do codeAction of selected region
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use <leader>f for formatting selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
