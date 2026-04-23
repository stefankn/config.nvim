vim.pack.add({
	"https://github.com/folke/which-key.nvim",
})

local wk = require("which-key")
wk.setup()

wk.add({
	{
		mode = { "n", "v" },
		{ "<leader>a", group = "ai" },
		{ "<leader>b", group = "buffers" },
		{ "<leader>c", group = "code" },
		{ "<leader>d", group = "diagnostics" },
		{ "<leader>g", group = "git" },
		{ "<leader>p", group = "projects" },
		{ "<leader>f", group = "find" },
		{ "<leader>s", group = "select" },
		{ "<leader>t", group = "tasks" },
		{ "<leader>w", group = "windows" },
	},
})
