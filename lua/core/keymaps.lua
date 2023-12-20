vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", {
    desc = "Toggle terminal"
})

keymap.set("n", "<leader>sv", "<C-w>v", {
  desc = "Split window vertically",
})

keymap.set("n", "<leader>ss", "<C-w>s", {
  desc = "Split window horizontally",
})

keymap.set("n", "<leader>sx", ":close<CR>", {
  desc = "Close current split window",
})

keymap.set("n", "<leader>sw", "<C-w>w", {
  desc = "Toggle between windows",
})

keymap.set("n", "<leader>sk", "<C-w>k", {
  desc = "Move to top window",
})

keymap.set("n", "<leader>sl", "<C-w>l", {
  desc = "Move to right window",
})

keymap.set("n", "<leader>sj", "<C-w>j", {
  desc = "Move to bottom window",
})

keymap.set("n", "<leader>sh", "<C-w>h", {
  desc = "Move to left window",
})

keymap.set("n", "<leader>e", ":Neotree<CR>", {
  desc = "Open Neotree",
})

keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", {
  desc = "Toggle maximize current split window",
})

keymap.set("n", "<leader>ac", "<cmd>ChatGPT<CR>", {
    desc = "Open ChatGPT",
})

keymap.set("n", "<leader>au", "<cmd>ChatGPTEditWithInstructions<CR>", {
    desc = "Use file contents with ChatGPT",
})

keymap.set("v", "<leader>au", "<cmd>ChatGPTEditWithInstructions<CR>", {
    desc = "Use selection with ChatGPT",
})

keymap.set("v", "<leader>ae", "<cmd>ChatGPTRun explain_code<CR>", {
    desc = "Explain selected code using ChatGPT",
})

keymap.set("v", "<leader>ad", "<cmd>ChatGPTRun docstring<CR>", {
    desc = "Create docstring",
})

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {
  desc = "Find files",
})

keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>", {
  desc = "List buffers",
})

keymap.set("n", "<leader>h", "<cmd>Telescope help_tags<CR>", {
  desc = "List help tags",
})

keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", {
  desc = "Recent files",
})

keymap.set("n", "<leader>fc", "<cmd>Telescope command_history<CR>", {
  desc = "Command history",
})

keymap.set("n", "<leader>cr", "<cmd>Telescope lsp_references<CR>", {
  desc = "List references for entry under cursor",
})

keymap.set("n", "<leader>cc", "<cmd>Telescope lsp_incoming_calls<CR>", {
  desc = "List incoming calls for entry under cursor",
})

keymap.set("n", "<leader>cd", "<cmd>Telescope lsp_document_symbols<CR>", {
  desc = "List document symbols",
})

keymap.set("n", "<leader>cw", "<cmd>Telescope lsp_workspace_symbols<CR>", {
  desc = "List workspace symbols",
})

keymap.set("n", "<leader>cd", vim.lsp.buf.definition, {
    desc = "Go to definition",
})

keymap.set("n", "<leader>ct", "<cmd>TroubleToggle<CR>", {
    desc = "Toggle Trouble panel",
})

keymap.set("n", "<leader>cge", "<cmd>GoIfErr<CR>", {
  desc = "Insert Go error check",
})

keymap.set("n", "<leader>cgl", "<cmd>GoLint<CR>", {
    desc = "Run linter",
})

keymap.set("n", "<leader>cgf", "<cmd>GoFormat<CR>", {
    desc = "Run formatter",
})

keymap.set("n", "<leader>cgt", "<cmd>GoTest<CR>", {
    desc = "Run tests",
})

keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>", {
  desc = "List file changes",
})

keymap.set("n", "<leader>gh", "<cmd>Telescope git_commits<CR>", {
  desc = "Show commit history",
})

keymap.set("n", "<leader>gt", "<cmd>Telescope git_stash<CR>", {
  desc = "List stashes",
})

keymap.set("n", "<leader>n", "<cmd>Navbuddy<CR>", {
  desc = "Open Navbuddy",
})

