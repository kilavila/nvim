return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		local time = os.date("%H:%M")
		local date = os.date("%d. %B %Y")
		local nvim_version = ""

		local handle = io.popen("nvim --version | head -n 1")
		if handle then
			nvim_version = handle:read("*a")
			nvim_version = nvim_version:gsub("[\n\r]", " ")
			handle:close()
		end

		require("dashboard").setup({
			theme = "doom",
			disable_move = true,
			config = {
				header = {
					"/< | |_ /\\ \\/ | |_ /\\",
					"github.com/kilavila",
					"",
					"",
					"",
					"",
				},
				center = {
					-- {
					-- 	desc = "File explorer",
					-- 	key = "spc e",
					-- 	key_format = " [%s]", -- `%s` will be substituted with value of `key`
					-- },
					{
						desc = "Search files",
						key = "spc f f",
						key_format = " [%s]", -- `%s` will be substituted with value of `key`
					},
					{
						desc = "Search recent files",
						key = "spc f .",
						key_format = " [%s]", -- `%s` will be substituted with value of `key`
					},
					{
						desc = "Search keymaps",
						key = "spc f k",
						key_format = " [%s]", -- `%s` will be substituted with value of `key`
					},
					{
						desc = "Search help",
						key = "spc f h",
						key_format = " [%s]", -- `%s` will be substituted with value of `key`
					},
				},
				footer = {
					"",
					"",
					" -------------------------------",
					"",
					"",
					" " .. date .. " | " .. time,
					"",
					" " .. nvim_version,
				},
				vertical_center = true, -- Center the Dashboard on the vertical (from top to bottom)
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}

-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[S]earch [H]elp" })
-- vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
-- vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[S]earch [F]iles" })
-- vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
-- vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
-- vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
-- vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[S]earch [R]esume" })
-- vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
