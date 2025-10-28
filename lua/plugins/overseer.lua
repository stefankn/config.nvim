return {
	{
		"stevearc/overseer.nvim",
		opts = {
			templates = { "builtin" },
			task_list = {
				min_width = { 0.35 },
			},
		},
		config = function(_, opts)
			local overseer = require("overseer")
			overseer.setup(opts)

			-- Register dotnet tasks
			overseer.register_template({
				name = "dotnet run",
				builder = function()
					return {
						cmd = { "dotnet", "run" },
						components = { "default" },
					}
				end,
				condition = {
					filetype = { "cs" },
				},
			})

			overseer.register_template({
				name = "dotnet build",
				builder = function()
					return {
						cmd = { "dotnet", "build" },
						components = { "default" },
					}
				end,
				condition = {
					filetype = { "cs" },
				},
			})

			overseer.register_template({
				name = "dotnet test",
				builder = function()
					return {
						cmd = { "dotnet", "test" },
						components = { "default" },
					}
				end,
				condition = {
					filetype = { "cs" },
				},
			})

			-- Keymaps
			vim.keymap.set("n", "<leader>tl", "<cmd>OverseerRun<cr>", { desc = "open task list" })
			vim.keymap.set("n", "<leader>tc", "<cmd>OverseerToggle<cr>", { desc = "toggle console" })
			vim.keymap.set("n", "<leader>ts", "<cmd>OverseerQuickAction dispose<cr>", { desc = "stop task" })
			vim.keymap.set("n", "<leader>tr", "<cmd>OverseerQuickAction restart<cr>", { desc = "restart task" })
			vim.keymap.set("n", "<leader>ta", "<cmd>OverseerTaskAction<cr>", { desc = "task actions" })

			vim.keymap.set("n", "<leader>td", function()
				local files = vim.fn.systemlist("find . -name '*.csproj' -not -path '*/obj/*'")
				vim.ui.select(files, { prompt = "Select project:" }, function(choice)
					if choice then
						local os = require("overseer")
						local task = os.new_task({
							cmd = { "dotnet", "run", "--project", choice },
							components = { "default" },
						})
						task:start()
					end
				end)
			end, { desc = "run dotnet project" })
		end,
	},
}
