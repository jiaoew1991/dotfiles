local M = {
    "nvim-telescope/telescope.nvim",
    commit = "0.1.8",
    event = "Bufenter",
    cmd = { "Telescope" },
    dependencies = {
        {
            "nvim-lua/plenary.nvim",
            "ahmedkhalf/project.nvim",
            "princejoogie/dir-telescope.nvim",
            "isak102/telescope-git-file-history.nvim",
            dependencies = { "tpope/vim-fugitive" }

        },
    },
}

M.opts = {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        file_ignore_patterns = { ".git/", "node_modules" },
        --    mappings = {
        --      i = {
        --        ["<Down>"] = require("telescope.actions").move_selection_next,
        --        ["<Up>"] = require("telescope.actions").move_selection_previous,
        --        ["<C-j>"] = require("telescope.actions").move_selection_next,
        --        ["<C-k>"] = require("telescope.actions").move_selection_previous,
        --      },
        --    },
    },
}

function M.config()
    require("telescope").load_extension("dir")
    require("telescope").load_extension("git_file_history")
end

return M
