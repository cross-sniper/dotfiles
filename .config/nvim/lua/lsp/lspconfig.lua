return {
  "neovim/nvim-lspconfig",
  setup = function()
    local lsp = require 'lspconfig'

    lsp.clangd.setup()
    lsp.pyright.setup()
    lsp.zls.setup()
  end
}
