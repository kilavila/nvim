local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree docs
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- deprecated
-- todo: move into .setup()
vim.g.nvim_tree_show_icons = {
	git = 0,
	folder_arrows = 1,
}

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#FFF ]])

nvimtree.setup({

	-- todo: make auto close nvim-tree work
	-- auto_close = true,

	-- change folder arrow icons
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "→", -- arrow when folder is closed
					arrow_open = "↓", -- arrow when folder is open
				},
			},
		},
	},

	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},

	-- git = {
	--   ignore = true,
	-- },
})
