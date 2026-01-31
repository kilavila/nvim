local mappings = {
	{
		mode = "i",
		key = "jk",
		cmd = "<esc>",
		desc = "Additional escape",
	},
	{
		mode = "n",
		key = "<leader>X",
		cmd = "<cmd>source %<cr>",
		desc = "Source file",
	},
	{
		mode = "n",
		key = "<leader>x",
		cmd = "<cmd>.lua<cr>",
		desc = "Run file",
	},
	{
		mode = "v",
		key = "<leader>x",
		cmd = ":lua<cr>",
		desc = "Run selected lines",
	},
	{
		mode = "n",
		key = "<leader>w",
		cmd = "<cmd>w<cr>",
		desc = "Write buffer",
	},
	{
		mode = "n",
		key = "<leader>q",
		cmd = "<cmd>q<cr>",
		desc = "Quit",
	},
	{
		mode = "n",
		key = "<C-p>",
		cmd = "<cmd>bp<cr>",
		desc = "Prev buffer",
	},
	{
		mode = "n",
		key = "<C-n>",
		cmd = "<cmd>bn<cr>",
		desc = "Next buffer",
	},
	{
		mode = "n",
		key = "<leader>c",
		cmd = "<cmd>bd<cr>",
		desc = "Close buffer",
	},
	{
		mode = "n",
		key = "<leader>h",
		cmd = "<cmd>noh<cr>",
		desc = "No highlight",
	},
	{
		mode = "n",
		key = "<C-h>",
		cmd = "<C-w><C-h>",
		desc = "Navigate left",
	},
	{
		mode = "n",
		key = "<C-j>",
		cmd = "<C-w><C-j>",
		desc = "Navigate down",
	},
	{
		mode = "n",
		key = "<C-k>",
		cmd = "<C-w><C-k>",
		desc = "Navigate up",
	},
	{
		mode = "n",
		key = "<C-l>",
		cmd = "<C-w><C-l>",
		desc = "Navigate right",
	},
	{
		mode = "n",
		key = "<leader>e",
		cmd = "<cmd>lua MiniFiles.open()<cr>",
		desc = "Open mini files",
	},
	{
		mode = "n",
		key = "<leader>tc",
		cmd = "<cmd>CloakToggle<cr>",
		desc = "Cloak toggle",
	},
	{
		mode = "n",
		key = "<leader>tu",
		cmd = "<cmd>UndotreeToggle<cr>",
		desc = "Undotree toggle",
	},
}

for _, map in ipairs(mappings) do
	vim.keymap.set(map.mode, map.key, map.cmd, {
		desc = map.desc,
		silent = true,
	})
end
