# Neovim Configuration

A modern, modular Neovim configuration written in Lua.

## Overview

- **Plugin Manager**: Lazy.nvim with plugins organized in individual files under `lua/plugins/`
- **Theme**: Catppuccin (Mocha) with transparent background
- **Leader Key**: Space

## Key Features

### Development

- LSP support for Lua, Python (basedpyright), C# (Roslyn + Razor), Go, C/C++, Rust, HTML, YAML, TOML, and Dockerfile
- Mason for automatic language server installation
- Blink.cmp for fast completion with snippet support
- Conform.nvim for format-on-save (disabled for C, C++, and Razor files)
- Render-markdown for enhanced markdown display in markdown and AgenticChat buffers

### Navigation

- Telescope for fuzzy finding (files, grep, diagnostics, LSP symbols)
- Neo-tree for file exploration
- Which-key for discoverable keybindings

### AI Assistance

- CodeCompanion with Anthropic Claude and Ollama support

### Productivity

- Toggleterm for integrated terminal
- Gitsigns for git integration
- Treesitter for syntax highlighting

## Structure

```
init.lua           → Entry point
lua/core/          → Lazy.nvim & LSP setup (diagnostics, keybindings, filetypes)
lua/config/        → Options, keymaps, commands
lua/plugins/       → Plugin configurations
lsp/               → Language server configs
```

## Notable Customizations

- Relative line numbers, 4-space indentation
- `jj` to escape insert mode
- Window navigation with `Ctrl+hjkl`
- Buffer switching with `Tab`/`Shift+Tab`
- Organized leader-key groups (`<leader>c` for code, `<leader>s` for search, etc.)
