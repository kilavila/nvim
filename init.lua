--[[
--
--		 ███    ██ ██    ██ ██ ███    ███
-- 		 ████   ██ ██    ██ ██ ████  ████
-- 		 ██ ██  ██ ██    ██ ██ ██ ████ ██
-- 		 ██  ██ ██  ██  ██  ██ ██  ██  ██
-- 		 ██   ████   ████   ██ ██ .config
--
--]]

local map = vim.keymap.set
local schedule = vim.schedule
local api = vim.api
local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

g.termguicolors = true
g.have_nerd_font = true

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.showmode = false
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes:1"
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

schedule(function()
	opt.clipboard = "unnamedplus"
	g.EasyMotion_do_mapping = 0
	g.neon_style = "doom"
	g.material_style = "deep ocean"
	g.edge_style = "neon"

	cmd([[colorscheme catppuccin-mocha]])
	cmd([[CccHighlighterEnable]])
	cmd([[set guicursor=n-v-c-i:block]])
	cmd([[CloakEnable]])
end)

--[[
-- INFO: mappings
--]]
map("i", "jk", "<esc>")

map("n", "|", "<C-w>|")
map("n", "_", "<C-w>_")
map("n", "s", "<Plug>(easymotion-overwin-f2)")

map("n", "<leader>w", "<cmd>w<cr>")
map("n", "<leader>q", "<cmd>q<cr>")

map("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>")
map("n", "<C-p>", "<cmd>bp<cr>")
map("n", "<C-n>", "<cmd>bn<cr>")
map("n", "<leader>c", "<cmd>lua MiniBufremove.wipeout()<cr>")
map("n", "<leader>bo", "<cmd>BufferListOpen<cr>")
map("n", "<leader>bq", "<cmd>QuickNavOpen<cr>")
map("n", "<leader>ba", "<cmd>QuickNavAdd<cr>")
-- map("n", "<C-t>", ":QuickNavPrev<cr>")
-- map("n", "<C-n>", ":QuickNavNext<cr>")

map("n", "<leader>h", "<cmd>noh<cr>")

map("n", "<leader>g", "<cmd>Neogit kind=floating<cr>")
map("n", "<leader>u", "<cmd>lua vim.fn.execute({ ':UndotreeToggle', ':UndotreeFocus' })<cr>")

map("n", "<leader>mt", "<cmd>RenderMarkdown toggle<cr>")
map("n", "<leader>tc", "<cmd>CccPick<cr>")
map("n", "<leader>te", "<cmd>CccHighlighterToggle<cr>")
map("n", "<leader>tt", "<cmd>TodoTelescope<cr>")

map("n", "<leader>*", "<cmd>CloakToggle<cr>")

map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

map("n", "<leader>lc", "<cmd>lua require('custom').log()<cr>")
map("n", "<leader>nn", "<cmd>NotesNew<cr>")
map("n", "<leader>ns", "<cmd>NotesSave<cr>")
map("n", "<leader>ne", "<cmd>NotesEdit<cr>")
map("n", "<leader>nd", "<cmd>NotesDelete<cr>")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

opt.rtp:prepend(lazypath)

require("lazy").setup({
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
-- INFO: yank highlight
--]]
api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

--[[
-- INFO: floating window fix
--]]
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or "rounded"

	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

--[[
-- INFO: remember folds
--]]
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
