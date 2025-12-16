local icons = {
    Stopped = { 'S', 'DiagnosticWarn', 'DapStoppedLine' },
    Breakpoint = { 'B', 'DiagnosticInfo' },
    BreakpointCondition = { '?', 'DiagnosticInfo' },
    BreakpointRejected = { '!', 'DiagnosticError' },
}

for name, sign in pairs(icons) do
    vim.fn.sign_define('Dap' .. name, {
        text = (sign[1] or '?') .. ' ',
        texthl = sign[2] or 'DiagnosticInfo',
        linehl = sign[3],
        numhl = sign[3],
    })
end

return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'mfussenegger/nvim-dap-python',
            {
                'igorlfs/nvim-dap-view',
                opts = {
                    winbar = {
                        show = true,
                        sections = { 'scopes', 'breakpoints', 'threads', 'exceptions', 'repl', 'console' },
                        default_section = 'scopes',
                    },
                    windows = {
                        height = 0.35,
                    },
                    -- When jumping through the call stack, try to switch to the buffer if already open in
                    -- a window, else use the last window to open the buffer.
                    switchbuf = 'usetab,uselast',
                },
            },
            {
                'theHamsta/nvim-dap-virtual-text',
                opts = { virt_text_pos = 'eol' },
            },
        },
        keys = {
            {
                '<leader>db',
                function()
                    require('dap').toggle_breakpoint()
                end,
                desc = 'Toggle Breakpoint',
            },
            {
                '<leader>dB',
                function()
                    require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
                end,
                desc = 'Breakpoint Condition',
            },
            {
                '<leader>dc',
                function()
                    require('dap').continue()
                end,
                desc = 'Run/Continue',
            },
            {
                '<leader>dC',
                function()
                    require('dap').run_to_cursor()
                end,
                desc = 'Run to Cursor',
            },
            {
                '<leader>dg',
                function()
                    require('dap').goto_()
                end,
                desc = 'Go to Line (No Execute)',
            },
            {
                '<leader>dj',
                function()
                    require('dap').down()
                end,
                desc = 'Down',
            },
            {
                '<leader>dk',
                function()
                    require('dap').up()
                end,
                desc = 'Up',
            },
            {
                '<leader>dl',
                function()
                    require('dap').run_last()
                end,
                desc = 'Run Last',
            },
            {
                '<leader>di',
                function()
                    require('dap').step_into()
                end,
                desc = 'Step Into',
            },
            {
                '<leader>dn',
                function()
                    require('dap').step_over()
                end,
                desc = 'Step Over',
            },
            {
                '<leader>do',
                function()
                    require('dap').step_out()
                end,
                desc = 'Step Out',
            },
            {
                '<leader>dP',
                function()
                    require('dap').pause()
                end,
                desc = 'Pause',
            },
            {
                '<leader>ds',
                function()
                    require('dap').session()
                end,
                desc = 'Session',
            },
            {
                '<leader>dt',
                function()
                    require('dap-view').toggle()
                end,
                desc = 'Toggle DAP UI',
            },
            {
                '<leader>dq',
                function()
                    require('dap').terminate()
                    require('dap-view').close()
                    require('nvim-dap-virtual-text').toggle()
                end,
                desc = 'Quit',
                nowait = true,
                remap = true,
            },
            -- python
            {
                '<leader>ptm',
                function()
                    require('dap-python').test_method()
                end,
                desc = '[Python] Test Method',
                silent = true,
            },
            {
                '<leader>ptc',
                function()
                    require('dap-python').test_class()
                end,
                desc = '[Python] Test Class',
                silent = true,
            },
        },
        config = function()
            local dap = require 'dap'
            local dv = require 'dap-view'

            local dap_py = require 'dap-python'
            local dap_vt = require 'nvim-dap-virtual-text'

            dap_py.setup 'uv'
            dap_vt.setup {
                commented = true, -- Show virtual text alongside comment
            }

            dap.listeners.before.attach['dap-view-config'] = function()
                dv.open()
            end
            dap.listeners.before.launch['dap-view-config'] = function()
                dv.open()
            end
            dap.listeners.before.event_terminated['dap-view-config'] = function(session)
                if session.config.type == 'python' then
                    return
                end
                dv.close()
            end
            dap.listeners.before.event_exited['dap-view-config'] = function(session)
                if session.config.type == 'python' then
                    return
                end
                dv.close()
            end
        end,
    },
}
