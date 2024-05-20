local M = {
    "nvim-treesitter/nvim-treesitter",
    commit = "v0.9.2",
    event = "BufReadPost",
    dependencies = {
        {
            "nvim-tree/nvim-web-devicons",
            event = "VeryLazy",
        },
    },
}
function M.config()
    local treesitter = require "nvim-treesitter"
    local configs = require "nvim-treesitter.configs"

    configs.setup {
        ensure_installed = { "bash", "c", "cpp", "javascript", "json", "lua", "python", "tsx", "css",
            "rust", "java", "yaml", "go", "markdown" }, -- one of "all" or a list of languages
        -- ensure_installed = "all", -- one of "all" or a list of languages
        ignore_install = { "" },                        -- List of parsers to ignore installing
        sync_install = false,                           -- install languages synchronously (only applied to `ensure_installed`)

        highlight = {
            enable = true,       -- false will disable the whole extension
            disable = { "css" }, -- list of language that will be disabled
        },
        autopairs = {
            enable = true,
        },
        indent = { enable = true, disable = { "python", "css" } },

        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
    }
end

return M
