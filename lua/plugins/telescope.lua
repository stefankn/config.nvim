return {
	'nvim-telescope/telescope.nvim',
	event = 'VimEnter',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
		{ 'nvim-telescope/telescope-ui-select.nvim' },
		{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
	},
	config = function()
		require('telescope').setup {
			extensions = {
				['ui-select'] = {
					require('telescope.themes').get_dropdown(),
				},
			},
		}

		pcall(require('telescope').load_extension, 'fzf')
		pcall(require('telescope').load_extension, 'ui-select')

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "search help" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "search keymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "search files" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "search by grep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "search diagnostics" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "search buffers" })

		vim.keymap.set("n", "<leader>r", builtin.oldfiles, { desc = "recent files" })

		vim.keymap.set("n", "<leader>bl", builtin.buffers, { desc = "list buffers" })
		vim.keymap.set("n", "<leader>ds", builtin.diagnostics, { desc = "search diagnostics" })
	end,
}
