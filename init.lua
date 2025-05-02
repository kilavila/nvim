--[[
--
--		 ███    ██ ██    ██ ██ ███    ███
-- 		 ████   ██ ██    ██ ██ ████  ████
-- 		 ██ ██  ██ ██    ██ ██ ██ ████ ██
-- 		 ██  ██ ██  ██  ██  ██ ██  ██  ██
-- 		 ██   ████   ████   ██ ██ .config
--				
--		 To check the current status of your plugins, run
--		 :Lazy
--
--		 To check the current status of installed tools or install tools, run
--		 :Mason
--
--		 To search for keymaps, press
--		 Space f f
--
--		 To search help documentation, press
--		 Space f h
--
--]]

--[[
-- INFO:
-- variables
--]]
local map = vim.keymap.set
local opt = vim.opt

--[[
-- INFO:
-- options
--]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.termguicolors = true
vim.g.have_nerd_font = true

opt.relativenumber = true
opt.mouse = "a"
opt.showmode = false
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitright = true
opt.splitbelow = true
opt.list = false
opt.inccommand = "split"
opt.cursorline = true
opt.scrolloff = 10
opt.wrap = false
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.hlsearch = true

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

--[[
-- INFO:
-- mappings
--]]
map("i", "jk", "<esc>")

map("n", "<leader>w", ":w<cr>")
map("n", "<leader>q", ":q<cr>")

map("n", "<leader>e", ":lua MiniFiles.open()<cr>")
map("n", "<leader>bb", ":bp<cr>")
map("n", "<leader>bn", ":bn<cr>")
map("n", "<leader>c", ":bd<cr>")

map("n", "<leader>h", ":noh<cr>")

map("n", "<leader>g", ":Neogit kind=floating<cr>")
map("n", "<leader>u", ":lua vim.fn.execute({ ':UndotreeToggle', ':UndotreeFocus' })<cr>")

map("n", "<leader>tc", ":ColorizerToggle<cr>")
map("n", "<leader>tt", ":TodoTelescope<cr>")

map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

--[[
-- INFO:
-- auto commands
--]]
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

--[[
-- INFO:
-- lazy plugin manager
--]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	--[[
	-- INFO:
	-- plugins
	--]]
	{ import = "plugins" },
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

--[[
-- INFO:
-- floating window fix
--]]
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or "rounded"

	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
