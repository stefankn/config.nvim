return {
	"seblj/roslyn.nvim",
	config = function()
		require("roslyn").setup({
			exe = {
				"dotnet",
				vim.fn.stdpath("data") .. "/mason/packages/roslyn/libexec/Microsoft.CodeAnalysis.LanguageServer.dll",
			},
			config = {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			},
		})
	end,
}
