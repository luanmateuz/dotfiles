return {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',

    require('luasnip.loaders.from_snipmate').lazy_load {
        paths = './snippets',
    },
}
