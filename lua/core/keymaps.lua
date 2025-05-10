-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("i", "jj", "<Esc>", { silent = true })

-- Diagnostic
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>dm", vim.diagnostic.open_float, { desc = "Open diagnostic message" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "navigate to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "navigate to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "navigate to the bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "navigate to the top window" })

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>")
vim.keymap.set("n", "<Down>", ":resize +2<CR>")
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>")

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")
vim.keymap.set("n", "<leader>bn", "<cmd> enew <CR>", { desc = "create new buffer" })

-- Window management
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "make windows equal width and height" }) -- make split windows equal width and height
vim.keymap.set("n", "<leader>wx", ":close<CR>", { noremap = true, silent = true, desc = "close current window" }) -- close current split window
