local fn = vim.fn

-- Automatically install packer
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup("user", {
  install = { colorscheme = { require("user.colorscheme").name } },
  defaults = { lazy = true, version = "57cce98dfdb2f2dd05a0567d89811e6d0505e13b" },
  ui = { wrap = "true" },
  change_detection = { enabled = true },
  debug = false,
  performance = {
    rtp = {
      disabled_plugins = {
        -- "gzip", -- Plugin for editing compressed files.
        -- "matchit", -- What is it?
        --  "matchparen", -- Plugin for showing matching parens
        --  "netrwPlugin", -- Handles file transfers and remote directory listing across a network
        --  "tarPlugin", -- Plugin for browsing tar files
        --  "tohtml", -- Converting a syntax highlighted file to HTML
        --  "tutor", -- Teaching?
        --  "zipPlugin", -- Handles browsing zipfiles
      },
    },
  },
})
-- return lazy.setup({
--     -- My plugins here
--
--     { "nvim-lua/plenary.nvim" },  -- Useful lua functions used by lots of plugins
--     { "windwp/nvim-autopairs" },  -- Autopairs, integrates with both cmp and treesitter
--     {
--         "phaazon/hop.nvim",
--         branch = "v2",
--         config = function()
--             require("hop").setup()
--         end
--     },
--     { "numToStr/Comment.nvim" },
--     { "nvim-tree/nvim-web-devicons" },
--     { "s1n7ax/nvim-window-picker",  tag = "v1.5" },
--     {
--         "nvim-neo-tree/neo-tree.nvim",
--         branch = "v3.x",
--         dependencies = {
--             "MunifTanjim/nui.nvim",
--         }
--     },
--     { "akinsho/bufferline.nvim" },
--     { "moll/vim-bbye" },
--     { "nvim-lualine/lualine.nvim" },
--     { "akinsho/toggleterm.nvim" },
--     { "ahmedkhalf/project.nvim" },
--     { "lewis6991/impatient.nvim" },
--     { "lukas-reineke/indent-blankline.nvim" },
--     {
--         'goolord/alpha-nvim',
--         event = "VimEnter",
--         config = function()
--             require 'alpha'.setup(require 'alpha.themes.startify'.config)
--         end
--     },
--     { "folke/which-key.nvim" },
--     { "theHamsta/nvim-dap-virtual-text" },
--     { "rcarriga/nvim-notify" },
--     { "Tastyep/structlog.nvim" },
--
--     -- Colorschemes
--     {
--         "EdenEast/nightfox.nvim",
--         config = function()
--             require('nightfox').setup({
--                 options = {
--                     styles = {
--                         comments = "italic",
--                         keywords = "bold",
--                         types = "italic,bold",
--                     }
--                 }
--             })
--         end
--     },
--
--     -- cmp plugins
--     { "hrsh7th/nvim-cmp" },         -- The completion plugin
--     { "hrsh7th/cmp-buffer" },       -- buffer completions
--     { "hrsh7th/cmp-path" },         -- path completions
--     { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
--     { "hrsh7th/cmp-nvim-lsp" },
--     { "hrsh7th/cmp-nvim-lua" },
--     { "hrsh7th/cmp-cmdline" },
--     { "dmitmel/cmp-cmdline-history" },
--     { "hrsh7th/cmp-copilot" },
--
--     -- snippets
--     { "hrsh7th/cmp-vsnip" },
--     { "hrsh7th/vim-vsnip" },
--
--     -- LSP
--     { "neovim/nvim-lspconfig" },           -- enable LSP
--     { "jose-elias-alvarez/null-ls.nvim" }, -- for formatters and linters
--     { "nvimdev/lspsaga.nvim" },
--     { "onsails/lspkind.nvim" },
--     {
--         "RRethy/vim-illuminate",
--         config = function()
--             require("illuminate").configure {
--                 filetypes_allowlist = { "bash", "c", "cpp", "javascript", "json", "lua", "python", "tsx", "css",
--                     "rust", "java", "yaml", "go", "markdown" },
--                 providers = { 'lsp' },
--             }
--         end
--     }, -- for highlight variables under cursor
--
--     -- DAP
--     { "mfussenegger/nvim-dap" },
--     { "rcarriga/nvim-dap-ui" },
--
--     -- Telescope
--     { "nvim-telescope/telescope.nvim" },
--     { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
--     { "princejoogie/dir-telescope.nvim" },
--
--     -- Treesitter
--     { "nvim-treesitter/nvim-treesitter",          run = ":TSUpdate" },
--
--     -- Git and Github
--     { "lewis6991/gitsigns.nvim" },
--     {
--         "tpope/vim-fugitive",
--         cmd = { "G", "Git", "Gdiffsplit" },
--         ft = { "fugitive" }
--     },
--
--     -- config
--     {
--         "klen/nvim-config-local",
--         config = function()
--             require('config-local').setup {
--                 config_files = { "vimrc.lua" }, -- Config file patterns to load (lua supported)
--                 lookup_parents = true
--             }
--         end,
--     },
--
--     -- Task
--     { "tpope/vim-dispatch" },
--
--     -- Language Specific
--     { "simrat39/rust-tools.nvim" },
--     { "golang/vscode-go" },
--
--     -- UI
--     { "kevinhwang91/nvim-bqf" },
--     {
--         "j-hui/fidget.nvim",
--         tag = "legacy",
--         config = function()
--             require("fidget").setup()
--         end
--     },
--     {
--         "mrjones2014/smart-splits.nvim",
--         run = './install-kitty.sh',
--         config = function()
--             require("smart-splits").setup({
--                 multiplexer_integration = "wezterm",
--             })
--         end,
--     },
--
--     --Installer
--     { "williamboman/mason.nvim" },
--     { "williamboman/mason-lspconfig.nvim" },
--
--     -- fold
--     { "kevinhwang91/nvim-ufo",            dependencies = "kevinhwang91/promise-async" },
--
--     -- others
--     { "github/copilot.vim" },
--     {
--         "Bryley/neoai.nvim",
--         dependencies = {
--             "MunifTanjim/nui.nvim",
--         },
--         config = function()
--             require("neoai").setup()
--         end
--     },
-- })
