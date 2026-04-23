vim.pack.add({
	"https://github.com/stevearc/overseer.nvim",
})

require("overseer").setup()

-- Overseer opens its panel in insert mode by default; force normal mode instead.
vim.api.nvim_create_autocmd("FileType", {
	pattern = "OverseerList",
	callback = function()
		vim.cmd("stopinsert")
	end,
})

vim.api.nvim_create_user_command("DotnetBuild", function()
	require("overseer").run_task({ name = "dotnet build" })
	require("overseer").open()
end, {})

vim.api.nvim_create_user_command("DotnetRun", function()
	require("overseer").run_task({ name = "dotnet run" })
	require("overseer").open()
end, {})

vim.keymap.set("n", "<leader>tt", "<cmd>OverseerToggle<cr>", { desc = "toggle task" })
vim.keymap.set("n", "<leader>tb", "<cmd>DotnetBuild<cr>", { desc = "dotnet build" })
vim.keymap.set("n", "<leader>tr", "<cmd>DotnetRun<cr>", { desc = "dotnet run" })
