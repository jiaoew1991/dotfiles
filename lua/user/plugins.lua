local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here

  use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
  use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
  use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
  use({ "numToStr/Comment.nvim" })
  use({ "JoosepAlviste/nvim-ts-context-commentstring" })
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "kyazdani42/nvim-tree.lua" })
  use({ "akinsho/bufferline.nvim" })
  use({ "moll/vim-bbye" })
  use({ "nvim-lualine/lualine.nvim" })
  use({ "akinsho/toggleterm.nvim" })
  use({ "ahmedkhalf/project.nvim" })
  use({ "lewis6991/impatient.nvim" })
  use({ "lukas-reineke/indent-blankline.nvim" })
  use({ "goolord/alpha-nvim" })
  use({ "folke/which-key.nvim" })
  use({ "theHamsta/nvim-dap-virtual-text" })
  use({ "Tastyep/structlog.nvim" })

  -- Colorschemes
  use({ "lunarvim/darkplus.nvim" })
  use({
    "EdenEast/nightfox.nvim",
    config = function()
      require('nightfox').setup({
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          }
        }
      })
    end
  })


  -- cmp plugins
  use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
  use({ "hrsh7th/cmp-buffer" }) -- buffer completions
  use({ "hrsh7th/cmp-path" }) -- path completions
  use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-nvim-lua" })
  use({ "hrsh7th/cmp-cmdline" })
  use({ "dmitmel/cmp-cmdline-history" })
  use({ "glepnir/lspsaga.nvim" })
  use({ "onsails/lspkind.nvim" })

  -- snippets
  use({ "L3MON4D3/LuaSnip" }) --snippet engine
  use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

  -- LSP
  use({ "neovim/nvim-lspconfig" }) -- enable LSP
  use({ "williamboman/nvim-lsp-installer" }) -- simple to use language server installer
  use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
  use({
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure {
        filetypes_allowlist = { "bash", "c", "cpp", "javascript", "json", "lua", "python", "tsx", "css",
          "rust", "java", "yaml", "go", "markdown" },
        providers = { 'lsp' },
      }
    end
  }) -- for highlight variables under cursor

  -- DAP
  use({ "mfussenegger/nvim-dap" })
  use({ "alpha2phi/DAPInstall.nvim" })
  use({ "rcarriga/nvim-dap-ui" })

  -- Telescope
  use({ "nvim-telescope/telescope.nvim" })
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter" })

  -- Git and Github
  use({ "lewis6991/gitsigns.nvim" })
  use({
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gdiffsplit" },
    ft = { "fugitive" }
  })
  use({ "pwntester/octo.nvim" })

  -- config
  use({
    "klen/nvim-config-local",
    config = function()
      require('config-local').setup {
        config_files = { "vimrc.lua" }, -- Config file patterns to load (lua supported)
        lookup_parents = true
      }
    end,
  })

  -- Task
  use({ "tpope/vim-dispatch" })

  -- Lanaguage Specific
  use({ "simrat39/rust-tools.nvim" })

  -- others
  use({ "kevinhwang91/nvim-bqf" })
  use({
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end
  })
  use({ "wakatime/vim-wakatime" })
  use({ "simrat39/symbols-outline.nvim" })
  use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
