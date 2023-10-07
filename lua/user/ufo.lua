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
    local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = ('  %d '):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
                table.insert(newVirtText, chunk)
            else
                chunkText = truncate(chunkText, targetWidth - curWidth)
                local hlGroup = chunk[2]
                table.insert(newVirtText, { chunkText, hlGroup })
                chunkWidth = vim.fn.strdisplaywidth(chunkText)
                -- str width returned from truncate() may less than 2nd argument, need padding
                if curWidth + chunkWidth < targetWidth then
                    suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                end
                break
            end
            curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, 'MoreMsg' })
        return newVirtText
    end

    local ufo = require("ufo")

    ufo.setup({
        open_fold_hl_timeout = 150,
        close_fold_kinds = { 'imports', 'comment' },
        preview = {
            win_config = {
                border = { '', '─', '', '', '', '─', '', '' },
                winhighlight = 'Normal:Folded',
                winblend = 0
            },
            mappings = {
                scrollU = '<C-u>',
                scrollD = '<C-d>'
            }
        },
        fold_virt_text_handler = handler
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
