local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "rolf.lsp.mason"
require("rolf.lsp.handlers").setup()
require "rolf.lsp.null-ls"
