return {
    {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup()
            telescope.load_extension("fzf")

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "find buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "find help tags" })
            vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "find recent files" })
            vim.keymap.set("n", "<leader>fc", builtin.command_history, { desc = "find recent commands" })

            vim.keymap.set("n", "<leader>cs", builtin.lsp_document_symbols, { desc = "list document symbols" })
            vim.keymap.set("n", "<leader>cd", builtin.lsp_definitions, { desc = "go to definition" })
            vim.keymap.set("n", "<leader>cr", builtin.lsp_references, { desc = "find references" })

            vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "list git commits" })
            vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "git status" })
            vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "list git branches" })

            vim.keymap.set("n", "<leader>bl", builtin.buffers, { desc = "list buffers" })
        end
    }
}
