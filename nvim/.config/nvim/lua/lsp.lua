vim.lsp.config['basedpyright'] = {
    cmd = { 'basedpyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json' },
    single_file_support = true,
    settings = {
        analysis = {
            autoSearchPaths = true,
            diagnosticMode = 'openFilesOnly',
            useLibraryCodeForTypes = true,
        },
    },
}

vim.lsp.config['clangd'] = {
    cmd = { 'clangd' },
    root_markers = { '.clangd', '.clang-format' },
    filetypes = { 'c', 'cpp' },
}

vim.lsp.config['gopls'] = {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_markers = { 'go.work', 'go.mod', '.git' },
    single_file_support = true,
}

vim.lsp.config['lua_ls'] = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luacheckrc', '.stylua.toml', 'stylua.toml' },
    single_file_support = true,
}

vim.diagnostic.config {
    signs = true,
    underline = true,
    severity_sort = true,
    virtual_text = false,
    float = {
        border = 'single',
        source = 'if_many',
    },
}

vim.lsp.enable { 'basedpyright', 'clangd', 'gopls', 'lua_ls' }
