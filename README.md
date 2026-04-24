# Neovim Config

Personal Neovim configuration built on native `vim.pack` (Neovim's built-in package manager).

## Requirements

- Neovim >= 0.12
- A [Nerd Font](https://www.nerdfonts.com/)
- `make` (to build telescope-fzf-native)
- `stylua` (Lua formatter, also installable via Mason)

## Plugin management

Plugins are declared with `vim.pack.add()` directly inside each `plugin/*.lua` file. Neovim auto-sources everything in `plugin/` on startup. The lock file is `nvim-pack-lock.json`.

To update all plugins: `:PackUpdate`  
To sync/install missing plugins: `:PackSync`

## LSP

LSP servers are configured as return tables in `lsp/` and enabled via `vim.lsp.enable()` in `lua/lsp.lua`.

| Server | Language |
|---|---|
| `lua_ls` | Lua |
| `clangd` | C/C++ |
| `roslyn` | C# / Razor |
| `html` | HTML |

Mason auto-installs: `lua-language-server`, `stylua`, `docker-compose-language-service`, `dockerfile-language-server`.

Roslyn requires the `Crashdummyy/mason-registry` (configured in `plugin/mason.lua`) in addition to the standard registry.

## Keymaps

`<leader>` = `Space`, `<localleader>` = `\`

| Key | Action |
|---|---|
| `<leader>e` | Toggle file explorer (mini.files) |
| `<leader>gg` | Open Neogit |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find buffers |
| `<leader>r` | Recent files |
| `<C-t>` | Toggle terminal |
| `<leader>cf` | Format buffer |
| `<leader>ca` | Code action |
| `<leader>cn` | Rename symbol |
| `<leader>cd` | Go to definition |
| `<leader>cr` | List references |
| `<leader>tt` | Toggle Overseer task panel |
| `<leader>tb` | `dotnet build` |
| `<leader>tr` | `dotnet run` |
| `<C-a>` | Toggle AI chat (agentic.nvim) |
| `<leader>wv` | Split vertically |
| `<leader>wh` | Split horizontally |
| `<leader>wz` | Zen mode |
| `<Tab>` / `<S-Tab>` | Next / previous buffer |

## Plugins

| Plugin | Purpose |
|---|---|
| [agentic.nvim](https://github.com/carlos-algms/agentic.nvim) | AI chat / code assistant |
| [blink.cmp](https://github.com/saghen/blink.cmp) | Completion |
| [catppuccin](https://github.com/catppuccin/nvim) | Colorscheme (Mocha) |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatting (format on save) |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Diff viewer (used by Neogit) |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git gutter signs |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indentation guides |
| [lazydev.nvim](https://github.com/folke/lazydev.nvim) | Neovim Lua API completions |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/tool installer |
| [mini.files](https://github.com/nvim-mini/mini.files) | File explorer |
| [neogit](https://github.com/NeogitOrg/neogit) | Git UI |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets/quotes |
| [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) | Auto-close and rename HTML tags |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting / parsing |
| [overseer.nvim](https://github.com/stevearc/overseer.nvim) | Task runner |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Rendered markdown in buffer |
| [roslyn.nvim](https://github.com/seblyng/roslyn.nvim) | C# LSP wrapper |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight TODO/FIXME comments |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Terminal manager |
| [vim-sleuth](https://github.com/tpope/vim-sleuth) | Auto-detect indentation |
| [vim-surround](https://github.com/tpope/vim-surround) | Surround motions |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap hints |
| [zen-mode.nvim](https://github.com/folke/zen-mode.nvim) | Distraction-free writing |
