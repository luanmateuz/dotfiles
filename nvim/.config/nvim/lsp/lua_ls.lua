-- asdf install lua-language-server
---@type vim.lsp.Config
return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = {
        '.luacheckrc',
        '.luarc.json',
        '.luarc.jsonc',
        '.stylua.toml',
        'stylua.toml',
    },
    single_file_support = true,
    settings = {
        Lua = {
            completion = { callSnippet = 'Replace' },
            -- Using stylua for formatting.
            format = { enable = false },
            hint = {
                enable = true,
                arrayIndex = 'Disable',
            },
            runtime = {
                version = 'LuaJIT',
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    '${3rd}/luv/library',
                },
            },
        },
    },
}
