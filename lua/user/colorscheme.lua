local M = {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  require("rose-pine").setup({
    variant = "dawn", -- match Ghostty's "Rose Pine Dawn"
  })
  local status_ok, _ = pcall(vim.cmd.colorscheme, "rose-pine-dawn")
  if not status_ok then
    return
  end
end

return M
