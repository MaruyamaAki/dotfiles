-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here

vim.api.nvim_create_user_command("RemoveCR", function()
  if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
    vim.cmd("'<,'>s/\\r//g")
  else
    vim.cmd("%s/\\r//g")
  end
end, { range = true })
-- vim.api.nvim_set_hl(0, "FlashLabelCustom", { fg = "#FF1493", bg = "#282A36", bold = true })
