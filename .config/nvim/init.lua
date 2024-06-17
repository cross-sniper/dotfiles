print("z-dev nvim config v1")
vim.g.leader = " "
vim.cmd("set path=**")
vim.opt.mouse = "a"
vim.opt.syntax = "on"

vim.opt.relativenumber = true

vim.opt.showtabline=2

vim.opt.laststatus = 2

vim.opt.showmode = true

vim.opt.smartindent = true

vim.opt.cmdheight = 2
vim.opt.showcmd = true

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileformats = "unix,dos"

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
