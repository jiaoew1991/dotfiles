local M = {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
        { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                            -- Only on MacOS or Linux
    event = "VimEnter",
    opts = {
    },
}

function M.config()
    require("CopilotChat").setup({})
end

return M
