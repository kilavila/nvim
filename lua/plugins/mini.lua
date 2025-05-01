return {
	-- https://github.com/echasnovski/mini.nvim
	"echasnovski/mini.nvim",
	config = function()
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.files").setup()
		require("mini.move").setup()
		require("mini.pairs").setup()
		-- require("mini.surround").setup()
		-- require("mini.tabline").setup()

		local statusline = require("mini.statusline")
		statusline.setup({ use_icons = vim.g.have_nerd_font })
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end
	end,
}
