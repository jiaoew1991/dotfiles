local M = {
    "smoka7/hop.nvim",
    version = "*",
    lazy = false,
}

function M.config()
    require("hop").setup()
end

return M
