local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Using a non-default branch
Plug('neoclide/coc.nvim', { ['branch'] = 'release' , ['do']="npm ci" })
Plug('zaldih/themery.nvim')
-- Use 'dir' option to install plugin in a non-default directory
Plug('junegunn/fzf', { ['dir'] = '~/.fzf' })

-- Post-update hook: run a shell command after installing or updating the plugin
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })
Plug('jiangmiao/auto-pairs')

-- Post-update hook can be a lambda expression
Plug('junegunn/fzf', { ['do'] = function()
  vim.fn['fzf#install']()
end })

-- On-demand loading: loaded when the specified command is executed
Plug('preservim/nerdtree', { ['on'] = 'NERDTreeToggle' })

-- tokyo night theme
Plug('ghifarit53/tokyonight-vim')

vim.call('plug#end')

-- Minimal config
require("themery").setup({
  themes = {"tokyonight"}, -- Your list of installed colorschemes
  themeConfigFile = "~/.config/nvim/lua/theme.lua", -- Described below
  livePreview = true, -- Apply theme while browsing. Default to true.
})
