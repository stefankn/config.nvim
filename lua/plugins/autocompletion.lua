return {
	"saghen/blink.cmp",
	event = "VimEnter",
	version = "1.*",
	dependencies = {
		-- Snippet engine
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = (function()
				-- Needed for regex support in snippets
				return "make install_jsregexp"
			end)(),
			opts = {},
		},
		"folke/lazydev.nvim",
	},
	opts = {
		keymap = {
			preset = "enter",
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			-- Use `<C-Space>` to show the documentation
			documentation = { auto_show = false, auto_show_delay_ms = 500 },
		},
		sources = {
			default = { "lsp", "path", "snippets", "lazydev" },
			providers = {
				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
			},
		},
		snippets = { preset = "luasnip" },
		fuzzy = { implementation = "lua" },
		signature = { enabled = true },
	},
}
