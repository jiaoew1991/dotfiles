local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end
require("nvim-dap-virtual-text").setup {
  commented = true,
}

local dapui = require "dapui"
dapui.setup {} -- use default
require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  controls = {
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "↻",
      terminate = "✖",
    }
  }
})
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
