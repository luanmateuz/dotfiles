return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'VeryLazy',
    -- For setting shiftwidth and tabstop automatically
    dependencies = 'tpope/vim-sleuth',

    opts = {
        indent = {
            char = '┊',
        },
        scope = {
            enabled = true,
            show_start = false,
            show_end = false,
        },
    },
}
