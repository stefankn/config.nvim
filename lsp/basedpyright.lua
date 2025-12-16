return {
	cmd = {
		"basedpyright-langserver", "--stdio"
	},
	filetypes = {
		"python"
	},
	settings = {
		basedpyright = {
			analysis = {
				diagnosticMode = "openFilesOnly",
				typeCheckingMode = "standard",
				useLibraryCodeForTypes = true,
				diagnosticSeverityOverrides = {
					reportCallIssue = "none",
					reportArgumentType = "none",
				},
			},
		},
	},
}
