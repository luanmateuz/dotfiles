-- npm i -g bash-language-server
---@type vim.lsp.Config
return {
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'bash', 'sh', 'zsh' },
}
