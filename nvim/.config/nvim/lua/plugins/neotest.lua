return {
    'nvim-neotest/neotest',
    dependencies = {
        'nvim-neotest/nvim-nio',
        'nvim-lua/plenary.nvim',
        'antoinemadec/FixCursorHold.nvim',
        'nvim-treesitter/nvim-treesitter',
        'nvim-neotest/neotest-python',
        'fredrikaverpil/neotest-golang',
    },
    keys = {
        {
            '<leader>Tt',
            function()
                require('neotest').run.run(vim.fn.expand '%')
            end,
            desc = 'Run File',
        },
        {
            '<leader>TT',
            function()
                require('neotest').run.run(vim.uv.cwd())
            end,
            desc = 'Run All Test Files',
        },
        {
            '<leader>Tr',
            function()
                require('neotest').run.run()
            end,
            desc = 'Run Nearest',
        },
        {
            '<leader>Tl',
            function()
                require('neotest').run.run_last()
            end,
            desc = 'Run Last',
        },
        {
            '<leader>Td',
            function()
                require('neotest').run.run { strategy = 'dap' }
            end,
            desc = 'Debug Nearest',
        },
        {
            '<leader>Tw',
            function()
                require('neotest').watch.toggle()
            end,
            desc = 'Toggle Watch',
        },
        {
            '<leader>Ts',
            function()
                require('neotest').summary.toggle()
            end,
            desc = 'Toggle Summary',
        },
        {
            '<leader>TO',
            function()
                require('neotest').output.open { enter = true, auto_close = true }
            end,
            desc = 'Show Output',
        },
        {
            '<leader>To',
            function()
                require('neotest').output_panel.toggle()
            end,
            desc = 'Toggle Output Panel',
        },
        {
            '<leader>TS',
            function()
                require('neotest').run.stop()
            end,
            desc = 'Stop',
        },
        {
            '<leader>T]',
            function()
                require('neotest').jump.next { status = 'failed' }
            end,
            desc = 'Next Failed Test',
        },
        {
            '<leader>T[',
            function()
                require('neotest').jump.prev { status = 'failed' }
            end,
            desc = 'Prev Failed Test',
        },
    },
    config = function()
        require('neotest').setup {
            quickfix = {
                open = false,
                enabled = false,
            },
            status = {
                virtual_text = false,
                signs = true,
            },
            output = {
                open_on_run = false,
            },
            strategies = {
                integrated = {
                    width = 180,
                },
            },
            summary = {
                open = 'botright vsplit | vertical resize 75',
            },
            floating = { border = 'single' },
            icons = {
                child_indent = '│',
                child_prefix = '├',
                final_child_indent = ' ',
                final_child_prefix = '└',
                non_collapsible = '─',
                collapsed = '─',
                expanded = '┐',

                failed = 'x',
                notify = 'n',
                passed = 'v',
                running = 'r',
                skipped = 's',
                test = 't',
                unknown = '?',
                watching = 'w',
            },
            adapters = {
                require 'neotest-python' {
                    dap = { justMyCode = false, console = 'integratedTerminal', subProcess = false },
                    args = { '-vv' },
                },
                require 'neotest-golang' {},
            },
        }
    end,
}
