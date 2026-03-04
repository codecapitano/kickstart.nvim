# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## About This Repository

This is a [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) fork — a minimal, single-file Neovim configuration designed to be read and understood in full. The philosophy is intentional: one `init.lua` rather than many split files, so the entire base config is visible at once.

## Formatting

Lua formatting is enforced via **stylua** with the config in `.stylua.toml` (160-char columns, 2-space indent, single quotes, no call parentheses).

- Check formatting: `stylua --check .`
- Apply formatting: `stylua .`

Always run `stylua .` before committing. CI (`.github/workflows/stylua.yml`) will fail on unformatted code.

## Architecture

### Single-file core

`init.lua` contains everything in order:
1. Global settings (`vim.g.*`, leader key)
2. Vim options (`vim.opt.*`)
3. Basic keymaps
4. Lazy.nvim bootstrap + plugin specs (the bulk of the file)

### Plugin organization

Plugins are defined inline as Lazy.nvim specs inside `init.lua`. Optional extras live in `lua/kickstart/plugins/` and are pulled in via `{ import = 'kickstart.plugins.X' }` entries near the end of the spec table. User customizations go in `lua/custom/plugins/` (currently an empty template).

### Key plugin categories

- **LSP**: `nvim-lspconfig` + Mason for auto-installing servers; `lua_ls` pre-configured
- **Completion**: `blink.cmp` + `LuaSnip`
- **Formatting**: `conform.nvim` (format on save, `<leader>f` to format manually)
- **Linting**: `nvim-lint` (configured in `lua/kickstart/plugins/lint.lua`)
- **Fuzzy finding**: Telescope (+ fzf-native, ui-select)
- **Treesitter**: syntax highlighting for bash, C, diff, HTML, Lua, Markdown, Vim
- **Debugging**: nvim-dap + nvim-dap-ui + mason-nvim-dap (in `lua/kickstart/plugins/debug.lua`)
- **UI**: tokyonight theme, which-key, mini.nvim (ai, surround, statusline), gitsigns, fidget

### Lazy-loading strategy

- **Immediate**: colorscheme (priority 1000), which-key
- **Event-based**: Telescope on `VimEnter`, conform on `BufWritePre`, nvim-lint on `BufReadPre`/`BufNewFile`, autopairs on `InsertEnter`
- **Keymap-triggered**: Neo-tree (`\`), DAP (F5/F1/F2/F3), format (`<leader>f`)

### Plugin lockfile

`lazy-lock.json` pins exact plugin commits. Update with `:Lazy update` inside Neovim; commit the resulting lockfile changes.

## Adding / Modifying Plugins

- **Modify existing**: edit the plugin spec directly in `init.lua`
- **Add optional kickstart plugin**: create `lua/kickstart/plugins/<name>.lua` and add `{ import = 'kickstart.plugins.<name>' }` to the Lazy spec
- **Add personal plugins**: add to `lua/custom/plugins/init.lua`

## Health Checks

Run `:checkhealth` inside Neovim to validate external dependencies (git, make, unzip, ripgrep) and Neovim version (≥ 0.11 required).
