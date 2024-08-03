return {
  "neovim/nvim-lspconfig",
  setup = function()
    local lsp = require 'lspconfig'

    lsp.clangd.setup({})
    lsp.pyright.setup({})
    lsp.zls.setup({})
    lsp.lua_ls.setup({})
    lsp.typescript.setup({})
    lsp.nimlangserver.setup({})
    lsp.ols.setup({})
  end
}

