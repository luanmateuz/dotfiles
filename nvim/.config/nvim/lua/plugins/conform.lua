return {
    'stevearc/conform.nvim',
    event = 'BufWritePre',

    keys = {
        {
            '<leader>f',
            mode = { 'n', 'v' },
            function()
                require('conform').format {
                    lsp_format = 'fallback',
                    async = false,
                    timeout_ms = 1000,
                }
            end,
        },
    },
    opts = {
        formatters_by_ft = {
            c = { 'clang-format' },
            go = { 'gofmt', 'goimports' },
            lua = { 'stylua' },
        },
        format_on_save = {
            async = false,
            timeout_ms = 10000,
            lsp_format = 'fallback',
        },
    },
}
