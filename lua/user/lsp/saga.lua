local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
  return
end


lspsaga.init_lsp_saga({
  saga_winblend = 40,
  symbol_in_winbar = {
    enable = true,
  },

})
