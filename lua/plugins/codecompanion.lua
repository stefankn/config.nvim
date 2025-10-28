return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("codecompanion").setup({
			adapters = {
				http = {
					ollama = function()
						return require("codecompanion.adapters").extend("ollama", {
							schema = {
								model = {
									default = "gpt-oss:latest",
								},
							},
						})
					end,
					anthropic = function()
						return require("codecompanion.adapters").extend("anthropic", {
							env = {
								api_key = "cmd:op read op://personal/Claude/credential --no-newline",
							},
						})
					end,
				},
			},
			strategies = {
				chat = {
					adapter = "anthropic",
				},
				inline = {
					adapter = "anthropic",
				},
				agent = {
					adapter = "anthropic",
				},
			},
		})

		vim.keymap.set("n", "<leader>ac", ":CodeCompanionChat Toggle<CR>", { desc = "toggle chat window" })
		vim.keymap.set("v", "<leader>ae", ":CodeCompanion /explain<CR>", { desc = "explain selected code" })
		vim.keymap.set("v", "<leader>af", ":CodeCompanion /fix<CR>", { desc = "fix selected code" })
	end,
}
