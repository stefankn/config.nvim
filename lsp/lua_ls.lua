return {
	cmd = {
		"lua-language-server",
	},
	filetypes = {
		"lua",
	},
	root_markers = {
		".git",
		".luacheckrc",
		".luarc.json",
		".luarc.jsonc",
		".stylua.toml",
		"selene.toml",
		"selene.yml",
		"stylua.toml",
	},
	settings = {
		Lua = {
			runtime = {
				version = "LuaJit",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = {
					vim.env.VIMRUNTIME,
				},
				checkThirdParty = false,
			},
			completion = {
				callSnippet = "Replace",
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
