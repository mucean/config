require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>bc", '<cmd> %bdelete|edit #|normal`" <cr>', { desc = "Close close other buffer" })
map("n", "<leader>cc", "<cmd> cclose <cr>", { desc = "Close close quickfix buffer" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
