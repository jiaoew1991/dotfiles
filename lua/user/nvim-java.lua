local M = {
    "nvim-java/nvim-java",
}

function M.config()
    require('java').setup()
end

return M
