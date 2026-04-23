vim.pack.add({
	"https://github.com/carlos-algms/agentic.nvim",
})

require("agentic").setup({
	provider = "claude-agent-acp",
	keymaps = {
		widget = {
			change_mode = {
				{
					"<C-l>",
					mode = { "n", "i", "v" },
				},
			},
		},
	},
	diff_preview = {
		enabled = true,
		layout = "split",
		center_on_navigate_hunks = true,
	},
})

vim.keymap.set("n", "<leader>at", function()
	require("agentic").toggle()
end, { desc = "toggle chat" })

vim.keymap.set({ "n", "v", "i" }, "<C-a>", function()
	require("agentic").toggle()
end, { desc = "toggle chat" })

vim.keymap.set("n", "<leader>ad", function()
	require("agentic").add_current_line_diagnostics()
end, { desc = "add diagnostic for current line" })

vim.keymap.set("n", "<leader>aD", function()
	require("agentic").add_buffer_diagnostics()
end, { desc = "add all diagnostics" })

vim.keymap.set("n", "<leader>ap", function()
	require("agentic").switch_provider()
end, { desc = "switch provider" })

vim.keymap.set("n", "<leader>ar", function()
	require("agentic").restore_session()
end, { desc = "restore session" })

vim.keymap.set("n", "<leader>an", function()
	require("agentic").new_session()
end, { desc = "new session" })
