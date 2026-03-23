local M = {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        icons = {
            group = "",
        },
    },
}

function M.config(_, opts)
    require("which-key").setup(opts)
    require("utils.keymap-helper").which_key_register()
end

return M
