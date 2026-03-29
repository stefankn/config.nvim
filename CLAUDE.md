# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Neovim configuration using Lazy.nvim as the plugin manager. All configuration is written in Lua.

## Architecture

**Loading order** (defined in `init.lua`):
1. `config.options` - Vim options
2. `core.lazy` - Plugin manager bootstrap and plugin loading
3. `core.lsp` - LSP client enablement, diagnostic configuration, and LspAttach keybindings
4. `config.keymaps` - Global keybindings
5. `config.commands` - Autocommands and user commands

**Plugin system**: Lazy.nvim auto-discovers plugins from `lua/plugins/`. Each file returns a plugin spec table. No manual registration needed.

**LSP configuration**: Uses Neovim's native `vim.lsp.enable()` with server configs in `lsp/*.lua`. Each file returns a config table with `cmd`, `filetypes`, `root_markers`, and `settings`. Mason handles server installation. The `core.lsp` module also configures:
- Custom diagnostic signs and styling
- LspAttach autocmd that sets up buffer-local keybindings when an LSP client attaches
- Custom filetypes (e.g., Razor for C# web development)

**Current LSP servers**: lua_ls, basedpyright, docker-file, docker-compose, html, yamlls, taplo, gopls, clangd, rust-analyzer, roslyn

**Formatting**: Conform.nvim handles code formatting with format-on-save enabled by default (500ms timeout, LSP fallback). Auto-format is explicitly disabled for C, C++, and Razor files due to performance or standardization concerns. Manual formatting available via `<leader>cf`.

**C# Razor support**: Roslyn LSP is configured with Razor extension support, including source generator and design-time targets for full Blazor development experience.

## Adding New Components

**New plugin**: Create `lua/plugins/<name>.lua` returning a Lazy.nvim spec table.

**New LSP server**:
1. Create `lsp/<server-name>.lua` with config table
2. Add server name to `vim.lsp.enable()` in `lua/core/lsp.lua`
3. Add to Mason installer in `lua/plugins/mason.lua` if needed

**New keybinding**: Add to `lua/config/keymaps.lua` for global mappings, in plugin config for plugin-specific mappings, or in the LspAttach autocmd in `lua/core/lsp.lua` for LSP-specific mappings.

**New user command**: Add to `lua/config/commands.lua` using `vim.api.nvim_create_user_command()`.

**New filetype**: Add to the `vim.filetype.add()` call in `lua/core/lsp.lua`.
