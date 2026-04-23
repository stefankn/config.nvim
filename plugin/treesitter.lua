vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.name == "nvim-treesitter" and ev.data.kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end

			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
		version = "main",
	},
	"https://github.com/MeanderingProgrammer/treesitter-modules.nvim",
})

require("nvim-treesitter-textobjects").setup({
	select = {
		enable = true,
		lookahead = true,
		selection_modes = {
			["@parameter.outer"] = "v",
			["@function.outer"] = "V",
			["@class.outer"] = "<c-v>",
		},
		include_surrounding_whitespace = true,
	},
})

local select = require("nvim-treesitter-textobjects.select").select_textobject
vim.keymap.set({ "x", "o" }, "af", function()
	select("@function.outer", "textobjects")
end, { desc = "outer function" })
vim.keymap.set({ "x", "o" }, "if", function()
	select("@function.inner", "textobjects")
end, { desc = "inner function" })
vim.keymap.set({ "x", "o" }, "ac", function()
	select("@class.outer", "textobjects")
end, { desc = "outer class" })
vim.keymap.set({ "x", "o" }, "ic", function()
	select("@class.inner", "textobjects")
end, { desc = "inner class" })
vim.keymap.set({ "x", "o" }, "as", function()
	select("@local.scope", "locals")
end, { desc = "local scope" })

require("treesitter-modules").setup({
	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<Leader>ss",
			node_incremental = "<Leader>si",
			scope_incremental = "<Leader>sc",
			node_decremental = "<Leader>sd",
		},
	},
})
