local api = vim.api

local highlight = {
	background = "#f6c177",
	foreground = "#000000",
}

local cursor = {
	background = "#e0def4",
	foreground = "#000000",
}

api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		api.nvim_set_hl(0, "Visual", { bg = highlight.background, fg = highlight.foreground })
		api.nvim_set_hl(0, "YankHighlight", { bg = highlight.background, fg = highlight.foreground })

		vim.api.nvim_set_hl(0, "Cursor", { bg = cursor.background, fg = cursor.foreground })
		vim.o.guicursor = "n-v-c:block-Cursor,i-ci-ve:block-Cursor,r-cr-o:block-Cursor,a:block-Cursor"
	end,
})

-- Create the autocmd using your custom highlight group
api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 150 })
	end,
})

api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = { "*.*" },
	desc = "save view (folds), when closing file",
	command = "mkview",
})
api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*.*" },
	desc = "load view (folds), when opening file",
	command = "silent! loadview",
})
