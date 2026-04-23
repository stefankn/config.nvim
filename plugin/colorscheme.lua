vim.pack.add({
	"https://github.com/catppuccin/nvim",
})

require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
	float = {
		transparent = true,
		solid = false,
	},
})

vim.cmd.colorscheme("catppuccin")
