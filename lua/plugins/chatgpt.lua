return {
   {
        "jackMort/ChatGPT.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("chatgpt").setup()

            vim.keymap.set("n", "<leader>ac", ":ChatGPT<CR>", { desc = "open chatgpt" })
            vim.keymap.set("v", "<leader>ae", ":ChatGPTEditWithInstructions<CR>", { desc = "edit with chatgpt" })
            vim.keymap.set("v", "<leader>ax", ":ChatGPTRun explain_code<CR>", { desc = "explain using chatgpt" })
            vim.keymap.set("v", "<leader>ad", ":ChatGPTRun docstring", { desc = "create docstring" })
        end
    }
}
