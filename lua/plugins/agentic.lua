return {
	"carlos-algms/agentic.nvim",
	opts = {
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
			layout = "inline",
			center_on_navigate_hunks = true,
		},
	},
	keys = {
		{
			"<leader>at",
			function()
				require("agentic").toggle()
			end,
			desc = "toggle chat",
			mode = { "n" },
		},
		{
			"<C-a>",
			function()
				require("agentic").toggle()
			end,
			desc = "toggle chat",
			mode = { "n", "v", "i" },
		},
		{
			"<leader>ad",
			function()
				require("agentic").add_current_line_diagnostics()
			end,
			desc = "add diagnostic for current line",
			mode = { "n" },
		},
		{
			"<leader>aD",
			function()
				require("agentic").add_buffer_diagnostics()
			end,
			desc = "add all diagnostics",
			mode = { "n" },
		},
		{
			"<leader>ap",
			function()
				require("agentic").switch_provider()
			end,
			desc = "switch provider",
			mode = { "n" },
		},
		{
			"<leader>ar",
			function()
				require("agentic").restore_session()
			end,
			desc = "restore session",
			mode = { "n" },
		},
		{
			"<leader>an",
			function()
				require("agentic").new_session()
			end,
			desc = "new session",
			mode = { "n" },
		},
	},
}
