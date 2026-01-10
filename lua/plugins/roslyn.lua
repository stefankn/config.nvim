return {
	{
		"seblyng/roslyn.nvim",
		ft = "cs",
		config = function()
			require("roslyn").setup({
				on_attach = function(client, bufnr) end,
			})
		end,
	},
}
