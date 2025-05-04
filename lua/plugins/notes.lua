return {
	"kilavila/nvim-notes",
	dependencies = { "kkharji/sqlite.lua" },
	config = function()
		require("nvim-notes").setup({
			db_url = "~/nvim-notes.db",
			-- symbol = "⭐",
			-- delimiter = ";;",
		})
	end,
}
