return {
    'saghen/blink.cmp',
    dependencies = {
        -- 'LuaSnip',
        { 'L3MON4D3/LuaSnip', version = 'v2.*' },
        'rafamadriz/friendly-snippets',
    },
    event = 'InsertEnter',

    version = '*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = { preset = 'default' },
        completion = {
            menu = {
                border = 'single',
                draw = {
                    columns = {
                        { 'label', 'label_description', gap = 1 },
                        { 'kind_icon', 'kind', gap = 1 },
                    },
                },
            },
            list = {
                selection = {
                    preselect = false,
                    auto_insert = true,
                },
                max_items = 10,
            },
            documentation = {
                auto_show = true,
                window = { border = 'single' },
            },
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono',
            kind_icons = vim.g.kind_icons,
        },
        snippets = { preset = 'luasnip' },
        -- cmdline = { enabled = false },
        sources = {
            default = { 'lsp', 'snippets', 'buffer', 'path' },
        },
    },
}
