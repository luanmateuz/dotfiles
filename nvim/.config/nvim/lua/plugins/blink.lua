local blink = require 'blink.cmp'

blink.setup {
    keymap = { preset = 'default' },
    appearance = {
        nerd_font_variant = 'normal',
        use_nvim_cmp_as_default = true,
    },
    completion = {
        accept = {
            create_undo_point = false,
            auto_brackets = {
                enabled = true,
            },
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
        },
        list = {
            max_items = 10,
            selection = {
                preselect = false,
                auto_insert = true,
            },
        },
        menu = {
            border = 'single',
            draw = {
                treesitter = { 'lsp' },
            },
        },
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    signature = {
        enabled = true,
    },
}
