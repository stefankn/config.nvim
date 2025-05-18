return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs and related tools
		-- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
		{ "williamboman/mason.nvim", opts = {} },
		{
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		-- Useful status updates for LSP
		{ "j-hui/fidget.nvim", opts = {} },
		-- Autocompletion
		"saghen/blink.cmp",
	},
	config = function()
		-- This function runs when an LSP attaches to a particular buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("nvim-config-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
				end

				-- Jump to the definition of the word under your cursor.
				--  This is where a variable was first declared, or where a function is defined, etc.
				--  To jump back, press <C-t>.
				map("<leader>cd", require("telescope.builtin").lsp_definitions, "go to definition")

				-- Find references for the word under your cursor.
				map("<leader>cr", require("telescope.builtin").lsp_references, "list references")

				-- Jump to the implementation of the word under your cursor.
				--  Useful when your language has ways of declaring types without an actual implementation.
				map("<leader>ci", require("telescope.builtin").lsp_implementations, "go to implementation")

				-- Jump to the type of the word under your cursor.
				--  Useful when you're not sure what type a variable is and you want to see
				--  the definition of its *type*, not where it was *defined*.
				map("<leader>ct", require("telescope.builtin").lsp_type_definitions, "type definition")

				-- Fuzzy find all the symbols in your current document.
				--  Symbols are things like variables, functions, types, etc.
				map("<leader>cs", require("telescope.builtin").lsp_document_symbols, "list document symbols")

				-- Fuzzy find all the symbols in your current workspace.
				--  Similar to document symbols, except searches over your entire project.
				map("<leader>cw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "list workspace symbols")

				-- Rename the variable under your cursor.
				--  Most Language Servers support renaming across files, etc.
				map("<leader>cn", vim.lsp.buf.rename, "rename")

				-- Execute a code action, usually your cursor needs to be on top of an error
				-- or a suggestion from your LSP for this to activate.
				map("<leader>ca", vim.lsp.buf.code_action, "code action", { "n", "x" })
			end,
		})

		-- LSP servers and clients are able to communicate to each other what features they support.
		-- By default, Neovim doesn't support everything that is in the LSP specification.
		-- By adding blink.cmp, luasnip etc., Neovim now has more capabilities.
		-- New capabilities are created with blink.cmp and broadcasted to the servers.
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- Enable the following language servers
		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
			dockerls = {},
			docker_compose_language_service = {},
			omnisharp = {},
			pylsp = {
				settings = {
					pylsp = {
						plugins = {
							pyflakes = { enabled = false },
							pycodestyle = { enabled = false },
							autopep8 = { enabled = false },
							yapf = { enabled = false },
							mccabe = { enabled = false },
							pylsp_mypy = { enabled = false },
							pylsp_black = { enabled = false },
							pylsp_isort = { enabled = false },
						},
					},
				},
			},
		}

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format Lua code
		})

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			ensure_installed = {}, -- Populated by mason-tool-installer
			automatic_installation = false,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
