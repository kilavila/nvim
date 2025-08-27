local schedule = vim.schedule
local opt = vim.opt
local cmd = vim.cmd

schedule(function()
	opt.clipboard = "unnamedplus"

	cmd([[colorscheme rose-pine]])
end)
