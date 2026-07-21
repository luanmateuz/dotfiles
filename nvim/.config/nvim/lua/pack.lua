vim.pack.add {
    { src = 'https://github.com/windwp/nvim-autopairs' },
    { src = 'https://github.com/tpope/vim-sleuth' },
    { src = 'https://github.com/lukas-reineke/indent-blankline.nvim' },
    { src = 'https://github.com/nvim-lualine/lualine.nvim' },
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
    { src = 'https://github.com/stevearc/conform.nvim' },
    { src = 'https://github.com/lewis6991/gitsigns.nvim' },
    -- blink.cmp
    { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '1.*' },
    -- colorscheme
    { src = 'https://github.com/bluz71/vim-moonfly-colors', name = 'moonfly' },
    -- dap
    { src = 'https://github.com/mfussenegger/nvim-dap' },
    { src = 'https://github.com/igorlfs/nvim-dap-view', version = vim.version.range '1.*' },
    { src = 'https://github.com/theHamsta/nvim-dap-virtual-text' },
    -- dap go
    { src = 'https://github.com/leoluz/nvim-dap-go' },
    -- dap python
    { src = 'https://github.com/mfussenegger/nvim-dap-python' },
    -- tree-sitter
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', branch = 'main' },
    -- neotest
    { src = 'https://github.com/nvim-neotest/neotest' },
    { src = 'https://github.com/nvim-neotest/nvim-nio' },
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/antoinemadec/FixCursorHold.nvim' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
    { src = 'https://github.com/nvim-neotest/neotest-python' },
    { src = 'https://github.com/fredrikaverpil/neotest-golang' },
    -- telescope
    { src = 'https://github.com/nvim-telescope/telescope.nvim' },
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/nvim-telescope/telescope.nvim' },
    {
        src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        condition = vim.fn.executable 'make' == 1,
    },
}

require 'plugins.autopairs'
require 'plugins.blink'
require 'plugins.colorscheme'
require 'plugins.conform'
require 'plugins.dap'
require 'plugins.gitsigns'
require 'plugins.ibl'
require 'plugins.lualine'
require 'plugins.neotest'
require 'plugins.telescope'
require 'plugins.treesitter'
