local dap =  require('dap')
local dapui = require('dapui')
dapui.setup();

dap.adapters.gdb = ***REMOVED***
  type = "executable",
  command = "gdb",
  args = ***REMOVED*** "-i", "dap" ***REMOVED***
***REMOVED***

dap.configurations.cpp = ***REMOVED***
  ***REMOVED***
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = function()
      return vim.fn.input('Args: ', '')
    end,
    cwd = "$***REMOVED***workspaceFolder***REMOVED***",
  ***REMOVED***,
***REMOVED***

dap.listeners.after.event_initialized["dapui_config"]=function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"]=function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"]=function()
  dapui.close()
end

vim.fn.sign_define('DapBreakpoint',***REMOVED*** text ='🔴', texthl ='', linehl ='', numhl =''***REMOVED***)
vim.fn.sign_define('DapStopped',***REMOVED*** text ='▶️', texthl ='', linehl ='', numhl =''***REMOVED***)
