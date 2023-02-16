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
      use({ "kyazdani42/nvim-web-devicons" })
      use({ "s1n7ax/nvim-window-picker", tag = "v1.5" })
      use {
          "nvim-neo-tree/neo-tree.nvim",
          branch = "v2.x",
          requires = {
              "MunifTanjim/nui.nvim",
          }
      }
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
      use({ "rcarriga/nvim-notify" })
      use({ "Tastyep/structlog.nvim" })

      -- Colorschemes
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

      -- snippets
      use({ "hrsh7th/cmp-vsnip" })
      use({ "hrsh7th/vim-vsnip" })

      -- LSP
      use({ "neovim/nvim-lspconfig" }) -- enable LSP
      use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
      use({ "glepnir/lspsaga.nvim" })
      use({ "onsails/lspkind.nvim" })
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
      use({ "rcarriga/nvim-dap-ui" })

      -- Telescope
      use({ "nvim-telescope/telescope.nvim" })
      use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
      use({ "princejoogie/dir-telescope.nvim" })

      -- Treesitter
      use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

      -- Git and Github
      use({ "lewis6991/gitsigns.nvim" })
      use({
          "tpope/vim-fugitive",
          cmd = { "G", "Git", "Gdiffsplit" },
          ft = { "fugitive" }
      })

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

      -- Language Specific
      use({ "simrat39/rust-tools.nvim" })
      use({ "golang/vscode-go" })

      -- UI
      use({ "kevinhwang91/nvim-bqf" })
      use({
          "j-hui/fidget.nvim",
          config = function()
            require("fidget").setup()
          end
      })
      use { "anuvyklack/windows.nvim",
          requires = {
              "anuvyklack/middleclass",
              "anuvyklack/animation.nvim"
          },
      }

      --Installer
      use({ "williamboman/mason.nvim" })
      use({ "williamboman/mason-lspconfig.nvim" })

      -- fold
      use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

      -- others
      use({ "wakatime/vim-wakatime" })
      use({ "github/copilot.vim" })

      -- Automatically set up your configuration after cloning packer.nvim
      -- Put this at the end after all plugins
      if PACKER_BOOTSTRAP then
        require("packer").sync()
      end
    end)
