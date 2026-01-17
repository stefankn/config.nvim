-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "highlight when yanking text",
	group = vim.api.nvim_create_augroup("nvim-config-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Show LSP clients attached to the buffer
vim.api.nvim_create_user_command("LspClient", function()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		print("No LSP clients attached to this buffer")
	else
		for _, client in ipairs(clients) do
			print(string.format("Client: %s (id: %d)", client.name, client.id))
		end
	end
end, {})
