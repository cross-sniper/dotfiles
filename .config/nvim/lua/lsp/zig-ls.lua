return {
  "zigtools/zls",
  dependencies = {
    "ziglang/zig.vim"
  },

  config = function()
    local lsp = require'lspconfig'

    lsp.zls.setup({
      cmd = {"/usr/bin/zls"},
      settings = {
        zls = {
          zig_exe_path = "/usr/bin/zig"
        }
      }
    })
  end
}

