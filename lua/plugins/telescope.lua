return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
			defaults = {
				file_ignore_patterns = { "%__virtual.cs$" },
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "find help" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "find keymaps" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "find by grep" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "diagnostics" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "find buffers" })

		vim.keymap.set("n", "<leader>r", builtin.oldfiles, { desc = "recent files" })

		vim.keymap.set("n", "<leader>bl", builtin.buffers, { desc = "list buffers" })
		vim.keymap.set("n", "<leader>ds", builtin.diagnostics, { desc = "find diagnostics" })
	end,
}
