local M = {}

M.servers = { "jsonls", "lua_ls", "rust_analyzer", "clangd", "gopls", "pyright", "ruff", "ruff_lsp", "jdtls" }

M.settings = {
    pyright = {
        settings = {
            pyright = {
                -- Using Ruff's import organizer
                disableOrganizeImports = true,
            },
            python = {
                analysis = {
                    -- Ignore all files for analysis to exclusively use Ruff for linting
                    ignore = { '*' },
                },
            },
        },
    }
}
return M
