local M = {}

M.servers = { "jsonls", "lua_ls", "rust_analyzer", "clangd",
    "gopls", "pyright", "ruff", "jdtls" }

local home = os.getenv("HOME")
if vim.fn.has("mac") == 1 then
    CONFIG = "mac"
elseif vim.fn.has("unix") == 1 then
    CONFIG = "linux"
else
    print("Unsupported system")
end

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
    },
    -- ruff = {
    --     on_init = function(client)
    --         local lsp_python = require("plugins.lsp.python")
    --         client.config.settings.interpreter = lsp_python.get_python_path(client.config.root_dir)
    --     end,
    --     init_options = {
    --         settings = {
    --             lint = {
    --                 preview = true
    --             }
    --         }
    --     }
    -- }
    -- jdtls = {
    --     cmd = {
    --         "java",
    --         "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    --         "-Dosgi.bundles.defaultStartLevel=4",
    --         "-Declipse.product=org.eclipse.jdt.ls.core.product",
    --         "-Dlog.protocol=true",
    --         "-Dlog.level=ALL",
    --         "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
    --         "-Xms1g",
    --         "--add-modules=ALL-SYSTEM",
    --         "--add-opens",
    --         "java.base/java.util=ALL-UNNAMED",
    --         "--add-opens",
    --         "java.base/java.lang=ALL-UNNAMED",
    --         -- 💀
    --         "-jar",
    --         vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    --         "-configuration",
    --         home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. CONFIG,
    --         "-data",
    --         "/Users/jiaoew/.cache/jdtls/workspace"
    --     },
    --     settings = {
    --         java = {
    --             signatureHelp = { enabled = true },
    --             eclipse = {
    --                 downloadSources = true,
    --             },
    --             maven = {
    --                 downloadSources = true,
    --             },
    --             implementationsCodeLens = {
    --                 enabled = true,
    --             },
    --             referencesCodeLens = {
    --                 enabled = true,
    --             },
    --             references = {
    --                 includeDecompiledSources = true,
    --             },
    --             inlayHints = {
    --                 parameterNames = {
    --                     enabled = "all", -- literals, all, none
    --                 },
    --             },
    --
    --             -- jdt = {
    --             --     ls = {
    --             --         lombokSupport = {
    --             --             enabled = true,
    --             --         }
    --             --     }
    --             -- }
    --         },
    --     },
    --     extendedClientCapabilities = require('jdtls').extendedClientCapabilities
    -- }
}
return M
