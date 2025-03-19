return {
    'bluz71/vim-moonfly-colors',
    name = 'moonfly',
    lazy = false,
    priority = 1000,

    config = function()
        vim.g.moonflyCursorColor = true
        vim.g.moonflyNormalFloat = true
        vim.g.moonflyWinSeparator = 1
        vim.g.moonflyVirtualTextColor = true

        vim.cmd [[colorscheme moonfly]]
    end,
}
