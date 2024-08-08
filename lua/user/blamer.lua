local M = {
    "psjay/blamer.nvim",
    branch = "main",
    event = "VimEnter",
}

function M.config()
    require("blamer").setup()
end

return M
