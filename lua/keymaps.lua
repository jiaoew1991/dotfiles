local utils = require "utils.keymap-helper"
local maps = utils.empty_map_table()

local sections = {
    d = { desc = "Debug" },
    s = { desc = "Search" },
    g = { desc = "Git" },
    l = { desc = "LSP" },
    b = { desc = "Buffer" },
    o = { desc = "Custom" },
    c = { desc = "Copilot" },
}

-- Standart --
-- Better window navigation
maps.n["<C-h>"] = { "<C-w>h", desc = "Navigate to the left split" }
maps.n["<C-j>"] = { "<C-w>j", desc = "Navigate to the bottom split" }
maps.n["<C-k>"] = { "<C-w>k", desc = "Navigate to the top split" }
maps.n["<C-l>"] = { "<C-w>l", desc = "Navigate to the right split" }

-- Resize with arrows
maps.n["<C-Up>"] = { "<cmd>resize -2<cr>", desc = "Shrink window horizontally" }
maps.n["<C-Down>"] = { "<cmd>resize +2<cr>", desc = "Increase window horizontally" }
maps.n["<C-Left>"] = { "<cmd>vertical -2<cr>", desc = "Shrink window vertically" }
maps.n["<C-Right>"] = { "<cmd>vertical +2<cr>", desc = "Increase window vertically" }

-- Navigate buffers
maps.n["<S-l>"] = { "<cmd>bnext<cr>", desc = "Next buffer" }
maps.n["<S-h>"] = { "<cmd>bprevious<cr>", desc = "Previous buffer" }

-- Clear highlights
maps.n["<leader>h"] = { "<cmd>nohsearch<cr>", desc = "Clear highlights" }

-- Close buffer
maps.n["<S-q>"] = { "<cmd>Bdelete!<cr>", desc = "Close buffer" }

-- Better paste
maps.v["p"] = { "P", desc = "Better paste" }

-- Visual --
-- Stay in indent mode
maps.v["<"] = { "<gv", desc = "Indent to the left" }
maps.v[">"] = { ">gv", desc = "Indent to the right" }

maps.n["<leader>e"] = { "<cmd>Neotree toggle=true action=show reveal<cr>", desc = "Toggle explorer" }
maps.n["<leader>f"] = { "<cmd>Telescope find_files<cr>", desc = "Find files" }
maps.n["<leader>F"] = { "<cmd>Telescope live_grep<cr>", desc = "Find Text" }

maps.n["<leader>s"] = sections.s
maps.n["<leader>sb"] = { "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" }
maps.n["<leader>sh"] = { "<cmd>Telescope help_tags<cr>", desc = "Find Help" }
maps.n["<leader>sM"] = { "<cmd>Telescope man_pages<cr>", desc = "Man Pages" }
maps.n["<leader>sr"] = { "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" }
maps.n["<leader>sR"] = { "<cmd>Telescope registers<cr>", desc = "Registers" }
maps.n["<leader>sk"] = { "<cmd>Telescope keymaps<cr>", desc = "Keymaps" }
maps.n["<leader>sC"] = { "<cmd>Telescope commands<cr>", desc = "Commands" }
maps.n["<leader>sf"] = { "<cmd>Telescope dir find_files<cr>", desc = "Find File in Dir" }
maps.n["<leader>sF"] = { "<cmd>Telescope dir live_grep<cr>", desc = "Grep in Dir" }
maps.n["<leader>sw"] = { "<cmd>HopWord<cr>", desc = "Go to word" }
maps.n["<leader>sl"] = { "<cmd>HopLine<cr>", desc = "Go to line" }

