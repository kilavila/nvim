-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- plugin manager
	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
	use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
	use("christoomey/vim-tmux-navigator") -- window split navigator (use CTRL + H/J/K/L)
	use("szw/vim-maximizer") -- maximizes and restores current window (usage <leader>sm)
	use("tpope/vim-surround") -- smart enclose (usage: ys<motion><char> cs<char><char> ds<char>)
	use("vim-scripts/ReplaceWithRegister") -- smart copy (usage: y<motion> gr<motion>)
	use("numToStr/Comment.nvim") -- easy commenting (usage: gcc gc<motion>)
	use("nvim-tree/nvim-tree.lua") -- file explorer
	-- use("kyazdani42/nvim-web-devicons") -- nvim-tree file explorer icons
	use("nvim-lualine/lualine.nvim") -- status line
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
	use("hrsh7th/nvim-cmp") -- autocompletion
	use("hrsh7th/cmp-buffer") -- recommend text from buffer
	use("hrsh7th/cmp-path") -- file path completion
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- show snippets in autocompletion
	use("rafamadriz/friendly-snippets") -- collection of useful snippet for languages
	use("williamboman/mason.nvim") -- managing and installing lsp server, linters and formatters
	use("williamboman/mason-lspconfig.nvim") -- bridge gap between mason and lspconfig
	use("neovim/nvim-lspconfig") -- configuring lsp servers
	use("hrsh7th/cmp-nvim-lsp") -- configure lsp server
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced ui for lsp
	use("jose-elias-alvarez/typescript.nvim") -- more functionality for typescript
	-- use("onsails/lspkind.nvim") -- icons in autocompletion window
	use("jose-elias-alvarez/null-ls.nvim") -- formatting and linting
	use("jayp0521/mason-null-ls.nvim") -- configure linters and formatting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use("windwp/nvim-autopairs") -- auto closing tags
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- auto closing tags
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	use("lukas-reineke/indent-blankline.nvim")
	use("alvan/vim-closetag")
	use("glepnir/dashboard-nvim")
	use("preservim/tagbar")
	use("kdheepak/lazygit.nvim")
	use("declancm/cinnamon.nvim")
	use("petertriho/nvim-scrollbar")
	use("sudormrfbin/cheatsheet.nvim")
	use("ray-x/web-tools.nvim")

	-- experimental/beta
	use("potamides/pantran.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
