local M = {}

vim.g.inlay_hints = false

-- Diagnostic configuration
vim.diagnostic.config {
    virtual_text = { spacing = 2 },
    float = { border = 'single', source = 'if_many' },
    signs = false,
    severity_sort = true,
}

-- Resize hover and signature help windows
local function resize_window(orig)
    return function()
        return orig {
            max_height = math.floor(vim.o.lines * 0.5),
            max_width = math.floor(vim.o.columns * 0.4),
        }
    end
end
vim.lsp.buf.hover = resize_window(vim.lsp.buf.hover)
vim.lsp.buf.signature_help = resize_window(vim.lsp.buf.signature_help)

-- LSP Events
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('luanmateuz/custom-lsp-attach', { clear = true }),
    desc = 'LSP keymaps and features',
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then
            return
        end
        local bufnr = event.buf

        local function map(lhs, rhs, desc, mode)
            vim.keymap.set(mode or 'n', lhs, rhs, { buffer = bufnr, desc = 'LSP: ' .. desc })
        end

        -- Diagnostics
        map('[e', function()
            vim.diagnostic.jump { count = -1, severity = vim.diagnostic.severity.ERROR }
        end, 'Previous error')
        map(']e', function()
            vim.diagnostic.jump { count = 1, severity = vim.diagnostic.severity.ERROR }
        end, 'Next error')
        map('<leader>gl', vim.diagnostic.open_float, 'Show Diagnostics')

        -- Navegation and code
        local telescope = require 'telescope.builtin'

        if client:supports_method 'textDocument/definition' then
            map('gD', vim.lsp.buf.declaration, 'Go to declaration')
            map('gd', telescope.lsp_definitions, 'Go to definition')
            map('gy', telescope.lsp_type_definitions, 'Type definition')
        end

        if client:supports_method 'textDocument/references' then
            map('grr', telescope.lsp_references, 'References')
        end

        if client:supports_method 'textDocument/documentSymbol' then
            map('<leader>fs', telescope.lsp_document_symbols, 'Document symbols')
        end

        -- Code and hover actions
        map('<leader>K', vim.lsp.buf.hover, 'Hover Documentation')
        map('<leader>ca', vim.lsp.buf.code_action, 'Code Action', { 'n', 'v' })
        map('<leader>rn', vim.lsp.buf.rename, 'Rename')

        if client:supports_method 'textDocument/signatureHelp' then
            map('<C-k>', vim.lsp.buf.signature_help, 'Signature help', 'i')
        end

        -- Document Highlight
        if client:supports_method 'textDocument/documentHighlight' then
            local highlight_augroup =
                vim.api.nvim_create_augroup('luanmateuz/cursor_highlights' .. bufnr, { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = bufnr,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = bufnr,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })
            vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup('luanmateuz/custom-lsp-detach-' .. bufnr, { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds { group = 'luanmateuz/cursor_highlights' .. bufnr, buffer = event2.buf }
                end,
            })
        end

        -- Inlay hints
        if client:supports_method 'textDocument/inlayHint' then
            map('<leader>th', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr })
            end, 'Toggle Inlay Hints')
        end
    end,
})

-- Init LSP
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
    once = true,
    callback = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local ok, blink = pcall(require, 'blink.cmp')
        if ok then
            capabilities = blink.get_lsp_capabilities(capabilities, true)
        end
        vim.lsp.config('*', {
            capabilities,
        })

        local servers = vim.iter(vim.api.nvim_get_runtime_file('lsp/*.lua', true))
            :map(function(file)
                return vim.fn.fnamemodify(file, ':t:r')
            end)
            :totable()

        if #servers > 0 then
            vim.lsp.enable(servers)
        end
    end,
})

return M
