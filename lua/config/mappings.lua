local map = vim.keymap.set

--[[ INSERT MODE ]]
map("i", "jk", "<esc>")

--[[ NORMAL MODE ]]
map("n", "<leader>X", "<cmd>source %<cr>", { silent = true })
map("n", "<leader>x", "<cmd>.lua<cr>", { silent = true })
map("v", "<leader>x", ":lua<cr>", { silent = true })

map("n", "<leader>w", "<cmd>w<cr>", { silent = true })
map("n", "<leader>q", "<cmd>q<cr>", { silent = true })

map("n", "<C-p>", "<cmd>bp<cr>", { silent = true })
map("n", "<C-n>", "<cmd>bn<cr>", { silent = true })
map("n", "<leader>c", "<cmd>bd<cr>", { silent = true })

map("n", "<leader>h", "<cmd>noh<cr>", { silent = true })

map("n", "<C-h>", "<C-w><C-h>", { silent = true })
map("n", "<C-l>", "<C-w><C-l>", { silent = true })
map("n", "<C-j>", "<C-w><C-j>", { silent = true })
map("n", "<C-k>", "<C-w><C-k>", { silent = true })

--[[ PLUGINS ]]
map("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>", { silent = true })
map("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { silent = true })
map("n", "<leader>*", "<cmd>CloakToggle<cr>", { silent = true })
