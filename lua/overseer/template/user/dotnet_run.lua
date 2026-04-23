local function find_project_file()
	local bufname = vim.api.nvim_buf_get_name(0)
	local dir = vim.fn.fnamemodify(bufname, ":h")
	if dir == "" or dir == "." then
		dir = vim.fn.getcwd()
	end
	-- Walk up directories looking for a .csproj
	local current = dir
	while true do
		local matches = vim.fn.glob(current .. "/*.csproj", false, true) --[[@as string[] ]]
		if #matches > 0 then
			return matches[1]
		end
		local parent = vim.fn.fnamemodify(current, ":h")
		if parent == current then
			break
		end
		current = parent
	end
	return nil
end

return {
	name = "dotnet run",
	builder = function()
		local project = find_project_file()
		local cmd = { "dotnet", "run" }
		if project then
			vim.list_extend(cmd, { "--project", project })
		end
		return {
			cmd = cmd,
			components = {
				{ "on_output_quickfix", set_diagnostics = true },
				"on_result_diagnostics",
				"default",
			},
		}
	end,
	condition = {
		filetype = { "cs", "razor", "csproj", "css", "js", "sln" },
	},
}
