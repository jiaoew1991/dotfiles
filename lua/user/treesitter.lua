local M = {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    dependencies = {
        {
            "nvim-tree/nvim-web-devicons",
            event = "VeryLazy",
        },
    },
}
function M.config()
    local treesitter = require "nvim-treesitter"
    treesitter.install { 'rust', 'javascript', 'zig', 'typescript', 'tsx', 'lua', 'python', 'go', 'bash', 'c', 'cpp', 'json', 'yaml', 'markdown' }
    -- local configs = require "nvim-treesitter.configs"
    --
    -- configs.setup {
    --     ensure_installed = { "bash", "c", "cpp", "javascript", "json", "lua", "python", "tsx", "css",
    --         "rust", "java", "yaml", "go", "markdown" }, -- one of "all" or a list of languages
    --     ignore_install = { "" },                        -- List of parsers to ignore installing
    --     sync_install = false,                           -- install languages synchronously (only applied to `ensure_installed`)
    --
    --     highlight = {
    --         enable = true,       -- false will disable the whole extension
    --         disable = { "css" }, -- list of language that will be disabled
    --     },
    --     autopairs = {
    --         enable = true,
    --     },
    --     context_commentstring = {
    --         enable = true,
    --         enable_autocmd = false,
    --     },
    -- }
end

return M
