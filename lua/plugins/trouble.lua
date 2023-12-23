return {
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                height = 6,
                padding = false,
            })

            vim.keymap.set("n", "<leader>ct", ":TroubleToggle<CR>", { desc = "toggle trouble panel" })
        end
    },
}