-- Git
maps.n["<leader>g"] = sections.g
maps.n["<leader>gg"] = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", desc = "Lazygit" }
maps.n["<leader>gl"] = { "<cmd>lua require('gitsigns').blame_line()<cr>", desc = "View Git blame" }
maps.n["<leader>gL"] = { "<cmd>lua require('gitsigns').blame_line { full = true }<cr>", desc = "View full Git blame" }
maps.n["<leader>gp"] = { "<cmd>lua require('gitsigns').preview_hunk()<cr>", desc = "Preview Git hunk" }
maps.n["<leader>gh"] = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", desc = "Reset Git hunk" }
maps.n["<leader>gr"] = { "<cmd>lua require('gitsigns').reset_buffer()<cr>", desc = "Reset Git buffer" }
maps.n["<leader>gs"] = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", desc = "Stage Git hunk" }
maps.n["<leader>gS"] = { "<cmd>lua require('gitsigns').stage_buffer()<cr>", desc = "Stage Git buffer" }
maps.n["<leader>gu"] = { "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", desc = "Unstage Git hunk" }
maps.n["<leader>gd"] = { "<cmd>lua require('gitsigns').diffthis()<cr>", desc = "View Git diff" }
maps.n['<leader>gb'] = { "<cmd>BlamerToggle<cr>", desc = "Toggle Git blame" }
maps.n["<leader>gj"] = { "<cmd>lua require('gitsigns').next_hunk()<cr>", desc = "Next Git hunk" }
maps.n["<leader>gk"] = { "<cmd>lua require('gitsigns').prev_hunk()<cr>", desc = "Previous Git hunk" }

-- Comment
maps.n["<leader>/"] = { "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", desc = "Toggle comment line" }
maps.v["<leader>/"] =
{ "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", desc = "Toggle comment line" }

-- Dap
maps.n["<leader>d"] = sections.d
maps.n["<leader>dt"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" }
maps.n["<leader>db"] = { "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back" }
maps.n["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" }
maps.n["<leader>dC"] = { "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run To Cursor" }
maps.n["<leader>dd"] = { "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect" }
maps.n["<leader>dg"] = { "<cmd>lua require'dap'.session()<cr>", desc = "Get Session" }
maps.n["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" }
maps.n["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" }
maps.n["<leader>du"] = { "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" }
maps.n["<leader>dp"] = { "<cmd>lua require'dap'.pause()<cr>", desc = "Pause" }
maps.n["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl" }
maps.n["<leader>ds"] = { "<cmd>lua require'dap'.continue()<cr>", desc = "Start" }
maps.n["<leader>dq"] = { "<cmd>lua require'dap'.close()<cr>", desc = "Quit" }

-- Lsp
maps.n["<leader>l"] = sections.l
maps.n["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" }
maps.n["<leader>ld"] = { "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics", }
maps.n["<leader>lw"] = { "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics", }
maps.n["<leader>lf"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Format" }
maps.n["<leader>li"] = { "<cmd>LspInfo<cr>", desc = "Info" }
maps.n["<leader>lI"] = { "<cmd>LspInstallInfo<cr>", desc = "Installer Info" }
maps.n["<leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostic", }
maps.n["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic", }
maps.n["<leader>ll"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" }
maps.n["<leader>lq"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" }
maps.n["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" }
maps.n["<leader>ls"] = { "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" }
maps.n["<leader>lS"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols", }
maps.n["<leader>lh"] = { "<cmd>Lspsaga incoming_calls<cr>", desc = "Incoming Hierarchy" }
maps.n["<leader>lH"] = { "<cmd>Lspsaga outgoing_calls<cr>", desc = "Outgoing Hierarchy" }

-- Buffer
maps.n["<leader>b"] = sections.b
maps.n["<leader>bf"] = {
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy{previewer = false})<cr>",
    desc = "Buffers"
}
maps.n["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Jump" }
maps.n["<leader>bx"] = { "<cmd>bdelete<cr>", desc = "Close Buffer" }
maps.n["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick Close Buffer" }
maps.n["<leader>be"] = { "<cmd>Neotree buffers<cr>", desc = "Buffers" }

-- Custom
maps.n["<leader>o"] = sections.o
maps.n["<leader>ov"] = { "<cmd>Lspsaga outline<cr>", desc = "Show Outline" }
maps.n["<leader>og"] = { "<cmd>Telescope treesitter<cr>", desc = "Goto" }
maps.n["<leader>od"] = { "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Show Diagnostics" }

-- Copilot
maps.n['<leader>c'] = sections.c
maps.n['<leader>co'] = { '<cmd>CopilotChatToggle<cr>', desc = 'Open/Close CopilotChat' }
maps.n['<leader>ce'] = { '<cmd>CopilotChatExplain<cr>', desc = 'Explain code by Copilot' }
maps.n['<leader>cf'] = { '<cmd>CopilotChatFix<cr>', desc = 'Fix code by Copilot' }

utils.set_mappings(maps)
