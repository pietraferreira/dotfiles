-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'folke/tokyonight.nvim'

  -- Many plugins need this, mainly telescope
  use 'nvim-lua/plenary.nvim'

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('plugins.nvim-tree')
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = { 'BufRead', 'BufNewFile' },
    cmd = {
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSDisableAll",
      "TSEnableAll",
    },
    confid = function()
      require('plugins.treesitter')
    end
  }
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('plugins.colorizer')
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('plugins.telescope')
    end
  }
  use {
    'windwp/nvim-autopairs',
    keys = {
      { "i", "(" },
      { "i", "[" },
      { "i", "{" },
      { "i", "'" },
      { "i", '"' },
      { "i", "<BS>" },
    },
    config = function()
      require('plugins.autopairs')
    end
  }
  use {
    'folke/which-key.nvim',
    keys = {
      "<leader>",
      "g",
      "d",
      "y",
      "!",
      "z",
      ">",
      "<",
      "]",
      "[",
      "v",
      "c"
    },
    config = function()
      require('plugins.which_key')
    end
  }
  -- CMP
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.cmp')
    end
  }

  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'saadparwaiz1/cmp_luasnip' }

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use { 'hrsh7th/cmp-nvim-lsp' }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.lsp')
    end
  }

  use { 'williamboman/nvim-lsp-installer' }
  use { 'tamago324/nlsp-settings.nvim' }
  use { 'jose-elias-alvarez/null-ls.nvim' }

  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'plugins.alpha'.config)
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins.gitsigns')
    end
  }

  use {
    'tami5/lspsaga.nvim',
    cmd = 'Lspsaga'
  }

  use { 'mfussenegger/nvim-jdtls' }

  -- Terminal.
  use({
    "akinsho/toggleterm.nvim",
    keys = "<C-t>",
    config = function()
      require("plugins.toggleterm")
    end,
  })
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require("plugins.lualine")
    end,
  })
  -- Neovim plugin to comment in/out text.
  use({
    "b3nj5m1n/kommentary",
    keys = {
      "<Plug>kommentary_line_default",
      "<Plug>kommentary_visual_default",
    },
    config = function()
      require("plugins.kommentary")
    end
  })
  use({
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter"
  })
  -- Icons.
  use({
    "kyazdani42/nvim-web-devicons",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("plugins.nvim_web_devicons")
    end
  })

  -- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
  use({
    "andymass/vim-matchup",
    event = { "BufRead", "BufNewFile" },
    config = function()
      vim.g.matchup_matchparen_offscreen = {}
    end
  })
end)
