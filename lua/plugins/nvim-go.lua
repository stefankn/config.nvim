return {
    {
        "crispgm/nvim-go",
        config = function()
            require("go").setup({
                auto_lint = false,
                auto_format = true,
                formatter = "goimports",
                maintain_cursor_pos = false,
                test_flags = {"-v"},
                test_timeout = "30s",
                test_env = {},
                test_popup = true,
                test_popup_auto_leave = false,
                test_popup_width = 200,
                test_popup_height = 10,
                test_open_cmd = "edit",
                tags_name = "json",
                tags_options = {"json=omitempty"},
                tags_transform = "snakecase",
                tags_flags = {"-skip-unexported"},
                quick_type_flags = {"--just-types"},
            })
        end
    }
}
