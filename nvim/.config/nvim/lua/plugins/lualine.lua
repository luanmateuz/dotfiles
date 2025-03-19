return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
        local lualine = require 'lualine'

        lualine.setup {
            options = {
                theme = 'auto',
                icons_enabled = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_x = {
                    { 'diagnostics' },
                    { 'encoding' },
                    { 'fileformat' },
                    { 'filetype' },
                },
            },
            tabline = {},
        }
    end,
}
