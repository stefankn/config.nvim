-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "highlight when yanking text",
	group = vim.api.nvim_create_augroup("nvim-config-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Automatically switch to terminal when a terminal buffer becomes active
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if vim.bo.buftype == "terminal" then
			vim.cmd("startinsert")
		end
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

vim.api.nvim_create_user_command("DotnetBuild", function()
	local overseer = require("overseer")
	overseer.run_task({ name = "dotnet build", autostart = false }, function(task)
		if task then
			task:start()
			overseer.open()
			vim.cmd("stopinsert")
		else
			vim.notify("DotnetBuild not supported for filetype " .. vim.bo.filetype, vim.log.levels.ERROR)
		end
	end)
end, {})

vim.api.nvim_create_user_command("DotnetRun", function()
	local overseer = require("overseer")
	overseer.run_task({ name = "dotnet run", autostart = false }, function(task)
		if task then
			task:start()
			overseer.open()
			vim.cmd("stopinsert")
		else
			vim.notify("DotnetRun not supported for filetype " .. vim.bo.filetype, vim.log.levels.ERROR)
		end
	end)
end, {})
