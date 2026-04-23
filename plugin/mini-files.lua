vim.pack.add({
	"https://github.com/nvim-mini/mini.files",
})

local minifiles = require("mini.files")
minifiles.setup({
	windows = {
		preview = false,
		width_focus = 50,
	},
})

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		vim.keymap.set("n", "L", function()
			local entry = minifiles.get_fs_entry()
			if entry and entry.fs_type == "file" then
				minifiles.close()
				vim.cmd("vsplit " .. vim.fn.fnameescape(entry.path))
			end
		end, { buffer = args.data.buf_id, desc = "open in vertical split" })
		vim.keymap.set("n", "l", function()
			local entry = minifiles.get_fs_entry()
			if entry and entry.fs_type == "file" then
				minifiles.close()
				vim.cmd("edit " .. vim.fn.fnameescape(entry.path))
			else
				minifiles.go_in()
			end
		end, { buffer = args.data.buf_id, desc = "open file or enter directory" })
	end,
})

vim.keymap.set("n", "<leader>e", function()
	if not minifiles.close() then
		minifiles.open()
	end
end, { desc = "toggle file explorer" })
