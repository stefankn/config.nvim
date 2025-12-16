return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry", -- Includes Roslyn for C#
				},
			})

			vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"lua-language-server",
					"stylua",
					"basedpyright",
					"docker-compose-language-service",
					"dockerfile-language-server",
				},
			})
		end,
	},
}
