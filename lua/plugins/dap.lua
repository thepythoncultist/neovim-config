return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-neotest/nvim-nio',

      'mfussenegger/nvim-dap-python',
      'jbyuki/one-small-step-for-vimkind',
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      require('nvim-dap-virtual-text').setup{
        virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'eol',
      }

      require('dapui').setup()
      -- Set up dapui auto loading
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      --dap.listeners.before.event_terminated.dapui_config = function()
        --dapui.close()
      --end
      --dap.listeners.before.event_exited.dapui_config = function()
        --dapui.close()
      --end

      dap.set_log_level('TRACE')

      -- Set up python support
      dap.adapters.python = {
        type = 'executable',
        command = os.getenv('HOME') .. '/.venvs/debugpy/bin/python',
        args = { '-m', 'debugpy.adapter' },
      }
      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          pythonPath = function()
            return '/opt/homebrew/bin/python3'
          end,
          console = 'integratedTerminal',
        },
      }

      -- Set up c and rust support

      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp


      -- Set up lua support
      dap.configurations.lua = { 
        { 
          type = 'nlua', 
          request = 'attach',
          name = "Attach to running Neovim instance",
          console = 'integratedTerminal',
        }
      }
      
      dap.adapters.nlua = function(callback, config)
        require'osv'.launch({port = 8086})
        callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
      end
      -- Set up keymaps - see the github page for api bindings
      vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, {})
      vim.keymap.set('n', '<Leader>dc', dap.continue, {})
      vim.keymap.set('n', '<leader>dq', dapui.toggle)
      vim.keymap.set('n', '<leader>do', require"dap".step_over, { noremap = true })
      vim.keymap.set('n', '<leader>di', require"dap".step_into, { noremap = true })
      
    end,
  },
}
