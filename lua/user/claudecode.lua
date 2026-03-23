local M = {
    "greggh/claude-code.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    lazy = false,
}

function M.config()
    require("claude-code").setup({
        window = {
            split_side = "right",
            width_percentage = 0.35,
        },
    })

    local wk = require("which-key")
    wk.add({
        { "<leader>a", group = "Claude Code" },
        { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
        { "<leader>ar", "<cmd>ClaudeCodeResume<cr>", desc = "Resume Claude" },
        { "<leader>av", "<cmd>ClaudeCodeVerbose<cr>", desc = "Verbose Mode" },
    })

    -- Input method switching
    local function switch_to_english()
        vim.fn.jobstart({ "im-select", "com.apple.keylayout.ABC" }, { detach = true })
    end

    -- Setup keymaps and autocmds for Claude Code terminal
    vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "*",
        callback = function()
            vim.schedule(function()
                local bufname = vim.api.nvim_buf_get_name(0)
                if bufname:match("claude%-code") then
                    local bufnr = vim.api.nvim_get_current_buf()
                    -- Delete ESC mapping set by toggleterm, let ESC pass through to Claude Code
                    pcall(vim.api.nvim_buf_del_keymap, bufnr, 't', '<esc>')
                    -- Use jk to enter normal mode
                    vim.api.nvim_buf_set_keymap(bufnr, 't', 'jk', [[<C-\><C-n>]], { noremap = true, silent = true })

                    -- Pass through keys that conflict with vim defaults
                    local passthrough_keys = { '<C-o>', '<C-i>', '<C-r>', '<C-w>', '<C-a>', '<C-e>', '<C-u>', '<C-k>' }
                    for _, key in ipairs(passthrough_keys) do
                        vim.api.nvim_buf_set_keymap(bufnr, 't', key, key, { noremap = true, silent = true })
                    end

                    -- Switch to English when leaving Claude Code buffer
                    vim.api.nvim_create_autocmd("BufLeave", {
                        buffer = bufnr,
                        callback = switch_to_english,
                    })
                end
            end)
        end,
    })
end

return M
