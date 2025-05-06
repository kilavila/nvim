return {
	"kilavila/nvim-notes",
	dependencies = { "kkharji/sqlite.lua" },
	config = function()
		require("nvim-notes").setup({
			db_url = "~/nvim-notes.db",
		})
	end,
}

-- return {
-- 	dir = "/home/kila/nvim-plugins/nvim-notes",
-- 	dependencies = { "kkharji/sqlite.lua" },
-- 	config = function()
-- 		require("nvim-notes").setup({
-- 			db_url = "~/nvim-notes.db",
-- 		})
-- 	end,
-- }
