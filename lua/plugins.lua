local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.util = require('packer.util')
packer.init({
	ensure_dependencies  = true,                                                          -- Should packer install plugin dependencies?
	snapshot             = nil,                                                           -- Name of the snapshot you would like to load at startup
	snapshot_path        = packer.util.join_paths(vim.fn.stdpath('cache'), 'packer.nvim'), -- Default save directory for snapshots
	package_root         = packer.util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
	compile_path         = packer.util.join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.lua'),
	plugin_package       = 'packer', -- The default package for plugins
	max_jobs             = nil,     -- Limit the number of simultaneous jobs. nil means no limit
	auto_clean           = true,    -- During sync(), remove unused plugins
	compile_on_sync      = true,    -- During sync(), run packer.compile()
	disable_commands     = false,   -- Disable creating commands
	opt_default          = false,   -- Default to using opt (as opposed to start) plugins
	transitive_opt       = true,    -- Make dependencies of opt plugins also opt by default
	transitive_disable   = true,    -- Automatically disable dependencies of disabled plugins
	auto_reload_compiled = true,    -- Automatically reload the compiled file after creating it.
	preview_updates      = false,   -- If true, always preview updates before choosing which plugins to update, same as `PackerUpdate --preview`.
	git                  = {
		cmd = 'git',                  -- The base command for git operations
		subcommands = {               -- Format strings for git subcommands
			update         = 'pull --ff-only --progress --rebase=false --force',
			install        = 'clone --depth %i --no-single-branch --progress',
			fetch          = 'fetch --depth 999999 --progress --force',
			checkout       = 'checkout %s --',
			update_branch  = 'merge --ff-only @{u}',
			current_branch = 'branch --show-current',
			diff           = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
			diff_fmt       = '%%h %%s (%%cr)',
			get_rev        = 'rev-parse --short HEAD',
			get_msg        = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
			submodules     = 'submodule update --init --recursive --progress'
		},
		depth = 1,                                 -- Git clone depth
		clone_timeout = 60,                        -- Timeout, in seconds, for git clones
		default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
	},
	display              = {
		non_interactive = false, -- If true, disable display windows for all operations
		compact         = true, -- If true, fold updates results by default
		open_fn         = nil, -- An optional function to open a window for packer's display
		open_cmd        = '65vnew \\[packer\\]', -- An optional command to open a window for packer's display
		working_sym     = '⟳', -- The symbol for a plugin being installed/updated
		error_sym       = '✗', -- The symbol for a plugin with an error in installation/updating
		done_sym        = '✓', -- The symbol for a plugin which has completed installation/updating
		removed_sym     = '-', -- The symbol for an unused plugin which was removed
		moved_sym       = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
		header_sym      = '━', -- The symbol for the header line in packer's display
		show_all_info   = true, -- Should packer show all update details automatically?
		prompt_border   = 'single', -- Border style of prompt popups.
		keybindings     = { -- Keybindings for the display window
			quit = 'q',
			toggle_update = 'u', -- only in preview
			continue = 'c', -- only in preview
			toggle_info = '<CR>',
			diff = 'd',
			prompt_revert = 'r',
		}
	},
	luarocks             = {
		python_cmd = 'python'                   -- Set the python command to use for running hererocks
	},
	log                  = { level = 'warn' }, -- The default print log level. One of: "trace", "debug", "info", "warn", "error", "fatal".
	profile              = {
		enable = false,
		threshold = 1,             -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
	},
	autoremove           = false, -- Remove disabled or unused plugins without prompting the user
})

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use { 'wbthomason/packer.nvim' }
	use { 'catppuccin/nvim', as = 'catppuccin' }
	use { 'mbbill/undotree' }
	use { 'numToStr/FTerm.nvim' }



	-- @info : Completion
	use { 'hrsh7th/cmp-nvim-lsp' }
	use {
		'hrsh7th/nvim-cmp',
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = "luasnip" },
				}, {
					{ name = 'buffer' },
				})
			})
		end
	}
	use {
		'windwp/nvim-ts-autotag',
		config = function()
			require('nvim-ts-autotag').setup({
				opts = {
					enable_close = true,     -- Auto close tags
					enable_rename = true,    -- Auto rename pairs of tags
					enable_close_on_slash = false -- Auto close on trailing </
				},
			})
		end
	}



	-- @info : LSP Config
	use { 'williamboman/mason-lspconfig.nvim' }
	use { 'neovim/nvim-lspconfig' }
	use {
		"williamboman/mason.nvim",
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			require("mason").setup({
				automatic_installation = true,
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
					}
				}
			})
			require("mason-lspconfig").setup()

			require("lspconfig").angularls.setup({ capabilities = capabilities })
			require("lspconfig").bashls.setup({ capabilities = capabilities })
			require("lspconfig").cssls.setup({ capabilities = capabilities })
			require("lspconfig").css_variables.setup({ capabilities = capabilities })
			require("lspconfig").cssmodules_ls.setup({ capabilities = capabilities })
			require("lspconfig").custom_elements_ls.setup({ capabilities = capabilities })
			require("lspconfig").emmet_language_server.setup({ capabilities = capabilities })
			require("lspconfig").eslint.setup({ capabilities = capabilities })
			require("lspconfig").html.setup({ capabilities = capabilities })
			require("lspconfig").jsonls.setup({ capabilities = capabilities })
			require("lspconfig").lua_ls.setup({ capabilities = capabilities })
			require("lspconfig").lwc_ls.setup({ capabilities = capabilities })
			require("lspconfig").prismals.setup({ capabilities = capabilities })
			require("lspconfig").quick_lint_js.setup({ capabilities = capabilities })
			require("lspconfig").somesass_ls.setup({ capabilities = capabilities })
			require("lspconfig").tailwindcss.setup({ capabilities = capabilities })
			require("lspconfig").tsserver.setup({ capabilities = capabilities })
			require("lspconfig").typos_lsp.setup({ capabilities = capabilities })
			require("lspconfig").vimls.setup({ capabilities = capabilities })
		end
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('nvim-treesitter.configs').setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = true,
				},
			})
		end
	}
	use {
		'rmagatti/goto-preview',
		config = function()
			require('goto-preview').setup({
				-- calculate width of current buffer
				width = 150,          -- Width of the floating window
				height = 30,          -- Height of the floating window
				border = { '↖', '─', '┐', '│', '┘', '─', '└', '│' },
				default_mappings = true, -- Bind default mappings
				debug = false,        -- Print debug information
				opacity = 0,          -- 0-100 opacity level of the floating window where 100 is fully transparent.
				resizing_mappings = true, -- Binds arrow keys to resizing the floating window.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				post_close_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				references = {        -- Configure the telescope UI for slowing the references cycling window.
					telescope = require('telescope.themes').get_dropdown { hide_preview = false },
				},
				-- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
				focus_on_open = true,                                    -- Focus the floating window when opening it.
				dismiss_on_move = false,                                 -- Dismiss the floating window when moving the cursor.
				force_close = true,                                      -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
				bufhidden = 'wipe',                                      -- the bufhidden option to set on the floating window. See :h bufhidden
				stack_floating_preview_windows = true,                   -- Whether to nest floating windows
				preview_window_title = { enable = true, position = 'left' }, -- Whether to set the preview window title as the filename
			})
		end,
	}



	-- @info : Mini plugins collection
	use {
		'echasnovski/mini.ai',
		version = false,
		config = function()
			require('mini.ai').setup()
		end
	}
	use {
		'echasnovski/mini.trailspace',
		version = false,
		config = function()
			require('mini.trailspace').setup()
		end
	}
	use {
		'echasnovski/mini.comment',
		version = false,
		config = function()
			require('mini.comment').setup()
		end
	}
	use {
		'echasnovski/mini.misc',
		version = false,
		config = function()
			local misc = require('mini.misc')

			misc.setup_restore_cursor()
			misc.setup_auto_root()
		end
	}
	use {
		'echasnovski/mini.files',
		version = false,
		config = function()
			require('mini.files').setup()
		end
	}
	use {
		'echasnovski/mini-git',
		version = false,
		main = 'mini.git',
		config = function()
			require('mini.git').setup()
		end
	}
	use {
		'echasnovski/mini.move',
		version = false,
		config = function()
			require('mini.move').setup()
		end
	}
	use {
		'echasnovski/mini.pairs',
		version = false,
		config = function()
			require('mini.pairs').setup()
		end
	}
	use {
		'echasnovski/mini.basics',
		version = false,
		config = function()
			require('mini.basics').setup({
				options = {
					-- Basic options ('number', 'ignorecase', and many more)
					basic = true,
					-- Extra UI features ('winblend', 'cmdheight=0', ...)
					extra_ui = true,
					-- Presets for window borders ('single', 'double', ...)
					win_borders = 'single',
				},
				-- Mappings. Set to `false` to disable.
				mappings = {
					-- Basic mappings (better 'jk', save with Ctrl+S, ...)
					basic = false,
					-- Prefix for mappings that toggle common options ('wrap', 'spell', ...).
					-- Supply empty string to not create these mappings.
					option_toggle_prefix = [[\]],
					-- Window navigation with <C-hjkl>, resize with <C-arrow>
					windows = true,
					-- Move cursor in Insert, Command, and Terminal mode with <M-hjkl>
					move_with_alt = true,
				},
				-- Autocommands. Set to `false` to disable
				autocommands = {
					-- Basic autocommands (highlight on yank, start Insert in terminal, ...)
					basic = true,
					-- Set 'relativenumber' only in linewise and blockwise Visual mode
					relnum_in_visual_mode = true,
				},
				-- Whether to disable showing non-error feedback
				silent = false,
			})
		end
	}
	use {
		'echasnovski/mini.statusline',
		version = false,
		config = function()
			require('mini.statusline').setup()
		end
	}
	use {
		'echasnovski/mini.surround',
		version = false,
		config = function()
			require('mini.surround').setup()
		end
	}
	use {
		'echasnovski/mini.tabline',
		version = false,
		config = function()
			require('mini.tabline').setup()
		end
	}



	-- @info : Todo Comments
	use {
		'folke/todo-comments.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = function()
			require("todo-comments").setup({
				signs = false, -- show icons in the signs column
				keywords = {
					-- @issue testing error comment
					ERRORSANDISSUES = {
						color = "error",             -- can be a hex color, or a named color (see below)
						alt = { "error", "bug", "issue" }, -- a set of other keywords that all map to this FIX keywords
					},
					-- @readme testing hint comment
					TODOSANDNOTES = { color = "hint", alt = { "todo", "info", "readme" } },
					-- @param {string} color
					NODETYPES = {
						color = "test",
						alt = {
							"param",
							"type",
							"returns",
						}
					},
				},
				gui_style = {
					fg = "NONE", -- The gui style to use for the fg highlight group.
					bg = "NONE", -- The gui style to use for the bg highlight group.
				},
				highlight = {
					multiline = true,            -- enable multine todo comments
					multiline_pattern = "^.",    -- lua pattern to match the next multiline from the start of the matched keyword
					multiline_context = 10,      -- extra lines that will be re-evaluated when changing a line
					before = "fg",               -- "fg" or "bg" or empty
					keyword = "wide_fg",         -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
					after = "fg",                -- "fg" or "bg" or empty
					pattern = [[.*\@<(KEYWORDS)\s*]], -- pattern or table of patterns, used for highlighting (vim regex)
					comments_only = true,        -- uses treesitter to match keywords in comments only
					max_line_len = 400,          -- ignore lines longer than this
					exclude = {},                -- list of file types to exclude highlighting
				},
				pattern = [[\b\@(KEYWORDS)\b]], -- ripgrep regex
			})
		end
	}



	-- @info : Telescope
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.6',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}



	-- @info : LazyGit
	use {
		"kdheepak/lazygit.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	}
	use { -- Adds git related signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup({
				signs = {
					add = { text = '+' },
					change = { text = '~' },
					delete = { text = '_' },
					topdelete = { text = '‾' },
					changedelete = { text = '~' },
				}
			})
		end
	}



	if packer_bootstrap then
		require('packer').sync()
	end
end)
