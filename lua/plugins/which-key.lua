return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		delay = 300,
		icons = { mappings = vim.g.have_nerd_font },
		preset = "helix",

		spec = {
			{ "<leader>f", group = "Find" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>t", group = "Toggle" },
		},
	},
}
