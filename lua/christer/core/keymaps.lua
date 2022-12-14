vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- Normal mode
--
keymap.set("n", "<leader>nh", ":nohl<CR>") -- Remove search highlighting
keymap.set("n", "x", '"_x') -- Don't copy character when deleting
keymap.set("n", "<leader>+", "<C-a>") -- Increase number
keymap.set("n", "<leader>-", "<C-x>") -- Decrease number
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows width equal
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- maximize window toggle
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle nvim-tree file explorer

-- Insert mode
--
keymap.set("i", "jk", "<ESC>") -- add "jk" as extra ESC
