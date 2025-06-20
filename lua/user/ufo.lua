local M = {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    lazy = false,
}

vim.o.foldcolumn = 'auto'
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = -1
vim.o.foldenable = true

function M.config()
    local ufo = require("ufo")

    ufo.setup({
        provider_selector = function(bufnr, filetype, buftype)
            return { 'treesitter', 'indent' }
        end
    })

    local which_key = require("which-key")

    local opts = { mode = "n", noremap = true, silent = true }
    local mappings = {
        ["zR"] = { require('ufo').openAllFolds, 'Open all folds' },
        ["zM"] = { require('ufo').closeAllFolds, 'Close all folds' },
        ["zr"] = { require('ufo').openFoldsExceptKinds, 'Open folds expect kinds' },
        ["zm"] = { require('ufo').closeFoldsWith, 'Close folds with' },
        ["zc"] = { "<cmd>foldclose<CR>", "Close fold" },
    }
    which_key.register(mappings, opts)
end

return M
