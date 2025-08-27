local map = vim.keymap.set

--[[ INSERT MODE ]]
map("i", "jk", "<esc>")

--[[ NORMAL MODE ]]
map("n", "<leader>X", "<cmd>source %<cr>")
map("n", "<leader>x", "<cmd>.lua<cr>")
map("v", "<leader>x", ":lua<cr>")

map("n", "<leader>w", "<cmd>w<cr>")
map("n", "<leader>q", "<cmd>q<cr>")
map("n", "<leader>h", "<cmd>noh<cr>")

-- managing and navigating buffers
map("n", "<C-p>", "<cmd>bp<cr>")
map("n", "<C-n>", "<cmd>bn<cr>")
map("n", "<leader>c", "<cmd>bd<cr>")

-- navigating windows with CTRL-h/j/k/l
map("n", "<C-h>", "<C-w><C-h>")
map("n", "<C-l>", "<C-w><C-l>")
map("n", "<C-j>", "<C-w><C-j>")
map("n", "<C-k>", "<C-w><C-k>")

-- moving lines with ALT-h/j/k/l
map("n", "<A-h>", "<<")
map("n", "<A-l>", ">>")
map("n", "<A-j>", "<cmd>m +1<cr>")
map("n", "<A-k>", "<cmd>m -2<cr>")
map("v", "<A-h>", "<gv")
map("v", "<A-l>", ">gv")
map("v", "<A-j>", ":m '>+1<cr>gv=gv")
map("v", "<A-k>", ":m '<-2<cr>gv=gv")

--[[ LSP ]]
-- add formatting document
