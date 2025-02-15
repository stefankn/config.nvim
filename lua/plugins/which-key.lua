return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500

			local wk = require("which-key")
			wk.setup()

			wk.add({
				{
					mode = { "n", "v" },
					{ "<leader>a", group = "ai" },
					{ "<leader>b", group = "buffers" },
					{ "<leader>c", group = "code" },
					{ "<leader>d", group = "diagnostics" },
					{ "<leader>s", group = "search" },
					{ "<leader>w", group = "windows" },
				},
			})
		end,
	},
}
