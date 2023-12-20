-- package management

-- reload neovim and installs/updates/removes plugins when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost setup.lua source <afile> | PackerSync
  augroup end
]])

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- lua functions that many plugins use
  use "nvim-lua/plenary.nvim"

  -- Colorscheme
  use 'morhetz/gruvbox'
  use 'sainnhe/gruvbox-material'
  use 'savq/melange-nvim'
  use 'AlexvZyl/nordic.nvim'
  use 'ribru17/bamboo.nvim'
  use 'projekt0n/github-nvim-theme'
  use 'ellisonleao/gruvbox.nvim'
  use 'projekt0n/caret.nvim'
  use 'joshdick/onedark.vim'
  use 'loctvl842/monokai-pro.nvim'
  use 'rebelot/kanagawa.nvim'

  -- file explorer
  use {
    "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      }
    }

  -- statusline
  use("nvim-lualine/lualine.nvim")

  -- which key
  use("folke/which-key.nvim")

  -- maximize and restore current window
  use("szw/vim-maximizer")

  -- fuzzy finding
  use("nvim-treesitter/nvim-treesitter")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

  -- Indentation guides
  use({"lukas-reineke/indent-blankline.nvim"})

  -- Show diagnostics
  use("folke/trouble.nvim")

  -- ChatGPT
  use {
      'jackMort/ChatGPT.nvim',
      requires = {
          'MunifTanjim/nui.nvim',
          'nvim-telescope/telescope.nvim'
      }
  }

  -- lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- lsp support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},

      -- rust tools
      {'simrat39/rust-tools.nvim'},

      -- nvim-go
      {'crispgm/nvim-go'},

      -- debugging
      {'mfussenegger/nvim-dap'},
    }
  }

  -- neorg
  use {
      "nvim-neorg/neorg",
      run = ":Neorg sync-parsers",
      requires = "nvim-lua/plenary.nvim",
  }

  use "akinsho/toggleterm.nvim"

  use {
    "SmiteshP/nvim-navbuddy",
    requires = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim"
    }
  }
end)


