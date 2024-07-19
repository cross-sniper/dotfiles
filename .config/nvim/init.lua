local fns = require("fns")
local global = vim.g

-- Relative number
fns.set("relativenumber")

-- Tab settings
fns.set("tabstop", 4)
fns.set("softtabstop", 4)
fns.set("shiftwidth", 2)
fns.set("expandtab")

-- Additional settings
fns.set("number")              -- Enable line numbers
fns.set("smartindent")         -- Enable smart indentation
fns.set("autoindent")          -- Enable automatic indentation
fns.set("wrap")                -- Enable line wrapping
fns.set("cursorline")          -- Highlight the current line
fns.set("hlsearch")            -- Highlight search results
fns.set("incsearch")           -- Show incremental search results

-- Other useful options
fns.cmd("syntax on")           -- Enable syntax highlighting
fns.cmd("filetype plugin indent on")  -- Enable file type detection, plugins, and indent


-- common mappings
fns.keymap("n","<leader>u","undo")
fns.keymap("n","<leader>w","w")
fns.keymap("n","<leader>q","q")
fns.keymap("n","<leader>wq","q")




-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {import = "plugins"},
    {import = "colorschemes"},
    {import = "lsp"},
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Load all files from the keybinds folder
local keybinds_path = vim.fn.stdpath('config') .. '/lua/keybinds/'
local keybinds_files = fns.scandir(keybinds_path)
for _, file in ipairs(keybinds_files) do
	if not (file == "." or file == "..") then
		require("keybinds."..fns.ignoreLetters(".lua",file))
	end
end

-- Airline configuration
global['airline#extensions#tabline#enabled'] = 1
global['airline#extensions#tabline#formatter'] = 'default'
