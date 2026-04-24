local M = {
    "neovim/nvim-lspconfig",
    lazy = false,
    event = { "BufReadPre" },
    dependencies = {
        {
            "saghen/blink.cmp",
        },
        {
            "nvimdev/lspsaga.nvim",
        }
    },
}

function M.config()
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    local function lsp_keymaps(bufnr)
        local keymap = vim.api.nvim_buf_set_keymap
        keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>",
            { noremap = true, silent = true, desc = "Goto Declaration" })
        keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>",
            { noremap = true, silent = true, desc = "Goto Definition" })
        keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>",
            { noremap = true, silent = true, desc = "Goto Implementation" })
        keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>",
            { noremap = true, silent = true, desc = "Find References" })
        keymap(bufnr, "n", "gh", "<cmd>Lspsaga finder<CR>", { noremap = true, silent = true, desc = "Lsp Finder" })
        keymap(bufnr, "n", "gR", "<cmd>Lspsaga rename<CR>", { noremap = true, silent = true, desc = "Rename" })
        keymap(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = true, desc = "Doc" })
    end

    local on_attach = function(client, bufnr)
        lsp_keymaps(bufnr)
        if client.name == 'ruff' then
            client.server_capabilities.hoverProvider = false
        end
    end

    -- Configure each server using vim.lsp.config (nvim 0.11+)
    for _, server in pairs(require("utils").servers) do
        local server_name = vim.split(server, "@")[1]

        -- Load custom settings
        local custom = require('utils').settings[server_name] or {}

        -- Configure using new vim.lsp.config API
        vim.lsp.config[server_name] = vim.tbl_deep_extend("force", {
            capabilities = capabilities,
            on_attach = on_attach,
        }, custom)
    end

    -- Enable all configured servers
    vim.lsp.enable(require("utils").servers)

    -- Configure diagnostics
    vim.diagnostic.config({
        virtual_text = false,
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = "",
                [vim.diagnostic.severity.WARN] = "",
                [vim.diagnostic.severity.HINT] = "",
                [vim.diagnostic.severity.INFO] = "",
            },
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = true,
            header = "",
            prefix = "",
            suffix = "",
        },
    })
end

return M
