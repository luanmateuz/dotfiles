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

local dap_view = require 'dap-view'

dap_view.setup {
    winbar = {
        show = true,
        sections = { 'watches', 'scopes', 'breakpoints', 'threads', 'exceptions', 'repl', 'console' },
        default_section = 'scopes',
        controls = {
            enabled = true,
            position = 'right',
            buttons = {
                'play',
                'step_into',
                'step_over',
                'step_out',
                'step_back',
                'run_last',
                'terminate',
                'disconnect',
            },
        },
    },
    windows = {
        size = 0.30,
    },
    icons = {
        collapsed = '󰅂 ',
        disabled = '',
        disconnect = '',
        enabled = '',
        expanded = '󰅀 ',
        filter = '󰈲',
        negate = ' ',
        pause = '',
        play = '',
        run_last = '',
        step_back = '',
        step_into = '',
        step_out = '',
        step_over = '',
        terminate = '',
    },
    -- When jumping through the call stack, try to switch to the buffer if already open in
    -- a window, else use the last window to open the buffer.
    switchbuf = 'usetab,uselast',
}

local dap_virtual_text = require 'nvim-dap-virtual-text'

dap_virtual_text.setup {
    commented = true, -- Show virtual text alongside comment
    virt_text_pos = 'eol',
}

local dap = require 'dap'

local dap_go = require 'dap-go'
local dap_py = require 'dap-python'

dap_go.setup {
    delve = {
        detached = vim.fn.has 'win32' == 0,
    },
}

-- dap_py.setup 'uv'
-- uv venv ~/.local/share/nvim/debugpy
-- uv pip install debugpy
local debugpy_path = vim.fn.stdpath 'data' .. '/debugpy/bin/python'
dap_py.setup(debugpy_path)

dap.listeners.before.attach['dap-view-config'] = function()
    dap_view.open()
end
dap.listeners.before.launch['dap-view-config'] = function()
    dap_view.open()
end

dap.listeners.before.event_exited['dap-view-config'] = function(session)
    if session.config.type ~= 'python' then
        dap_view.close()
    end
end
dap.listeners.before.event_terminated['dap-view-config'] = function(session)
    if session.config.type ~= 'python' then
        dap_view.close()
    end
end

-- keymaps
local map = vim.keymap.set

map('n', '<leader>db', function()
    dap.toggle_breakpoint()
end, { desc = 'Toggle Breakpoint' })
map('n', '<leader>dB', function()
    dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Breakpoint Condition' })
map('n', '<leader>dc', function()
    dap.continue()
end, { desc = 'Run/Continue' })
map('n', '<leader>dC', function()
    dap.run_to_cursor()
end, { desc = 'Run to Cursor' })
map('n', '<leader>dg', function()
    dap.goto_()
end, { desc = 'Go to Line (No Execute)' })
map('n', '<leader>dj', function()
    dap.down()
end, { desc = 'Down' })
map('n', '<leader>dk', function()
    dap.up()
end, { desc = 'Up' })
map('n', '<leader>dl', function()
    dap.run_last()
end, { desc = 'Run Last' })
map('n', '<leader>di', function()
    dap.step_into()
end, { desc = 'Step Into' })
map('n', '<leader>dn', function()
    dap.step_over()
end, { desc = 'Step Over' })
map('n', '<leader>do', function()
    dap.step_out()
end, { desc = 'Step Out' })
map('n', '<leader>dP', function()
    dap.pause()
end, { desc = 'Pause' })
map('n', '<leader>ds', function()
    dap.session()
end, { desc = 'Session' })
map('n', '<leader>dt', function()
    dap_view.toggle()
end, { desc = 'Toggle DAP UI' })
map('n', '<leader>dq', function()
    dap.terminate()
    dap_view.close()
    dap_virtual_text.toggle()
end, { desc = 'Quit', nowait = true, remap = true })


-- golang
map('n', '<leader>gdt', function()
    dap_go.debug_test()
end, { desc = '[Go] Debug Test', silent = true })

-- python
map('n', '<leader>ptm', function()
    dap_py.test_method()
end, { desc = '[Python] Test Method', silent = true })
map('n', '<leader>ptc', function()
    dap_py.test_class()
end, { desc = '[Python] Test Class', silent = true })
