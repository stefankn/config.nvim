return {
	{
		"stevearc/overseer.nvim",
		config = function()
			require("overseer").setup()

			vim.keymap.set("n", "<leader>pt", "<cmd>OverseerToggle<cr>", { desc = "toggle tasks panel" })
			vim.keymap.set("n", "<leader>pr", "<cmd>OverseerRun<cr>", { desc = "run task" })
		end,
	},
}
