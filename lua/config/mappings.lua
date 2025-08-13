local map = vim.keymap.set

--[[ INSERT MODE ]]
map("i", "jk", "<esc>")

--[[ NORMAL MODE ]]
map("n", "<leader>X", "<cmd>source %<cr>")
map("n", "<leader>x", "<cmd>.lua<cr>")
map("v", "<leader>x", ":lua<cr>")

map("n", "<leader>w", "<cmd>w<cr>")
map("n", "<leader>q", "<cmd>q<cr>")

map("n", "<C-p>", "<cmd>bp<cr>")
map("n", "<C-n>", "<cmd>bn<cr>")
map("n", "<leader>c", "<cmd>bd<cr>")

map("n", "<leader>h", "<cmd>noh<cr>")

map("n", "<C-h>", "<C-w><C-h>")
map("n", "<C-l>", "<C-w><C-l>")
map("n", "<C-j>", "<C-w><C-j>")
map("n", "<C-k>", "<C-w><C-k>")

--[[ PLUGINS ]]
map("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>")
map("n", "<leader>u", "<cmd>UndotreeToggle<cr>")
map("n", "<leader>*", "<cmd>CloakToggle<cr>")
