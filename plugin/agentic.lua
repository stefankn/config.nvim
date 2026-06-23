vim.pack.add({
	"https://github.com/carlos-algms/agentic.nvim",
})

require("agentic").setup({
	provider = "claude-agent-acp",
	hooks = {
		on_session_update = function(data)
			if data.update.sessionUpdate == "usage_update" then
				if vim.api.nvim_tabpage_is_valid(data.tab_page_id) then
					vim.t[data.tab_page_id].agentic_usage = {
						used = data.update.used,
						size = data.update.size,
					}
				end
			end
		end,
	},
	headers = {
		chat = function(parts)
			local usage = vim.t[vim.api.nvim_get_current_tabpage()].agentic_usage
			local context = usage
				and string.format("%d / %d tokens (%.0f%%%%)", usage.used, usage.size, usage.used / usage.size * 100)
				or nil
			local segments = { parts.title }
			if context then
				table.insert(segments, context)
			end
			if parts.suffix then
				table.insert(segments, parts.suffix)
			end
			return table.concat(segments, " | ")
		end,
	},
	keymaps = {
		widget = {
			change_mode = {
				{
					"<C-l>",
					mode = { "n", "i", "v" },
				},
			},
		},
	},
	diff_preview = {
		enabled = true,
		layout = "split",
		center_on_navigate_hunks = true,
	},
})

vim.api.nvim_set_hl(0, "AgenticTitle", { fg = "#e08060", bg = "#242320" })

vim.keymap.set("n", "<leader>at", function()
	require("agentic").toggle()
end, { desc = "toggle chat" })

vim.keymap.set({ "n", "v", "i" }, "<C-a>", function()
	require("agentic").toggle()
end, { desc = "toggle chat" })

vim.keymap.set("n", "<leader>ad", function()
	require("agentic").add_current_line_diagnostics()
end, { desc = "add diagnostic for current line" })

vim.keymap.set("n", "<leader>aD", function()
	require("agentic").add_buffer_diagnostics()
end, { desc = "add all diagnostics" })

vim.keymap.set("n", "<leader>ap", function()
	require("agentic").switch_provider()
end, { desc = "switch provider" })

vim.keymap.set("n", "<leader>ar", function()
	require("agentic").restore_session()
end, { desc = "restore session" })

vim.keymap.set("n", "<leader>an", function()
	require("agentic").new_session()
end, { desc = "new session" })
