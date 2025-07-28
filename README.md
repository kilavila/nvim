# Neovim Configuration

This repository contains my personal Neovim configuration.

## File Structure

- `init.lua`: Main Neovim config entry point.
- `lua/config/`: Core config modules
  - `autocmd.lua`: Autocommands setup
  - `functions.lua`: Utility functions
  - `mappings.lua`: Key mappings
  - `options.lua`: Neovim options
- `lua/lazy-nvim.lua`: Plugin manager bootstrap (using lazy.nvim)
- `lua/plugins/`: Plugin configurations for various plugins like:
  - `autotag.lua`, `blink.lua`, `cloak.lua`, `conform.lua`, `lsp.lua`, `mini.lua`, `neocomposer.lua`, `surround.lua`, `telescope.lua`, `themes.lua`, `treesitter.lua`

## Plugin Manager

- Using [lazy.nvim](https://github.com/folke/lazy.nvim) for managing plugins.

## Main Plugins Included

- LSP and Completion: `nvim-lspconfig`, `mason.nvim`, `LuaSnip`, `blink.cmp`
- UI and Appearance: `horizon.nvim` (colorscheme), `cloak.nvim`, `mini.nvim`, `nvim-web-devicons`
- Productivity: `NeoComposer.nvim`, `nvim-surround`, `telescope.nvim` and its extensions (`telescope-fzf-native.nvim`, `telescope-ui-select.nvim`)
- Syntax and Parsing: `nvim-treesitter`, `nvim-ts-autotag`
- Misc: `fidget.nvim`, `lazydev.nvim`, `undotree`, `conform.nvim`
  
## Usage

Open Neovim as usual and your configuration along with plugins will be loaded automatically.

_*Adjust colorschemes and plugin options in `lua/plugins/themes.lua` and respective plugin config files.*_

---

This setup is modular and organized to allow easy customization by editing individual Lua config modules in the `lua/config` and `lua/plugins` directories.
