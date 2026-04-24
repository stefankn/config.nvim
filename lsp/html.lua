return {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html" },
	root_markers = { ".git" },
	settings = {},
	init_options = {
		provideFormatter = true,
	},
}
