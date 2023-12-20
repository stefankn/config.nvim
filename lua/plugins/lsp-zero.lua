-- lsp zero configuration
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.nvim_workspace() -- configure lua language server
lsp.setup()
