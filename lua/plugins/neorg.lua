return {
    {
        "nvim-neorg/neorg",
        run = ":Neorg sync-parsers",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/Documents/Notes",
                            },
                            default_workspace = "notes",
                        },
                    },
                },
            })
        end
    }
}
