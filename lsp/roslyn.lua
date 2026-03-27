local mason_root = require("mason.settings").current.install_root_dir
local rzls_path = vim.fn.expand(mason_root .. "/packages/roslyn/libexec/.razorExtension")

return {
	cmd = {
		"roslyn",
		"--stdio",
		"--logLevel=Information",
		"--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
		"--razorSourceGenerator=" .. vim.fs.joinpath(rzls_path, "Microsfto.CodeAnalysis.Razor.Compiler.dll"),
		"--razorDesignTimePath=" .. vim.fs.joinpath(rzls_path, "Targets", "Microsoft.NET.Sdk.Razor.DesignTime.targets"),
		"--extension=" .. vim.fs.joinpath(rzls_path, "Microsoft.VisualStudioCode.RazorExtension.dll"),
	},
	filetypes = {
		"cs",
		"razor",
	},
}
