# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Neovim configuration using Lazy.nvim as the plugin manager. All configuration is written in Lua.

## Architecture

**Loading order** (defined in `init.lua`):
1. `config.options` - Vim options
2. `core.lazy` - Plugin manager bootstrap and plugin loading
3. `core.lsp` - LSP client enablement and diagnostic configuration
4. `config.keymaps` - Global keybindings
5. `config.autocmds` - Autocommands

**Plugin system**: Lazy.nvim auto-discovers plugins from `lua/plugins/`. Each file returns a plugin spec table. No manual registration needed.

**LSP configuration**: Uses Neovim's native `vim.lsp.enable()` with server configs in `lsp/*.lua`. Each file returns a config table with `cmd`, `filetypes`, `root_markers`, and `settings`. Mason handles server installation.

**Task runner**: Overseer templates in `lua/overseer/template/` for .NET development tasks.

## Adding New Components

**New plugin**: Create `lua/plugins/<name>.lua` returning a Lazy.nvim spec table.

**New LSP server**:
1. Create `lsp/<server-name>.lua` with config table
2. Add server name to `vim.lsp.enable()` in `lua/core/lsp.lua`
3. Add to Mason installer in `lua/plugins/mason.lua` if needed

**New keybinding**: Add to `lua/config/keymaps.lua` for global mappings, or in plugin config for plugin-specific mappings.
