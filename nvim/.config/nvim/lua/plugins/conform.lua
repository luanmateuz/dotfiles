local conform = require 'conform'

conform.setup {
    formatters_by_ft = {
        c = { 'clang-format' },
        go = { 'gofmt', 'goimports' },
        lua = { 'stylua' },
        python = { 'ruff_format' },
    },
}

vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
    conform.format {
        lsp_format = 'fallback',
        async = false,
        timeout_ms = 1000,
    }
end, { desc = 'Format buffer' })
