-- go install golang.org/x/tools/gopls@latest
---@type vim.lsp.Config
return {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_markers = { '.git', 'go.mod', 'go.work' },
    single_file_support = true,
}
