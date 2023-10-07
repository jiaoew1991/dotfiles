local M = {
    "phaazon/hop.nvim",
    branch = "v2",
    lazy = false
}

function M.config()
    require("hop").setup()
end

return M
