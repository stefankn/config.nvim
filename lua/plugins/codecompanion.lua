return {
	"olimorris/codecompanion.nvim",
	version = "v17.33.0",
	pin = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("codecompanion").setup({
			display = {
				chat = {
					show_reasoning = false,
					fold_reasoning = false,
				},
			},
			adapters = {
				acp = {
					claude_code = function()
						return require("codecompanion.adapters").extend("claude_code", {
							env = {
								CLAUDE_CODE_OAUTH_TOKEN = "cmd:op read op://personal/Claude/claude_code_oauth_token --no-newline",
							},
						})
					end,
				},
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
					adapter = "claude_code",
				},
				inline = {
					adapter = "claude_code",
				},
				agent = {
					adapter = "claude_code",
				},
			},
		})

		vim.keymap.set("n", "<leader>ac", ":CodeCompanionChat Toggle<CR>", { desc = "toggle chat window" })
		vim.keymap.set("v", "<leader>ae", ":CodeCompanion /explain<CR>", { desc = "explain selected code" })
		vim.keymap.set("v", "<leader>af", ":CodeCompanion /fix<CR>", { desc = "fix selected code" })
	end,
}
