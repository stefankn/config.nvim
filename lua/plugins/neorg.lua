require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behavior
        ["core.concealer"] = {}, -- Adds pretty document icons
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/Documents/Notes",
                },
                default_workspace = "notes",
            },
        },
    },
}
