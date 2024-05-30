local map = vim.api.nvim_set_keymap

map('i', 'jk', '<esc>', { noremap = true, silent = true })

map('n', '<leader>w', ':w<cr>', { noremap = true, silent = true })
map('n', '<leader>q', ':q<cr>', { noremap = true, silent = true })

map('n', '<leader>bb', ':bp<cr>', { noremap = true, silent = true })
map('n', '<leader>bn', ':bn<cr>', { noremap = true, silent = true })
map('n', '<leader>c', ':bd<cr>', { noremap = true, silent = true })

map('n', '<leader>h', ':noh<cr>', { noremap = true, silent = true })

map('n', '<leader>la', ':lua vim.lsp.buf.code_action()<cr>', { noremap = true, silent = true })
map('n', '<leader>ld', ':lua require(\'telescope.builtin\').diagnostics()<cr>', { noremap = true, silent = true })
map('n', '<leader>lf', ':lua vim.lsp.buf.format()<cr>', { noremap = true, silent = true })
map('n', '<leader>lr', ':lua vim.lsp.buf.rename()<cr>', { noremap = true, silent = true })

map('n', '<leader>e', ':lua MiniFiles.open()<cr>', { noremap = true, silent = true })
map('n', '<leader>u', ':UndotreeToggle<cr>', { noremap = true, silent = true })

map('n', '<leader><leader>', ':lua require(\'telescope.builtin\').buffers()<cr>', { noremap = true, silent = true })
map('n', '<leader>ff', ':lua require(\'telescope.builtin\').git_files()<cr>', { noremap = true, silent = true })
map('n', '<leader>fr', ':lua require(\'telescope.builtin\').oldfiles()<cr>', { noremap = true, silent = true })

map('n', '<leader>fg', ':lua require(\'telescope.builtin\').live_grep()<cr>', { noremap = true, silent = true })
map('n', '<leader>fw', ':lua require(\'telescope.builtin\').grep_string()<cr>', { noremap = true, silent = true })

map('n', '<leader>fs', ':lua require(\'telescope.builtin\').search_history()<cr>', { noremap = true, silent = true })
map('n', '<leader>fk', ':lua require(\'telescope.builtin\').keymaps()<cr>', { noremap = true, silent = true })
map('n', '<leader>fc', ':lua require(\'telescope.builtin\').command_history()<cr>', { noremap = true, silent = true })
map('n', '<leader>fh', ':lua require(\'telescope.builtin\').help_tags()<cr>', { noremap = true, silent = true })

map('n', '<leader>gg', ':LazyGit<cr>', { noremap = true, silent = true })
map('n', '<C-ESC>', '<CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
map('t', '<C-ESC>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
