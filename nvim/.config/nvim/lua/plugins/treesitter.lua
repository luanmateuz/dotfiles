return {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ':TSUpdate',

    config = function()
        local treesitter = require 'nvim-treesitter.configs'

        treesitter.setup {
            ensure_installed = {
                'bash',
                'c',
                'cpp',
                'dockerfile',
                'go',
                'lua',
                'markdown',
                'markdown_inline',
                'regex',
                'toml',
                'vim',
                'vimdoc',
                'yaml',
            },
            sync_install = false,
            highlight = { enable = true },
            indent = {
                enable = true,
                -- treesitter unindents yaml lists for some reason.
                disable = { 'yaml' },
            },
        }
    end,
}
