-- Install lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

-- Add lazypath to the runtime path
vim.opt.rtp:prepend(lazypath)

function Set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- Setup plugins
require("lazy").setup({
    {
        "rebelot/kanagawa.nvim",
        config = function()
            vim.cmd.colorscheme("kanagawa-dragon")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
                auto_install = true,
                highlight = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<Leader>ss",
                        node_incremental = "<Leader>si",
                        scope_incremental = "<Leader>sc",
                        node_decremental = "<Leader>sd",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                        },
                        selection_modes = {
                            ['@parameter.outer'] = 'v',
                            ['@function.outer'] = 'v',
                            ['@class.outer'] = '<c-v>',
                        },
                        include_surrounding_whitespace = true,
                    },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup()
        end,
    },
    {
        "szw/vim-maximizer"
    },
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
                ["<leader>w"] = { name = "window management" },
                ["<leader>f"] = { name = "find" },
                ["<leader>c"] = { name = "code" },
                ["<leader>g"] = { name = "git" },
                ["<leader>a"] = { name = "ai" },
            })
        end
    },
    {
        "akinsho/toggleterm.nvim",
        config = function()
           require("toggleterm").setup({
               open_mapping = [[<c-\>]],
               insert_mappings = true,
               direction = 'horizontal',
               auto_scroll = true,
           })

           vim.cmd("autocmd! TermOpen term://* lua Set_terminal_keymaps()")
        end
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
        end
    },
    {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    {
        "vonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.on_attach(function(_, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                })
            })

            require("mason").setup()
            require("mason-lspconfig").setup({
                -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
                ensure_installed = {
                    "lua_ls",
                },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        require("lspconfig").lua_ls.setup({
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = {
                                            "vim",
                                            "require",
                                        },
                                    },
                                },
                            },
                        })
                    end,
                },
            })
        end
    },
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
})
