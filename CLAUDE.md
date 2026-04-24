# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration using **native `vim.pack`** (Neovim's built-in package manager) — not lazy.nvim or packer. The lock file is `nvim-pack-lock.json`.

## Architecture

### Entry point
`init.lua` opts into the new UI2, then requires four modules: `options`, `keymaps`, `commands`, and `lsp` (all from `lua/`).

### Configuration layers

| Location | Purpose |
|---|---|
| `lua/options.lua` | Vim options (leader keys set here — must load before plugins) |
| `lua/keymaps.lua` | Global keymaps (diagnostics, navigation, window management, buffers) |
| `lua/commands.lua` | User commands and autocmds (e.g. `PackUpdate`, yank highlight) |
| `lua/lsp.lua` | LSP enablement, diagnostic config, and `LspAttach` keymaps |
| `plugin/` | One file per plugin — each calls `vim.pack.add()` then configures the plugin |
| `lsp/` | LSP server config tables, returned and loaded via `vim.lsp.enable()` |
| `lua/overseer/template/user/` | Custom Overseer task templates (e.g., `dotnet_build.lua`, `dotnet_run.lua`) |

### Plugin loading pattern
Every file in `plugin/` is auto-sourced by Neovim. The pattern is:
```lua
vim.pack.add({ "https://github.com/author/plugin.nvim" })
require("plugin").setup({ ... })
-- keymaps defined here too
```
Plugins, their configuration, and their keymaps all live together in the same `plugin/*.lua` file.

### LSP pattern
`lsp/*.lua` files return a config table (no `require`, no setup calls). They are registered with:
```lua
vim.lsp.enable({ "lua_ls", "clangd", "roslyn", "html" })
```
in `lua/lsp.lua`. LSP navigation keymaps (go-to-definition, references, rename, etc.) are set up in the `LspAttach` autocmd in `lua/lsp.lua`, using Telescope for most pickers.

### C# / Roslyn
Roslyn LSP is installed via Mason using the `Crashdummyy/mason-registry` (included alongside the standard `mason-org/mason-registry`). Configuration is in `lsp/roslyn.lua` and `plugin/roslyn.lua`. The Razor extension path is derived from the Mason data directory.

## Leader keys
- `<leader>` = `<Space>`
- `<localleader>` = `\`

## Key keymaps by group
- `<leader>a*` — AI (agentic.nvim): toggle chat `<C-a>`, diagnostics, sessions
- `<leader>c*` — Code/LSP: definition, references, rename, code action, format (`<leader>cf`)
- `<leader>f*` — Find (Telescope): files, grep, buffers, help, keymaps
- `<leader>g*` — Git: `<leader>gg` opens Neogit
- `<leader>t*` — Tasks (Overseer): toggle `<leader>tt`, dotnet build `<leader>tb`, dotnet run `<leader>tr`
- `<leader>w*` — Windows: split, close, zen mode
- `<leader>e` — Toggle file explorer (mini.files)
- `<C-t>` — Toggle terminal (toggleterm)

## Adding a new plugin
Create a new file in `plugin/` that calls `vim.pack.add()` with the GitHub URL, then configures the plugin in the same file.

## Adding a new LSP server
1. Create `lsp/<server-name>.lua` returning a config table
2. Add the server name to the `vim.lsp.enable({...})` call in `lua/lsp.lua`
3. If the server needs to be installed via Mason, add it to `mason-tool-installer` in `plugin/mason.lua`

## Adding an Overseer task
Create a new file under `lua/overseer/template/user/` returning an overseer template table. Templates are auto-discovered by Overseer.

## Formatting
conform.nvim formats on save for most filetypes; disabled for `c`, `cpp`, and `razor`. Lua uses `stylua`. `<leader>cf` triggers manual format.
