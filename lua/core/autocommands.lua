-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'highlight when yanking text',
	group = vim.api.nvim_create_augroup('nvim-config-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
