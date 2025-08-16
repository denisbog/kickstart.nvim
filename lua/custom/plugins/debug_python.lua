return {
  {
    'mfussenegger/nvim-dap',
    optional = true,
    dependencies = {
      'mfussenegger/nvim-dap-python',
      -- stylua: ignore
      keys = {
        { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method" },
        { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class" },
      },
      config = function()
        local path = require('mason-registry').get_package('debugpy'):get_install_path()
        if vim.loop.os_uname().sysname:find 'Windows' then
          require('dap-python').setup(path .. '\\venv\\bin\\python')
        else
          require('dap-python').setup(path .. '/venv/bin/python', {
            include_configs = false,
          })
        end

        local venv_path = os.getenv 'VIRTUAL_ENV' or os.getenv 'CONDA_PREFIX'
        local pythonPath = venv_path and ((vim.fn.has 'win32' == 1 and venv_path .. '/Scripts/python') or venv_path .. '/bin/python')

        local dap = require 'dap'
        local configs = dap.configurations.python or {}
        dap.configurations.python = configs
        table.insert(configs, {
          justMyCode = false,
          type = 'python',
          --request = 'executable',
          request = 'launch',
          name = 'VENV Debug',
          program = '${file}',
          pythonPath = pythonPath,
          console = 'integratedTerminal',
        })
      end,
    },
  },
}
