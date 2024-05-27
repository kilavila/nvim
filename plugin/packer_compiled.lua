-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/kilavila/.cache/nvim/packer_hererocks/2.1.1713484068/share/lua/5.1/?.lua;/home/kilavila/.cache/nvim/packer_hererocks/2.1.1713484068/share/lua/5.1/?/init.lua;/home/kilavila/.cache/nvim/packer_hererocks/2.1.1713484068/lib/luarocks/rocks-5.1/?.lua;/home/kilavila/.cache/nvim/packer_hererocks/2.1.1713484068/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/kilavila/.cache/nvim/packer_hererocks/2.1.1713484068/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  catppuccin = {
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\nÆ\4\0\0\6\0\23\0=6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0005\4\a\0005\5\6\0=\5\b\4=\4\t\3B\1\2\0016\1\0\0'\3\n\0B\1\2\0029\1\4\1B\1\1\0016\1\0\0'\3\v\0B\1\2\0029\1\f\0019\1\4\0015\3\r\0=\0\14\3B\1\2\0016\1\0\0'\3\v\0B\1\2\0029\1\15\0019\1\4\0015\3\16\0=\0\14\3B\1\2\0016\1\0\0'\3\v\0B\1\2\0029\1\17\0019\1\4\0015\3\18\0=\0\14\3B\1\2\0016\1\0\0'\3\v\0B\1\2\0029\1\19\0019\1\4\0015\3\20\0=\0\14\3B\1\2\0016\1\0\0'\3\v\0B\1\2\0029\1\21\0019\1\4\0015\3\22\0=\0\14\3B\1\2\1K\0\1\0\1\0\1\17capabilities\0\vbashls\1\0\1\17capabilities\0\ncssls\1\0\1\17capabilities\0\thtml\1\0\1\17capabilities\0\rtsserver\17capabilities\1\0\1\17capabilities\0\vlua_ls\14lspconfig\20mason-lspconfig\aui\nicons\1\0\1\nicons\0\1\0\3\22package_installed\bâœ“\24package_uninstalled\bâœ—\20package_pending\bâžœ\1\0\2\27automatic_installation\2\aui\0\nsetup\nmason\25default_capabilities\17cmp_nvim_lsp\frequire\0" },
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mini-git"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rmini.git\frequire\0" },
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/mini-git",
    url = "https://github.com/echasnovski/mini-git"
  },
  ["mini.ai"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fmini.ai\frequire\0" },
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/mini.ai",
    url = "https://github.com/echasnovski/mini.ai"
  },
  ["mini.basics"] = {
    config = { "\27LJ\2\n \2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\17autocommands\1\0\2\nbasic\2\26relnum_in_visual_mode\2\rmappings\1\0\4\25option_toggle_prefix\6\\\nbasic\1\18move_with_alt\2\fwindows\2\foptions\1\0\4\rmappings\0\foptions\0\17autocommands\0\vsilent\1\1\0\3\nbasic\2\16win_borders\vsingle\rextra_ui\2\nsetup\16mini.basics\frequire\0" },
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/mini.basics",
    url = "https://github.com/echasnovski/mini.basics"
  },
  ["mini.comment"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17mini.comment\frequire\0" },
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/mini.comment",
    url = "https://github.com/echasnovski/mini.comment"
  },
  ["mini.files"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15mini.files\frequire\0" },
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/mini.files",
    url = "https://github.com/echasnovski/mini.files"
  },
  ["mini.misc"] = {
    config = { "\27LJ\2\n^\0\0\3\0\4\0\b6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0019\1\3\0B\1\1\1K\0\1\0\20setup_auto_root\25setup_restore_cursor\14mini.misc\frequire\0" },
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/mini.misc",
    url = "https://github.com/echasnovski/mini.misc"
  },
  ["mini.move"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14mini.move\frequire\0" },
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/mini.move",
    url = "https://github.com/echasnovski/mini.move"
  },
  ["mini.notify"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16mini.notify\frequire\0" },
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/mini.notify",
    url = "https://github.com/echasnovski/mini.notify"
  },
  ["mini.pairs"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15mini.pairs\frequire\0" },
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/mini.pairs",
    url = "https://github.com/echasnovski/mini.pairs"
  },
  ["mini.statusline"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mini.statusline\frequire\0" },
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/mini.statusline",
    url = "https://github.com/echasnovski/mini.statusline"
  },
  ["mini.surround"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18mini.surround\frequire\0" },
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/mini.surround",
    url = "https://github.com/echasnovski/mini.surround"
  },
  ["mini.tabline"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17mini.tabline\frequire\0" },
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/mini.tabline",
    url = "https://github.com/echasnovski/mini.tabline"
  },
  ["mini.trailspace"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mini.trailspace\frequire\0" },
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/mini.trailspace",
    url = "https://github.com/echasnovski/mini.trailspace"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n7\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\vexpand\fsnippet\bvimÖ\4\1\0\n\0\31\0>6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0035\4\v\0009\5\b\0009\5\t\0059\5\n\5B\5\1\2=\5\f\0049\5\b\0009\5\t\0059\5\n\5B\5\1\2=\5\r\4=\4\t\0039\4\14\0009\4\15\0049\4\16\0045\6\18\0009\a\14\0009\a\17\a)\tüÿB\a\2\2=\a\19\0069\a\14\0009\a\17\a)\t\4\0B\a\2\2=\a\20\0069\a\14\0009\a\21\aB\a\1\2=\a\22\0069\a\14\0009\a\23\aB\a\1\2=\a\24\0069\a\14\0009\a\25\a5\t\26\0B\a\2\2=\a\27\6B\4\2\2=\4\14\0039\4\b\0009\4\28\0044\6\3\0005\a\29\0>\a\1\0064\a\3\0005\b\30\0>\b\1\aB\4\3\2=\4\28\3B\1\2\1K\0\1\0\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\fsources\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\5\n<C-f>\0\n<C-e>\0\t<CR>\0\n<C-b>\0\14<C-Space>\0\16scroll_docs\vinsert\vpreset\fmapping\18documentation\15completion\1\0\2\15completion\0\18documentation\0\rbordered\vwindow\vconfig\fsnippet\1\0\4\fsnippet\0\vwindow\0\fsources\0\fmapping\0\vexpand\1\0\1\vexpand\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/kilavila/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: mini.tabline
