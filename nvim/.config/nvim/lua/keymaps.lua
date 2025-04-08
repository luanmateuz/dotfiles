local map = vim.keymap.set

-- Disable arrow keys in normal mode
local keymap_messages = {
    ['<left>'] = 'Use h to move!',
    ['<right>'] = 'Use l to move!',
    ['<up>'] = 'Use k to move!',
    ['<down>'] = 'Use j to move!',
}

for key, message in pairs(keymap_messages) do
    map('n', key, '<cmd>echo "' .. message .. '"<CR>')
end

map('n', '<leader>pv', vim.cmd.Ex)
map('n', '<leader><leader>', function()
    vim.cmd.source()
    vim.cmd.echo '"reloaded!"'
end, { desc = 'Reload source', remap = true })

map('n', '<leader>w', ':w<CR>', { desc = 'Fast saving', remap = true })
map('n', '<leader>q', ':q<CR>', { desc = 'Fast quiting', remap = true })
map('n', '<leader>Q', ':q!<CR>', { desc = 'Fast Quiting', remap = true })

map({ 'n', 'v' }, '<leader>y', '"+y')

map('n', '<space>', ' /', { desc = '<space> to / (search) ', remap = true })
map('n', '<C-space>', ' ?', { desc = 'ctrl + <space> to ? (backwards search)', remap = true })

-- Disable highligth when <leader><cr> pressed
map('n', '<leader><CR>', vim.cmd.noh)

-- Diagnostics and lsp

map('n', '<leader>gl', vim.diagnostic.open_float, { desc = 'Show Diagnostics' })
map('n', '<leader>[d', vim.diagnostic.goto_next, { desc = 'Go to Next' })
map('n', '<leader>]d', vim.diagnostic.goto_prev, { desc = 'Go to Prev' })
map('n', '<leader>K', vim.lsp.buf.hover, { desc = 'Show Documentation' })
map('n', '<leader>gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
map('n', '<leader>gD', vim.lsp.buf.declaration, { desc = 'Go to Declaration' })
map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = 'See available code actions' })
