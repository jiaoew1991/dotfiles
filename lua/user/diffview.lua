return {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
    keys = {
        { "<leader>gD", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
        { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
        { "<leader>gQ", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
    },
    opts = {
        view = {
            default = { layout = "diff2_horizontal" },
        },
    },
}
