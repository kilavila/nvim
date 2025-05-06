return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		insert_at_end = true,
		icons = {
			button = "",
			preset = "default",
			inactive = { button = "" },
		},
	},
	version = "^1.0.0",
}
