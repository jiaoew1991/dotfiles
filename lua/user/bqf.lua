local status_ok, bqf = pcall(require, "bqf")
if not status_ok then
	return
end

bqf.setup({
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
