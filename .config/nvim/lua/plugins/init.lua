return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "folke/tokyonight.nvim"
  },
  {
    "preservim/nerdtree"
  },
  {
    "preservim/nerdcommenter"
  },
  {
    "vim-airline/vim-airline"
  },
  {
    "vim-airline/vim-airline-themes"
  },
  {
    "voldikss/vim-floaterm"
  },
  {
    "habamax/vim-godot"
  },
}
