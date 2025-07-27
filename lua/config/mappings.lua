local map = vim.keymap.set

map("i", "jk", "<esc>")

map("n", "<leader>X", "<cmd>source %<cr>")
map("n", "<leader>x", "<cmd>.lua<cr>")
map("v", "<leader>x", ":lua<cr>")

map("n", "<leader>w", "<cmd>w<cr>")
map("n", "<leader>q", "<cmd>q<cr>")

map("n", "<C-p>", "<cmd>bp<cr>")
map("n", "<C-n>", "<cmd>bn<cr>")
map("n", "<leader>c", "<cmd>bd<cr>")

map("n", "<leader>h", "<cmd>noh<cr>")

map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
