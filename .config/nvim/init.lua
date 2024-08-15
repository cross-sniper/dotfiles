local fns = require("fns")
local global = vim.g

-- Relative number
fns.set("relativenumber")

-- Tab settings
fns.set("tabstop", 4)
fns.set("softtabstop", 4)
fns.set("shiftwidth", 4)
fns.set("expandtab")

-- Additional settings
fns.set("number")      -- Enable line numbers
fns.set("smartindent") -- Enable smart indentation
fns.set("autoindent")  -- Enable automatic indentation
fns.set("wrap")        -- Enable line wrapping
fns.set("cursorline")  -- Highlight the current line
fns.set("hlsearch")    -- Highlight search results
fns.set("incsearch")   -- Show incremental search results

-- Other useful options
fns.cmd("syntax on")                 -- Enable syntax highlighting
fns.cmd("filetype plugin indent on") -- Enable file type detection, plugins, and indent


-- common mappings
fns.keymap("n", "<leader>u", "undo")
fns.keymap("n", "<leader>w", "w")
fns.keymap("n", "<leader>q", "q")
fns.keymap("n", "<leader>wq", "q")




-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
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
        { import = "plugins" },
        { import = "colorschemes" },
        { import = "lsp" },
    },
    -- automatically check for plugin updates
    checker = { enabled = true }
})

-- Load all files from the keybinds folder
local keybinds_path = vim.fn.stdpath('config') .. '/lua/keybinds/'
local keybinds_files = fns.scandir(keybinds_path)
for _, file in ipairs(keybinds_files) do
    if not (file == "." or file == "..") then
        require("keybinds." .. fns.ignoreLetters(".lua", file))
    end
end
require("autocmds")


-- this was taken from: https://github.com/rusty-electron/dotfiles/blob/master/.config/nvim/lsp.lua
-- [[
local opts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See :help vim.lsp.* for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl',
        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'lua_ls', 'clangd', "ols", "html", "gopls"}
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = {
            -- This will be the default in neovim 0.7+
            debounce_text_changes = 150,
        }
    }
end
-- ]]
