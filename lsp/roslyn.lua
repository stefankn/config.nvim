local mason_root = vim.fn.stdpath("data") .. "/mason"
local rzls_path = vim.fn.expand(mason_root .. "/packages/roslyn/libexec/.razorExtension")

return {
	cmd = {
		"roslyn",
		"--stdio",
		"--logLevel=Information",
		"--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.log.get_filename()),
		"--razorSourceGenerator=" .. vim.fs.joinpath(rzls_path, "Microsoft.CodeAnalysis.Razor.Compiler.dll"),
		"--razorDesignTimePath=" .. vim.fs.joinpath(rzls_path, "Targets", "Microsoft.NET.Sdk.Razor.DesignTime.targets"),
		"--extension=" .. vim.fs.joinpath(rzls_path, "Microsoft.VisualStudioCode.RazorExtension.dll"),
	},
	filetypes = {
		"cs",
		"razor",
	},
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		local root = vim.fs.root(bufnr, function(name, _)
			return name:match("%.sln$") or name:match("%.csproj$") or name == ".git"
		end)
		on_dir(root or vim.fs.dirname(fname))
	end,
}
