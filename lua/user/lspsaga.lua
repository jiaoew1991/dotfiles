local M = {
    "nvimdev/lspsaga.nvim",
}

function M.config()
    local lspsaga = require("lspsaga")
    lspsaga.setup({
        symbol_in_winbar = {
            enable = true,
            separator = '  ',
            hide_keyword = true,
            show_file = true,
            folder_level = 2,
            color_mode = true,
        },
        ui = {
            border = "rounded",
        },
        lightbulb = {
            enable = false,
        },
        outline = {
            layout = "normal",
            keys = {
                jump = "<CR>",
            },
        },
        finder = {
            keys = {
                edit = "<CR>",
                vsplit = "v",
                split = "s",
                tabe = "t",
                quit = "q",
            },
        },
    })
end

return M
