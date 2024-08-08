local M = {
    "folke/which-key.nvim",
    commit = "v3.13.2",
    event = "VeryLazy",
    opts = {
        icons = {
            group = "", -- symbol prepended to a group
        },
    }
}

function M.config(_, opts)
    require("which-key").setup(opts)
    require("utils.keymap-helper").which_key_register()
end

return M
