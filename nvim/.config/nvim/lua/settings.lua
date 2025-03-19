vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.opt.guicursor = ''
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartcase = true
vim.opt.ignorecase = true

-- sync clipboard between the OS and Neovim
vim.opt.clipboard = 'unnamedplus'

vim.opt.scroll = 4
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '80'
vim.opt.isfname:append '@-@'

vim.opt.updatetime = 50

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', space = '·' }

vim.opt.laststatus = 2
vim.opt.cmdheight = 1

-- Disable health checks for these providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
