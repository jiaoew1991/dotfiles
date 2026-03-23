local M = {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    lazy = false,
}

vim.o.foldcolumn = 'auto'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

function M.config()
    local ufo = require("ufo")

    ufo.setup({
        provider_selector = function(bufnr, filetype, buftype)
            return { 'treesitter', 'indent' }
        end
    })

    local wk = require("which-key")
    wk.add({
        { "zR", ufo.openAllFolds, desc = "Open all folds" },
        { "zM", ufo.closeAllFolds, desc = "Close all folds" },
        { "zr", ufo.openFoldsExceptKinds, desc = "Open folds except kinds" },
        { "zm", ufo.closeFoldsWith, desc = "Close folds with" },
        { "zc", "<cmd>foldclose<CR>", desc = "Close fold" },
    })
end

return M
