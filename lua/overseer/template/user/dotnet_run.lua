return {
	name = "dotnet run",
	builder = function()
		return {
			cmd = { "dotnet", "run" },
			components = {
				{ "on_output_quickfix", set_diagnostics = true },
				"on_result_diagnostics",
				"default",
			},
		}
	end,
	condition = {
		filetype = { "cs", "razor", "csproj" },
	},
}
