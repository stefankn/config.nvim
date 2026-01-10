return {
	name = "dotnet run",
	builder = function()
		return {
			cmd = { "dotnet", "run" },
			components = { "default" },
		}
	end,
}
