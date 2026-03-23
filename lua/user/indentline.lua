local M = {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPre",
}

M.opts = {
    indent = {
        char = "▏",
    },
    scope = {
        enabled = true,
        show_start = false,
        show_end = false,
    },
    exclude = {
        buftypes = { "terminal", "nofile" },
        filetypes = {
            "help",
            "lazy",
            "NvimTree",
            "neo-tree",
            "alpha",
        },
    },
}

return M
