return {
	name = "dotnet build",
	builder = function()
		return {
			cmd = { "dotnet", "build" },
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
