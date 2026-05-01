-- External tool dependencies:
--
-- brew install xcp xcode-build-server xcbeautify pipx rg jq coreutils
-- pipx install pymobiledevice3
--
-- Configure it for a project:
-- Open project and run :XcodebuildSetup

vim.pack.add({
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/folke/snacks.nvim", -- used for previews

	"https://github.com/wojciech-kulik/xcodebuild.nvim",
})

require("xcodebuild").setup()

vim.keymap.set("n", "<leader>xx", "<cmd>XcodebuildPicker<cr>", { desc = "xcodebuild actions" })
vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildProjectManager<cr>", { desc = "project manager actions" })

vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "build project" })
vim.keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "build and run project" })
vim.keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "run tests" })
vim.keymap.set("v", "<leader>xt", "<cmd>XcodebuildTestSelected<cr>", { desc = "run selected test" })
vim.keymap.set("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "run current test class" })
vim.keymap.set("n", "<leader>x.", "<cmd>XcodebuildTestRepeat<cr>", { desc = "repeat last test run" })

vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "toggle logs" })
vim.keymap.set("n", "<leader>xe", "<cmd>XcodebuildTestExplorerToggle<cr>", { desc = "toggle test explorer" })

vim.keymap.set("n", "<leader>xg", "<cmd>XcodebuildPreviewGenerateAndShow<cr>", { desc = "generate preview" })
vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildPreviewToggle<cr>", { desc = "toggle preview" })

vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "select device" })

vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "show quickfix list" })

vim.keymap.set("n", "<leader>xa", "<cmd>XcodebuildCodeActions<cr>", { desc = "show code actions" })

local term = require("toggleterm.terminal").Terminal
local cmd = term:new({
	cmd = "tail -f .nvim/xcodebuild/app_logs.log",
	hidden = true,
	on_open = function()
		vim.cmd("wincmd p") -- return focus to the previous window
	end,
})
vim.keymap.set("n", "<leader>xc", function()
	cmd:toggle()
end, { desc = "show console" })
