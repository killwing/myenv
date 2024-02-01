-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
map({ "n", "t" }, "<leader>;", "<C-/>", { desc = "Terminal", remap = true })

if vim.g.vscode then
  local vscode = require("vscode-neovim")
  map("n", "gr", function()
    vscode.call("editor.action.goToReferences")
  end, { desc = "go to references" })

  map("n", "gi", function()
    vscode.call("editor.action.goToImplementation")
  end, { desc = "go to implementation" })
end
