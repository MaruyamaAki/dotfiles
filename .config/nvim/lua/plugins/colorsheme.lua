return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      transparent = true,
      on_highlights = function(hl, c)
        hl.BufferLineFill = {
          bg = "NONE", -- 背景色を透過
        }
        hl.BufferLineBufferSelected = {
          fg = c.fg, -- 前景色はtokyonightのデフォルトを使用
          bg = "NONE", -- 背景色を透過
          bold = true, -- 太字に設定
        }
        hl.BufferLineSeparatorSelected = {
          fg = c.bg_highlight, -- セパレーターの色をデフォルトから取得
          bg = "NONE", -- 背景色を透過
        }
      end,
    },
  },
}
