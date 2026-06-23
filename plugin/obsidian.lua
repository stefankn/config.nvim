vim.pack.add({
	{
		src = "https://github.com/obsidian-nvim/obsidian.nvim",
		version = vim.version.range("*"), -- use latest release, remove to use latest commit
	},
})

require("obsidian").setup({
	legacy_commands = false, --this will be removed in 4.0.0
	workspaces = {
		{
			name = "vault",
			path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault",
		},
	},
	picker = {
		name = "telescope.nvim",
	},
	ui = {
		ignore_conceal_warn = true,
	},
})

vim.keymap.set("n", "<leader>oo", "<cmd>Obsidian quick_switch<cr>", { desc = "open note" })
vim.keymap.set("n", "<leader>od", "<cmd>Obsidian dailies<cr>", { desc = "open daily note" })
vim.keymap.set("n", "<leader>on", "<cmd>Obsidian new<cr>", { desc = "create new note" })
vim.keymap.set("n", "<leader>of", "<cmd>Obsidian follow_link<cr>", { desc = "follow link" })
vim.keymap.set("n", "<leader>ob", "<cmd>Obsidian backlinks<cr>", { desc = "view backlinks" })
vim.keymap.set("n", "<leader>ot", "<cmd>Obsidian toc<cr>", { desc = "view table of contents" })
