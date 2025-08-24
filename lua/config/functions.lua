local schedule = vim.schedule
local opt = vim.opt
local cmd = vim.cmd

schedule(function()
	opt.clipboard = "unnamedplus"

	-- cmd([[colorscheme horizon]])
	-- vim.o.background = "dark"
	-- cmd([[colorscheme gruvbox]])
	cmd([[colorscheme rose-pine]])
	cmd([[hi FloatBorder guifg=#aaaaaa guibg=#1e222a]])
end)
