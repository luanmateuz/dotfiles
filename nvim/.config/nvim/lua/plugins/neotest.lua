local neotest = require 'neotest'

neotest.setup {
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

local map = vim.keymap.set

map('n', '<leader>tt', function()
    neotest.run.run(vim.fn.expand '%')
end, { desc = 'Run File' })
map('n', '<leader>tT', function()
    neotest.run.run(vim.uv.cwd())
end, { desc = 'Run All Test Files' })
map('n', '<leader>tr', function()
    neotest.run.run()
end, { desc = 'Run Nearest' })
map('n', '<leader>tl', function()
    neotest.run.run_last()
end, { desc = 'Run Last' })
map('n', '<leader>td', function()
    neotest.run.run { strategy = 'dap' }
end, { desc = 'Debug Nearest' })
map('n', '<leader>tw', function()
    neotest.watch.toggle()
end, { desc = 'Toggle Watch' })
map('n', '<leader>ts', function()
    neotest.summary.toggle()
end, { desc = 'Toggle Summary' })
map('n', '<leader>to', function()
    neotest.output.open { enter = true, auto_close = true }
end, { desc = 'Show Output' })
map('n', '<leader>tO', function()
    neotest.output_panel.toggle()
end, { desc = 'Toggle Output Panel' })
map('n', '<leader>tS', function()
    neotest.run.stop()
end, { desc = 'Stop' })
map('n', '<leader>t]', function()
    neotest.jump.next { status = 'failed' }
end, { desc = 'Next Failed Test' })
map('n', '<leader>t[', function()
    neotest.jump.prev { status = 'failed' }
end, { desc = 'Prev Failed Test' })
