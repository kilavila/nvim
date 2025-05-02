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
