--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
vim.o.guifont = "DroidSansMono Nerd Font Mono:h12"
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "dawnfox"

-- make click not focus only not move cursor
local no_cursor_move_on_focus = vim.api.nvim_create_augroup('NO_CURSOR_MOVE_ON_FOCUS', { clear = true })
vim.api.nvim_create_autocmd('FocusLost', {
  pattern = '*',
  group = no_cursor_move_on_focus,
  command = 'let g:oldmouse=&mouse | set mouse='
})
vim.api.nvim_create_autocmd('FocusGained', {
  pattern = '*',
  group = no_cursor_move_on_focus,
  command = "if exists('g:oldmouse') | let &mouse=g:oldmouse | unlet g:oldmouse | endif"
})

-- neovide only
vim.g.neovide_remember_window_size = true
vim.g.neovide_input_use_logo = true
vim.g.neovide_cursor_vfx_mode = "railgun"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<F3>"] = "<Cmd>Telescope lsp_definitions<cr>"
lvim.keys.normal_mode["<F4>"] = "<Cmd>Telescope lsp_references<cr>"
lvim.keys.normal_mode["<D-e>"] = "<Cmd>Telescope buffers<cr>"
lvim.keys.normal_mode["<D-p>"] = "<Cmd>Telescope commands<cr>"
lvim.keys.insert_mode["<D-v>"] = "<ESC>\"+pa"
lvim.keys.insert_mode['jk'] = false
lvim.keys.insert_mode['jj'] = false
lvim.keys.insert_mode['kk'] = false
lvim.keys.insert_mode['kj'] = false

lvim.builtin.which_key.mappings["o"] = {
  name = "Custom",
  v = { "<cmd>SymbolsOutline<cr>", "View" },
  g = { "<cmd>Telescope treesitter<cr>", "Goto" },
  c = { ":Telescope grep_string cwd=", "Grep String" },
}
lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}
lvim.builtin.which_key.mappings["g"] = {
  name = "Git",
  v = { "<cmd>Gvdiffsplit<cr>", "Diff view" },
  b = { "<cmd>Git blame<cr>", "Blame" },
  o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
  C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },
  c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
}

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "startify"

lvim.builtin.notify.active = true

lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.setup.view.side = "left"

lvim.builtin.gitsigns.active = false

lvim.builtin.treesitter.ensure_installed = { "bash", "c", "cpp", "javascript", "json", "lua", "python", "tsx", "css",
  "rust", "java", "yaml", "go", "markdown" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "neoclip")
end

lvim.builtin.dap.active = true
lvim.builtin.dap.on_config_done = function(dap)
  require("nvim-dap-virtual-text").setup {
    commented = true,
  }

  local dapui = require "dapui"
  dapui.setup {} -- use default
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

-- colorscheme
lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.options.theme = "dawnfox"
lvim.builtin.lualine.options.icons_enabled = true
lvim.builtin.lualine.options.globalstatus = true
lvim.builtin.lualine.extensions = { "nvim-tree", "quickfix", "symbols-outline", "fugitive" }

-- cmp configuration
local cmp = require("cmp")
lvim.builtin.cmp.formatting.source_names.cmdline = "(cmdline)"
lvim.builtin.cmp.formatting.source_names.cmdline_history = "(history)"
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "cmdline" },
    { name = "cmdline_history" },
    { name = "path" }
  })
})
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
    { name = "cmdline_history" },
  }
})
-- Additional Plugins
lvim.plugins = {
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup {
        options = { "buffers", "curdir", "tabpages", "winsize" },
        dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/", false, false),
      }
    end,
  },
  {
    "klen/nvim-config-local",
    config = function()
      require('config-local').setup {
        config_files = { "vimrc.lua" }, -- Config file patterns to load (lua supported)
        lookup_parents = true
      }
    end,
  },
  {
    "catppuccin/nvim",
    as = "catppuccin",
  },
  {
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
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end
  },
  {
    "tpope/vim-dispatch",
  },
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gdiffsplit" },
    ft = { "fugitive" }
  },
  {
    "pwntester/octo.nvim",
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require "octo".setup()
    end
  },
  {
    "hrsh7th/cmp-cmdline"
  },
  {
    "dmitmel/cmp-cmdline-history",
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 15,
          win_vheight = 15,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "v",
          split = "s",
          ptogglemode = "z,",
          stoggleup = "",
        },
      })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    requires = {
      "mfussenegger/nvim-dap",
      "alpha2phi/DAPInstall.nvim",
      "theHamsta/nvim-dap-virtual-text",
      "leoluz/nvim-dap-go"
    },
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup({})
    end
  },
}
