return {
	cmd = {
		"clangd",
		"--background-index",
		"--query-driver="
			.. vim.fn.expand("~")
			.. "/.platformio/packages/toolchain-xtensa-esp-elf/bin/xtensa-esp*-elf-g++",
	},
	root_markers = {
		".clangd",
		"CMakeLists.txt",
		"compile_commands.json",
		"compile_flags.txt",
	},
	filetypes = {
		"c",
		"cpp",
	},
}
