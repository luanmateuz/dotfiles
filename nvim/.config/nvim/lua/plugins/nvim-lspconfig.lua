return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'saghen/blink.cmp' },

    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        local lspconfig = require 'lspconfig'

        lspconfig['lua_ls'].setup {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    completion = {
                        callSnippet = 'Replace',
                    },
                },
            },
        }
        lspconfig['gopls'].setup {
            capabilities = capabilities,
        }
        lspconfig['clangd'].setup {
            capabilities = capabilities,
        }
    end,
}
