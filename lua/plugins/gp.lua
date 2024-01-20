return {
    {
        "robitx/gp.nvim",
        config = function()
            require("gp").setup()

            vim.keymap.set("n", "<leader>al", ":GpChatFinder<CR>", { desc = "list ai chats" })
            vim.keymap.set("n", "<leader>ao", ":GpAppend<CR>", { desc = "append ai response" })
            vim.keymap.set("n", "<leader>aO", ":GpPrepend<CR>", { desc = "prepend ai response" })
            vim.keymap.set("n", "<leader>an", ":GpChatNew vsplit<CR>", { desc = "new ai chat" })
            vim.keymap.set("n", "<leader>ad", ":GpChatDelete<CR>", { desc = "delete current ai chat" })
        end,
    }
}
