vim.keymap.set("", "<leader>cf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "format buffer" })

vim.api.nvim_create_autocmd("BufWritePre", {
	once = true,
	callback = function(args)
		vim.pack.add({
			"https://github.com/stevearc/conform.nvim",
		})

		require("conform").setup({
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disable formatting for languages that don't have a well standardized
				-- coding style.
				local disable_filetypes = { c = true, cpp = true, razor = true }
				if disable_filetypes[vim.bo[bufnr].filetype] then
					return nil
				else
					return {
						timeout_ms = 500,
						lsp_format = "fallback",
					}
				end
			end,
			formatters_by_ft = {
				lua = { "stylua" },
			},
		})

		-- Manually format on this first save, since format_on_save
		-- wasn't registered when BufWritePre fired
		require("conform").format({ bufnr = args.buf, lsp_format = "fallback" })
	end,
})
