require("core.options")
require("core.keymaps")
require("core.autocommands")

-- Install lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Detect tabstop and shiftwidth automatically
	require("plugins.vim-sleuth"),
	-- Adds git related signs to the gutter
	require("plugins.gitsigns"),
	-- Show pending keybindings
	require("plugins.which-key"),
	-- Fuzzy finder
	require("plugins.telescope"),
	-- File explorer
	require("plugins/neotree"),
	-- Completions, annotations and signatures of Neovim apis
	require("plugins.lazydev"),
	-- Language server support
	require("plugins.lsp"),
	-- Autoformatting
	require("plugins.autoformat"),
	-- Autocompletion
	require("plugins.autocompletion"),
	-- Color theme
	require("plugins.colorscheme"),
	-- Highlight TODO, notes and comments
	require("plugins/todo-comments"),
	-- Indent blank lines
	require("plugins/indent-blankline"),
	-- Status line
	require("plugins/lualine"),
	-- Treesitter
	require("plugins/treesitter"),
	-- AI
	require("plugins/codecompanion"),
	-- Show colors
	require("plugins/colorizer"),
	-- Auto close pairs
	require("plugins/autopairs"),
	-- Terminal
	require("plugins/toggleterm"),
	-- Markdown rendering
	require("plugins/render-markdown"),
	-- C# LSP interaction
	require("plugins/roslyn"),
})
