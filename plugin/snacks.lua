vim.pack.add({
	"https://github.com/folke/snacks.nvim",
})

require("snacks").setup({
	dashboard = {
		enabled = true,
		sections = {
			{
				section = "terminal",
				cmd = "chafa $(ls ~/.config/nvim/assets/*.png | shuf -n1) --format symbols --size 40x15; sleep .1",
				random = 11,
				height = 15,
			},
			{
				icon = " ",
				title = "Recent Files",
				pane = 2,
				section = "recent_files",
				indent = 2,
			},
			{ section = "keys", pane = 2, padding = { 0, 2 } },
		},
	},
	image = {
		resolve = function(path, src)
			local api = require("obsidian.api")
			if api.path_is_note(path) then
				return api.resolve_attachment_path(src)
			end
		end,
	},
})
