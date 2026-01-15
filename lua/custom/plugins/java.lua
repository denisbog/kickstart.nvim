return {
  'mfussenegger/nvim-jdtls',
  ft = 'java',
  dependencies = {
    'mfussenegger/nvim-dap',
    {
      'williamboman/mason.nvim',
      opts = { ensure_installed = { 'java-debug-adapter', 'java-test' } },
    },
  },
  opts = {
    -- config_overrides = {
    --   {
    --     type = 'java',
    --     request = 'attach',
    --     name = 'Debug (Attach) - Remote 8000',
    --     hostName = '127.0.0.1',
    --     port = 8000,
    --   },
    --   {
    --     type = 'java',
    --     request = 'attach',
    --     name = 'Debug (Attach) - Remote 8001',
    --     hostName = '127.0.0.1',
    --     port = 8001,
    --   },
    --   {
    --     type = 'java',
    --     request = 'attach',
    --     name = 'Debug (Attach) - Remote 8002',
    --     hostName = '127.0.0.1',
    --     port = 8002,
    --   },
    -- },
  },
  config = function()
    -- vim.lsp.enable 'jdtls'
    -- local bundles = {
    --   vim.fn.glob(vim.fn.stdpath 'data' .. '/mason/share/java-debug-adapter/' .. 'com.microsoft.java.debug.plugin-*.jar', 1),
    -- }
    -- local config = {
    --   name = 'jdtls',
    --
    --   -- `cmd` defines the executable to launch eclipse.jdt.ls.
    --   -- `jdtls` must be available in $PATH and you must have Python3.9 for this to work.
    --   --
    --   -- As alternative you could also avoid the `jdtls` wrapper and launch
    --   -- eclipse.jdt.ls via the `java` executable
    --   -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    --   cmd = {
    --     -- vim.fn.stdpath 'data' .. '/mason/packages/jdtls/bin/' .. 'jdtls',
    --     'jdtls',
    --     '--jvm-arg=-Dtest=test',
    --     -- '--jvm-arg=-javaagent:' .. vim.fn.stdpath 'data' .. '/mason/packages/jdtls/' .. 'lombok.jar',
    --   },
    --
    --   -- `root_dir` must point to the root of your project.
    --   -- See `:help vim.fs.root`
    --   root_dir = vim.fs.root(0, { 'gradlew', '.git', 'mvnw' }),
    --
    --   -- Here you can configure eclipse.jdt.ls specific settings
    --   -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    --   -- for a list of options
    --   settings = {
    --     java = {},
    --   },
    --
    --   -- This sets the `initializationOptions` sent to the language server
    --   -- If you plan on using additional eclipse.jdt.ls plugins like java-debug
    --   -- you'll need to set the `bundles`
    --   --
    --   -- See https://codeberg.org/mfussenegger/nvim-jdtls#java-debug-installation
    --   --
    --   -- If you don't plan on any eclipse.jdt.ls plugins you can remove this
    --   init_options = {
    --     bundles = bundles,
    --   },
    -- }
    -- require('jdtls').start_or_attach(config)

    local dap = require 'dap'
    -- local util = require 'jdtls.util'

    -- dap.adapters.java = function(callback)
    --   util.execute_command({ command = 'vscode.java.startDebugSession' }, function(err0, port)
    --     assert(not err0, vim.inspect(err0))
    --     callback {
    --       type = 'server',
    --       host = '127.0.0.1',
    --       port = port,
    --     }
    --   end)
    -- end
    --
    -- local projectName = os.getenv 'PROJECT_NAME'
    dap.configurations.java = {
      {
        type = 'java',
        request = 'attach',
        name = 'Debug (Attach) - Remote 8000',
        hostName = '127.0.0.1',
        port = 8000,
      },
      {
        type = 'java',
        request = 'attach',
        name = 'Debug (Attach) - Remote 8001',
        hostName = '127.0.0.1',
        port = 8001,
      },
      {
        type = 'java',
        request = 'attach',
        name = 'Debug (Attach) - Remote 8002',
        hostName = '127.0.0.1',
        port = 8002,
      },
    }
  end,
}
