return {
	"stevearc/overseer.nvim",
	config = function()
		require("overseer").setup()

		vim.keymap.set("n", "<leader>tt", "<cmd>OverseerToggle<cr>", { desc = "toggle task list" })
		vim.keymap.set("n", "<leader>tb", "<cmd>DotnetBuild<cr>", { desc = "dotnet build" })
		vim.keymap.set("n", "<leader>tr", "<cmd>DotnetRun<cr>", { desc = "dotnet run" })
	end,
}