time([[Config for mini.tabline]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17mini.tabline\frequire\0", "config", "mini.tabline")
time([[Config for mini.tabline]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n7\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\vexpand\fsnippet\bvimÖ\4\1\0\n\0\31\0>6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0035\4\v\0009\5\b\0009\5\t\0059\5\n\5B\5\1\2=\5\f\0049\5\b\0009\5\t\0059\5\n\5B\5\1\2=\5\r\4=\4\t\0039\4\14\0009\4\15\0049\4\16\0045\6\18\0009\a\14\0009\a\17\a)\tüÿB\a\2\2=\a\19\0069\a\14\0009\a\17\a)\t\4\0B\a\2\2=\a\20\0069\a\14\0009\a\21\aB\a\1\2=\a\22\0069\a\14\0009\a\23\aB\a\1\2=\a\24\0069\a\14\0009\a\25\a5\t\26\0B\a\2\2=\a\27\6B\4\2\2=\4\14\0039\4\b\0009\4\28\0044\6\3\0005\a\29\0>\a\1\0064\a\3\0005\b\30\0>\b\1\aB\4\3\2=\4\28\3B\1\2\1K\0\1\0\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\fsources\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\5\n<C-f>\0\n<C-e>\0\t<CR>\0\n<C-b>\0\14<C-Space>\0\16scroll_docs\vinsert\vpreset\fmapping\18documentation\15completion\1\0\2\15completion\0\18documentation\0\rbordered\vwindow\vconfig\fsnippet\1\0\4\fsnippet\0\vwindow\0\fsources\0\fmapping\0\vexpand\1\0\1\vexpand\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: mini.move
time([[Config for mini.move]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14mini.move\frequire\0", "config", "mini.move")
time([[Config for mini.move]], false)
-- Config for: mini.pairs
time([[Config for mini.pairs]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15mini.pairs\frequire\0", "config", "mini.pairs")
time([[Config for mini.pairs]], false)
-- Config for: mini.statusline
time([[Config for mini.statusline]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mini.statusline\frequire\0", "config", "mini.statusline")
time([[Config for mini.statusline]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\nÆ\4\0\0\6\0\23\0=6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0005\4\a\0005\5\6\0=\5\b\4=\4\t\3B\1\2\0016\1\0\0'\3\n\0B\1\2\0029\1\4\1B\1\1\0016\1\0\0'\3\v\0B\1\2\0029\1\f\0019\1\4\0015\3\r\0=\0\14\3B\1\2\0016\1\0\0'\3\v\0B\1\2\0029\1\15\0019\1\4\0015\3\16\0=\0\14\3B\1\2\0016\1\0\0'\3\v\0B\1\2\0029\1\17\0019\1\4\0015\3\18\0=\0\14\3B\1\2\0016\1\0\0'\3\v\0B\1\2\0029\1\19\0019\1\4\0015\3\20\0=\0\14\3B\1\2\0016\1\0\0'\3\v\0B\1\2\0029\1\21\0019\1\4\0015\3\22\0=\0\14\3B\1\2\1K\0\1\0\1\0\1\17capabilities\0\vbashls\1\0\1\17capabilities\0\ncssls\1\0\1\17capabilities\0\thtml\1\0\1\17capabilities\0\rtsserver\17capabilities\1\0\1\17capabilities\0\vlua_ls\14lspconfig\20mason-lspconfig\aui\nicons\1\0\1\nicons\0\1\0\3\22package_installed\bâœ“\24package_uninstalled\bâœ—\20package_pending\bâžœ\1\0\2\27automatic_installation\2\aui\0\nsetup\nmason\25default_capabilities\17cmp_nvim_lsp\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: mini.ai
time([[Config for mini.ai]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fmini.ai\frequire\0", "config", "mini.ai")
time([[Config for mini.ai]], false)
-- Config for: mini.surround
time([[Config for mini.surround]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18mini.surround\frequire\0", "config", "mini.surround")
time([[Config for mini.surround]], false)
-- Config for: mini.basics
time([[Config for mini.basics]], true)
try_loadstring("\27LJ\2\n \2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\17autocommands\1\0\2\nbasic\2\26relnum_in_visual_mode\2\rmappings\1\0\4\25option_toggle_prefix\6\\\nbasic\1\18move_with_alt\2\fwindows\2\foptions\1\0\4\rmappings\0\foptions\0\17autocommands\0\vsilent\1\1\0\3\nbasic\2\16win_borders\vsingle\rextra_ui\2\nsetup\16mini.basics\frequire\0", "config", "mini.basics")
time([[Config for mini.basics]], false)
-- Config for: mini-git
time([[Config for mini-git]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rmini.git\frequire\0", "config", "mini-git")
time([[Config for mini-git]], false)
-- Config for: mini.comment
time([[Config for mini.comment]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17mini.comment\frequire\0", "config", "mini.comment")
time([[Config for mini.comment]], false)
-- Config for: mini.misc
time([[Config for mini.misc]], true)
try_loadstring("\27LJ\2\n^\0\0\3\0\4\0\b6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0019\1\3\0B\1\1\1K\0\1\0\20setup_auto_root\25setup_restore_cursor\14mini.misc\frequire\0", "config", "mini.misc")
time([[Config for mini.misc]], false)
-- Config for: mini.trailspace
time([[Config for mini.trailspace]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mini.trailspace\frequire\0", "config", "mini.trailspace")
time([[Config for mini.trailspace]], false)
-- Config for: mini.files
time([[Config for mini.files]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15mini.files\frequire\0", "config", "mini.files")
time([[Config for mini.files]], false)
-- Config for: mini.notify
time([[Config for mini.notify]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16mini.notify\frequire\0", "config", "mini.notify")
time([[Config for mini.notify]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles(1) end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
