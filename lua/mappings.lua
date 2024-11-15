require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("t", "<ESC>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>se", function() require("scissors").editSnippet() end)

-- when used in visual mode, prefills the selection as snippet body
vim.keymap.set({ "n", "x" }, "<leader>sa", function() require("scissors").addNewSnippet() end)
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
