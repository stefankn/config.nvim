local wk = require("which-key")
wk.setup()

wk.register({
  ["<leader>a"] = { name = "ChatGPT" },
  ["<leader>s"] = { name = "split windows" },
  ["<leader>f"] = { name = "files" },
  ["<leader>g"] = { name = "git" },
  ["<leader>c"] = { name = "code" },
  ["<leader>cg"] = { name = "go" },
})
