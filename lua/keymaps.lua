local keymap = vim.keymap
vim.g.mapleader = " "

-- Window management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "split window vertically" })
keymap.set("n", "<leader>ws", "<C-w>s", { desc = "split window horizontally" })
keymap.set("n", "<leader>wc", ":close<CR>", { desc = "close active window" })
keymap.set("n", "<leader>wt", "<C-w>w", { desc = "toggle between windows" })
keymap.set("n", "<leader>wk", "<C-w>k", { desc = "move to top window" })
keymap.set("n", "<leader>wl", "<C-w>l", { desc = "move to right window" })
keymap.set("n", "<leader>wj", "<C-w>j", { desc = "move to bottom window" })
keymap.set("n", "<leader>wh", "<C-w>h", { desc = "move to left window" })
keymap.set("n", "<leader>wm", ":MaximizerToggle<CR>", { desc = "maximize active window" })
