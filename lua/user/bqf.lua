local M = {
    "kevinhwang91/nvim-bqf" ,
    lazy = false,
}

function M.config()
    require("bqf").setup({
      auto_enable = true,
      preview = {
        win_height = 15,
        win_vheight = 15,
        delay_syntax = 80,
        border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
      },
      func_map = {
        vsplit = "v",
        split = "s",
        ptogglemode = "z,",
        stoggleup = "",
      },
    })
end
return M
