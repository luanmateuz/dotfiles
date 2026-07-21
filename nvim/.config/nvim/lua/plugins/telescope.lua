-- fzf-native (optional)
if vim.fn.executable 'make' == 1 then
    vim.pack.add {
        'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    }

    -- compiler
    local install_path = vim.fn.stdpath 'data' .. '/site/pack/core/opt/telescope-fzf-native.nvim'

    if vim.fn.isdirectory(install_path) == 1 then
        vim.system({ 'make' }, { cwd = install_path }):wait()
    end
end

local telescope = require 'telescope'

telescope.setup {
    defaults = {
        winblend = 0,
        border = true,
        borderchars = {
            '─',
            '│',
            '─',
            '│',
            '┌',
            '┐',
            '┘',
            '└',
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        },
    },
}

pcall(telescope.load_extension, 'fzf')

local builtin = require 'telescope.builtin'
local map = vim.keymap.set

map('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })

map('n', '<leader>fF', function()
    builtin.find_files {
        hidden = true,
    }
end, { desc = 'Find hidden files' })

map('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
map('n', '<leader>fd', builtin.diagnostics, { desc = 'Diagnostics' })
