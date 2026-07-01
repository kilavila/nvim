---@diagnostic disable-next-line: undefined-global
local vim = vim

--[[ OPTIONS ]]
vim.g.mapleader        = ' '
vim.g.maplocalleader   = ' '
vim.g.termguicolors    = true
vim.g.have_nerd_font   = true

vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.mouse          = 'a'
vim.opt.showmode       = false
vim.opt.breakindent    = true
vim.opt.undofile       = true
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.signcolumn     = 'yes:1'
vim.opt.updatetime     = 250
vim.opt.timeoutlen     = 300
vim.opt.splitright     = true
vim.opt.splitbelow     = true
vim.opt.list           = false
vim.opt.inccommand     = 'split'
vim.opt.cursorline     = true
vim.opt.scrolloff      = 10
vim.opt.wrap           = false
vim.opt.tabstop        = 2
vim.opt.softtabstop    = 2
vim.opt.shiftwidth     = 2
vim.opt.hlsearch       = true

vim.o.winborder        = 'rounded'



--[[ KEYMAPS ]]
vim.keymap.set('i', 'jk',         '<esc>')
vim.keymap.set('n', '<leader>w',  '<cmd>w<cr>')
vim.keymap.set('n', '<leader>q',  '<cmd>q<cr>')
vim.keymap.set('n', '<leader>so', '<cmd>so  %<cr>')
vim.keymap.set('n', '<leader>e',  '<cmd>lua MiniFiles.open()<cr>')
vim.keymap.set('n', '<c-n>',      '<cmd>bn<cr>')
vim.keymap.set('n', '<c-p>',      '<cmd>bp<cr>')
vim.keymap.set('n', '<leader>c',  '<cmd>bd<cr>')
vim.keymap.set('n', '<leader>h',  '<cmd>noh<cr>')
vim.keymap.set('n', '<leader>*',  '<cmd>CloakToggle<cr>')
vim.keymap.set('n', '<leader>u',  '<cmd>UndotreeToggle<cr>')

vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>')
vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>')



--[[ PLUGINS ]]
vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'nvim-treesitter' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate')
  end
end })

vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/laytan/cloak.nvim',
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/mbbill/undotree',

	{
		src  = 'https://github.com/catppuccin/nvim',
		name = 'catppuccin',
	},

	{
		src = 'https://github.com/lewis6991/gitsigns.nvim',
		opts = {
			signs = {
				add          = { text = '+' },
				change       = { text = '~' },
				delete       = { text = '_' },
				topdelete    = { text = '‾' },
				changedelete = { text = '~' },
			},
		},
	},

	{
		src = 'https://github.com/folke/todo-comments.nvim',
		event = 'VimEnter',
		opts = {
			signs = false,
			keywords = {
				FIX = {
					icon = " ", -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
					-- signs = false, -- configure signs for some keywords individually
				},
				TODO = { icon = " ", color = "info", alt = { "README" } },
				HACK = { icon = " ", color = "warning" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
		},
	},

})

vim.cmd.colorscheme('catppuccin')

require('mini.ai').setup()
require('mini.align').setup()
require('mini.basics').setup()
require('mini.completion').setup()
require('mini.files').setup()
require('mini.move').setup()
require('mini.pairs').setup()
require('mini.snippets').setup()
require('mini.statusline').setup()
require('mini.surround').setup()
require('mini.tabline').setup()

require('cloak').setup()
require('todo-comments').setup()



--[[ LSP ]]
vim.lsp.enable({
	'gopls',
	'lua_ls',
	'ts_ls',
})



--[[ AUTO-CMD ]]
vim.api.nvim_create_autocmd({ 'BufWinLeave' }, {
	pattern = { '*.*' },
	desc    = 'save view (folds), when closing file',
	command = 'mkview',
})

vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
	pattern = { '*.*' },
	desc    = 'load view (folds), when opening file',
	command = 'silent! loadview',
})
