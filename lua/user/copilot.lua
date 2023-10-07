local M = {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
}

function M.config()
    require("copilot").setup({})
end

return M
