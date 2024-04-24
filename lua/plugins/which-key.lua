return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
        config = function()
            local wk = require("which-key")
            wk.setup()
            wk.register({
                ["<leader>w"] = { name = "windows" },
                ["<leader>b"] = { name = "buffers" },
                ["<leader>f"] = { name = "find" },
                ["<leader>c"] = { name = "code" },
                ["<leader>g"] = { name = "git" },
                ["<leader>a"] = { name = "ai" },
                ["<leader>s"] = { name = "selection" },
            })
        end
    }
}
