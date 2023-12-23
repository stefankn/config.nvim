return {
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                update_focused_file = {
                    enable = true,
                },
                view = {
                    width = 40,
                },
                on_attach = function(bufnr)
                    local api = require("nvim-tree.api")
                    api.config.mappings.default_on_attach(bufnr)
                    vim.keymap.set("n", "?", api.tree.toggle_help)
                end
            })

            vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", {
                desc = "open file explorer",
            })
        end,
    },
}
