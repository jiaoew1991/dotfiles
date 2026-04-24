local M = {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "InsertEnter", "CmdlineEnter" },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = 'none',
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
            ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },
            ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        },
        appearance = {
            nerd_font_variant = 'mono',
        },
        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
                window = { border = 'rounded' },
            },
            menu = {
                border = 'rounded',
            },
            ghost_text = {
                enabled = true,
            },
        },
        cmdline = {
            enabled = true,
            keymap = { preset = 'cmdline' },
            sources = { 'cmdline', 'buffer' },
        },
        sources = {
            default = { 'lsp', 'path', 'buffer' },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}

return M
