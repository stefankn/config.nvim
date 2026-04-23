local function build_fzf_native(path)
	vim.system({ "make", "-C", path }, {
		on_stdout = function(_, data) if data then print(data) end end,
		on_stderr = function(_, data) if data then print("ERR:", data) end end,
		on_exit = function(_, code)
			if code == 0 then
				print("telescope-fzf-native.nvim built successfully!")
			else
				print("Failed to build telescope-fzf-native.nvim")
			end
		end
	}):wait()
end

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
			if not ev.data.active then
				vim.cmd.packadd("telescope-fzf-native.nvim")
			end
			build_fzf_native(ev.data.path)
		end
	end
})

vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
})

local fzf_info = vim.pack.get({ "telescope-fzf-native.nvim" })
if fzf_info[1] and vim.fn.filereadable(fzf_info[1].path .. "/build/libfzf.so") == 0 then
	build_fzf_native(fzf_info[1].path)
end

local ts = require("telescope")
ts.setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
	defaults = {
		file_ignore_patterns = { "%__virtual.cs$" },
	},
})

ts.load_extension("fzf")
ts.load_extension("ui-select")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "find help" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "find keymaps" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "find by grep" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "diagnostics" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "find buffers" })

vim.keymap.set("n", "<leader>r", builtin.oldfiles, { desc = "recent files" })

vim.keymap.set("n", "<leader>bl", builtin.buffers, { desc = "list buffers" })
vim.keymap.set("n", "<leader>ds", builtin.diagnostics, { desc = "find diagnostics" })
