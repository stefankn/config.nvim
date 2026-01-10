return {
	"carlos-algms/agentic.nvim",
	opts = {
		provider = "claude-acp",
	},
	keys = {
		{
			"<C-a>", -- Control+A key combination
			function()
				require("agentic").toggle() -- Toggle the AI chat interface
			end,
			mode = { "n", "v", "i" }, -- Available in Normal, Visual, and Insert modes
			desc = "Toggle AI chat", -- Description shown in which-key and :map
		},
	},
}

