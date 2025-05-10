return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				filesystem = {
					follow_current_file = {
						enabled = true,
					},
					use_libuv_file_watcher = true,
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = false,
					},
				},
			})
			vim.keymap.set(
				"n",
				"<leader>e",
				":Neotree toggle position=left<CR>",
				{ noremap = true, silent = true, desc = "toggle file explorer" }
			)
		end,
	},
}
