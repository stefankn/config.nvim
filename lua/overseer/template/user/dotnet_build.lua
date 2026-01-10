return {
	name = "dotnet build",
	builder = function()
		return {
			cmd = { "dotnet", "build" },
			components = {
				{ "on_output_quickfix", open = false },
				"default",
			},
		}
	end,
}
