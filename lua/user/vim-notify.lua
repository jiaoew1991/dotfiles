local M = {
    "rcarriga/nvim-notify",
    commit = "v3.12.0",
    event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

function M.config()
    require("notify").setup()
end

return M
