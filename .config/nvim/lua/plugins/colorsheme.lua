return {
  -- add gruvbox
  { "cocopon/iceberg.vim", name = "iceberg" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "iceberg",
    },
  },
}
