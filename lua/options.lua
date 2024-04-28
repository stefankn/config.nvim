vim.api.nvim_exec("language en_US", true)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- hide command bar when inactive
vim.opt.cmdheight = 0
vim.opt.shortmess = {
    o = true,
}

-- default locations with splitting views
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Sync system clipboard with Neovim's clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 999

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

vim.opt.ignorecase = true

vim.opt.termguicolors = true

