vim.pack.add({
  "https://github.com/mfussenegger/nvim-dap",
  { src = "https://github.com/igorlfs/nvim-dap-view", version = vim.version.range("1.*") },
})

local icons = {
  Stopped = { "", "DiagnosticWarn", "DapStoppedLine" },
  Breakpoint = "",
  BreakpointCondition = "",
  BreakpointRejected = { "", "DiagnosticError" },
  LogPoint = "",
}
for name, sign in pairs(icons) do
  sign = type(sign) == "table" and sign or { sign }
  vim.fn.sign_define("Dap" .. name, {
      -- stylua: ignore
      text = sign[1] --[[@as string]] .. ' ',
    texthl = sign[2] or "DiagnosticInfo",
    linehl = sign[3],
    numhl = sign[3],
  })
end

local dap = require("dap")

-- Lua configurations.
dap.adapters.nlua = function(callback, config)
  callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
end
dap.configurations["lua"] = {
  {
    type = "nlua",
    request = "attach",
    name = "Attach to running Neovim instance",
  },
}
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set(
  "n",
  "<leader>dc",
  function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
  { desc = "Toggle Breakpoint" }
)
vim.keymap.set("n", "<leader>dn", function() dap.continue() end, { desc = "Continue" })
vim.keymap.set("n", "<leader>ds", function() dap.step_over() end, { desc = "Step over" })
vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "Step into" })
vim.keymap.set("n", "<leader>do", function() dap.step_out() end, { desc = "Step out" })

vim
  .iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
  :map(function(file) return vim.fn.fnamemodify(file, ":t:r") end)
  :totable()

dap.adapters.lldb = {
  type = "executable",
  command = "/Applications/Xcode.app/Contents/Developer/usr/bin/lldb-dap",
  name = "lldb",
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp

local dap_view = require("dap-view")
dap_view.setup({
  winbar = {
    sections = { "scopes", "breakpoints", "threads", "exceptions", "repl", "console" },
    default_section = "scopes",
  },
  windows = { size = 0.5, position = "right" },
  virtual_text = {
    enabled = true,
  },
})

-- Automatically open the UI when a new debug session is created.
dap.listeners.before.attach.dapui_config = function() dap_view.open() end
dap.listeners.before.launch.dapui_config = function() dap_view.open() end
dap.listeners.before.event_terminated.dapui_config = function() dap_view.close() end
dap.listeners.before.event_exited.dapui_config = function() dap_view.close() end
