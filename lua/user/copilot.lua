local M = {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
}

function M.config()
    require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
    })
end

return M
