return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		config = function()
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
		end,
	},
	{
		"MeanderingProgrammer/treesitter-modules.nvim",
		config = function()
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
		end,
	},
}
