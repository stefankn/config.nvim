vim.pack.add({
	"https://github.com/folke/lazydev.nvim",
	"https://github.com/saghen/blink.cmp",
})

require("blink.cmp").setup({
	keymap = {
		preset = "enter",
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		documentation = {
			auto_show = false,
			auto_show_delay_ms = 500,
		},
	},
	sources = {
		default = { "lsp", "path", "snippets", "lazydev" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
		},
	},
	fuzzy = { implementation = "lua" },
	signature = {
		enabled = true,
	},
})
