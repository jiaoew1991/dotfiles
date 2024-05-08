local M = {
    "neovim/nvim-lspconfig",
    -- commit = "d1bab4cf4b69e49d6058028fd933d8ef5e74e680",
    lazy = false,
    event = { "BufReadPre" },
    dependencies = {
        {
            "hrsh7th/cmp-nvim-lsp",
            -- commit = "5af77f54de1b16c34b23cba810150689a3a90312",
        },
        {
            "nvimdev/lspsaga.nvim",
        }
    },
}

function M.config()
    local cmp_nvim_lsp = require "cmp_nvim_lsp"

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

    local function lsp_keymaps(bufnr)
        local keymap = vim.api.nvim_buf_set_keymap
        keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>",
            { noremap = true, silent = true, desc = "Goto Declaration" })
        keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>",
            { noremap = true, silent = true, desc = "Goto Definition" })
        keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>",
            { noremap = true, silent = true, desc = "Goto Implementation" })
        keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>",
            { noremap = true, silent = true, desc = "Find Refrences" })
        keymap(bufnr, "n", "gh", "<cmd>Lspsaga finder<CR>", { noremap = true, silent = true, desc = "Lsp Finder" })
        keymap(bufnr, "n", "gR", "<cmd>Lspsaga rename<CR>", { noremap = true, silent = true, desc = "Rename" })
        keymap(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = true, desc = "Doc" })
    end

    local lspconfig = require "lspconfig"
    local on_attach = function(client, bufnr)
        lsp_keymaps(bufnr)
        require("illuminate").on_attach(client)
    end

    for _, server in pairs(require("utils").servers) do
        Opts = {
            on_attach = on_attach,
            capabilities = capabilities,
        }

        server = vim.split(server, "@")[1]

        local require_ok, conf_opts = pcall(require, "settings." .. server)
        if require_ok then
            Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
        end

        lspconfig[server].setup(Opts)
    end

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
        virtual_text = false,
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
            suffix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

return M
