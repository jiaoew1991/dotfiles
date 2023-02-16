local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
  return
end

lspsaga.setup({
  symbol_in_winbar = {
    enable = true,
    separator = ' ',
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },
  max_preview_lines = 100,
  finder_action_keys = {
    open = "<cr>",
    vsplit = "v",
    split = "s",
    tabe = "t",
    quit = "q",
  },
  show_outline = {
    jump_key = "<CR>",
    auto_refresh = true,
  },
  -- ui = {
  --   colors = {
  --     normal_bg = "#ebe5df",
  --     border = "shadow",
  --   }
  -- }
})
