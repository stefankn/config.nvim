return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
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
