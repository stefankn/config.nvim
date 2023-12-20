require("neo-tree").setup({
  filesystem = {
    follow_current_file = true,
    use_libuv_file_watcher = false,
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
})

