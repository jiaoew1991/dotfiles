local status_ok, windows = pcall(require, "windows")
if not status_ok then
  return
end

windows.setup({
  animation = {
    enable = true,
    duration = 300,
    fps = 60,
    easing = "in_out_sine"
  }
})
