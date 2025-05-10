return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("codecompanion").setup({
			adapters = {
				ollama = function()
					return require("codecompanion.adapters").extend("ollama", {
						schema = {
							model = {
								default = "gemma3:12b",
							},
						},
					})
				end,
			},
			strategies = {
				chat = {
					adapter = "ollama",
				},
				inline = {
					adapter = "ollama",
				},
				agent = {
					adapter = "ollama",
				},
			},
		})

		vim.keymap.set("n", "<leader>ac", ":CodeCompanionChat Toggle<CR>", { desc = "toggle chat window" })
		vim.keymap.set("v", "<leader>ae", ":CodeCompanion /explain<CR>", { desc = "explain selected code" })
		vim.keymap.set("v", "<leader>af", ":CodeCompanion /fix<CR>", { desc = "fix selected code" })
	end,
}
