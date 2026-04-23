vim.pack.add({
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

require("mason").setup({
	registries = {
		"github:mason-org/mason-registry",
		"github:Crashdummyy/mason-registry", -- Includes Roslyn for C#
	},
})

vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

require("mason-tool-installer").setup({
	ensure_installed = {
		"lua-language-server",
		"stylua",
		"docker-compose-language-service",
		"dockerfile-language-server",
	},
})
