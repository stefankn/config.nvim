-- Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Nerd font needs to be installed
vim.g.have_nerd_font = true

-- Enabled line numbers by default
vim.opt.number = true
vim.opt.relativenumber = true

-- Don't show the mode, is already visible in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable mouse mode
vim.opt.mouse = "a"

-- Insert n spaces for a tab
vim.opt.tabstop = 4

-- number of spaces inserted for each indentation
vim.opt.shiftwidth = 4

-- Case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable special column to display visual indicators
vim.opt.signcolumn = "yes"

-- Decrease screen update time
vim.opt.updatetime = 250

-- Set timeout for operations like autocompletion or searching
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Display visual indicators for whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live
vim.opt.inccommand = "split"

-- Show cursor line
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Raise alert dialog when performing an operation that fails
vim.opt.confirm = true
