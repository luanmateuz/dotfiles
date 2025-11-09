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
            {
                'igorlfs/nvim-dap-view',
                opts = {
                    winbar = {
                        sections = { 'scopes', 'breakpoints', 'threads', 'exceptions', 'repl', 'console' },
                        default_section = 'scopes',
                    },
                    windows = { height = 14 },
                    -- When jumping through the call stack, try to switch to the buffer if already open in
                    -- a window, else use the last window to open the buffer.
                    switchbuf = 'usetab,uselast',
                },
            },
            'mfussenegger/nvim-dap-python',
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
                desc = 'Toggle breakpoint',
            },
            {
                '<leader>dc',
                function()
                    require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition:')
                end,
                desc = 'Breakpoint condition',
            },
            {
                '<leader>ds',
                function()
                    require('dap').continue()
                end,
                desc = 'Start / Continue',
            },
            {
                '<leader>do',
                function()
                    require('dap').step_over()
                end,
                desc = 'Step Over',
            },
            {
                '<leader>di',
                function()
                    require('dap').step_into()
                end,
                desc = 'Step Into',
            },
            {
                '<leader>dO',
                function()
                    require('dap').step_out()
                end,
                desc = 'Step Out',
            },
            {
                '<leader>dq',
                function()
                    require('dap').terminate()
                end,
                desc = 'Keymap to terminate debugging',
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
            dap.listeners.before.event_terminated['dap-view-config'] = function()
                dv.close()
            end
            dap.listeners.before.event_exited['dap-view-config'] = function()
                dv.close()
            end
        end,
    },
}
