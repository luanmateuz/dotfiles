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
