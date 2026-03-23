local M = {
    "rcarriga/nvim-notify",
    event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

function M.config()
    require("notify").setup()
end

return M
