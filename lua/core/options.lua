local opt = vim.opt

-- Font
opt.guifont = { "Victor Mono", "h18" }

opt.conceallevel = 2

-- Tab set to two spaces
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.autoindent = true
opt.expandtab = true

-- Clipboard
-- Synchronizes the system clipboard with Neovim's clipboard
opt.clipboard = "unnamedplus"

-- When using visual block mode, allow free cursor movement
opt.virtualedit = "block"

-- When doing a search/replace, open the preview in a split window
opt.inccommand = "split"

-- Ignore case when autocompleting vim commands
opt.ignorecase = true

-- line wrapping
opt.wrap = false

-- hide command bar when inactive
opt.cmdheight = 0

-- search
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = 'dark'
opt.signcolumn = 'yes'

-- line numbers
opt.number = true
opt.relativenumber = true

-- split windows
opt.splitright = true
opt.splitbelow = true

-- scrolling
opt.scrolloff = 999

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Local leader key
vim.g.maplocalleader = ','
