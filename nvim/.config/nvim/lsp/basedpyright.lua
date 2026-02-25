-- uv tool install basedpyright
---@type vim.lsp.Config
return {
    cmd = { 'basedpyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = {
        '.venv',
        'pyproject.toml',
        'pyrightconfig.json',
        'requirements.txt',
        'setup.cfg',
        'setup.py',
    },
    single_file_support = true,
    settings = {
        basedpyright = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = 'openFilesOnly',
                useLibraryCodeForTypes = true,
            },
        },
    },
}
