return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    branch = 'main',
    lazy = false,

    config = function()
        local treesitter = require 'nvim-treesitter'

        treesitter.install {
            'bash',
            'c',
            'cpp',
            'dockerfile',
            'go',
            'html',
            'javascript',
            'json',
            'json5',
            'lua',
            'markdown',
            'markdown_inline',
            'python',
            'regex',
            'toml',
            'tsx',
            'typescript',
            'vim',
            'vimdoc',
            'yaml',
        }

        vim.api.nvim_create_autocmd('FileType', {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}
