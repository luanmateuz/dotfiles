local autopairs = require 'nvim-autopairs'

autopairs.setup {
    check_ts = true, -- treesitter enabled
    ts_config = {
        lua = { 'string' }, -- dont add pairs in lua string treesitter nodes
    },
}
