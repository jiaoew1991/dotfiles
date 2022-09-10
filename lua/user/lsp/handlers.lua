local which_key = require("which-key")

local M = {}

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = true,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    width = 60,
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
    width = 60,
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
  -- end
end

local function lsp_keymaps(bufnr)
  local opts = { mode = "n", buffer = bufnr, noremap = true, silent = true }
  local mappings = {
    ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto Declaration" },
    ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
    ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
    ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "Find Refrences" },
    ["g["] = { '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', "Prev Diagnostic" },
    ["g]"] = { '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', "Next Diagnostic" },
    ["gl"] = { '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', "List Diagnostics" },
    ["gh"] = { '<cmd>Lspsaga lsp_finder<CR>', "Lsp Finder" },
    ["gR"] = { "<cmd>Lspsaga rename<CR>", "Rename" },
    ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "Doc" },
  }
  which_key.register(mappings, opts)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{async=true}' ]])
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M