local M = {
    "nvimdev/lspsaga.nvim",
}

function M.config()
    local lspsaga = require("lspsaga")
    lspsaga.setup({
        symbol_in_winbar = {
            enable = true,
            separator = '  ',
            hide_keyword = true,
            show_file = true,
            folder_level = 2,
            respect_root = false,
            color_mode = true,
        },
        max_preview_lines = 100,
        finder_action_keys = {
            open = "<cr>",
            vsplit = "v",
            split = "s",
            tabe = "t",
            quit = "q",
        },
        outline = {
            jump = "<CR>",
            layout = "normal",
        },
    })
end

return M
