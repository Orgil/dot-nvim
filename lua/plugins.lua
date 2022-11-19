-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- require('packer').init({display = {non_interactive = true}})
require('packer').init({display = {auto_clean = true, open_fn=require'packer.util'.float}})

return require('packer').startup(function(use)
  use 'nathom/filetype.nvim'
  use 'lewis6991/impatient.nvim'
  -- use 'rcarriga/nvim-notify'
  -- Packer can manage itself as an optional plugin
  use 'wbthomason/packer.nvim'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use 'folke/tokyonight.nvim'
  use 'EdenEast/nightfox.nvim'
  use {
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'
  }
  use 'sheerun/vim-polyglot'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons"
  }
  use 'folke/lsp-colors.nvim'
  use 'glepnir/dashboard-nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'neovim/nvim-lspconfig'
  use 'simnalamburt/vim-mundo'
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim"
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-treesitter/nvim-treesitter"}
    }
  }
  use 'lukas-reineke/indent-blankline.nvim'
  use({
    'CosmicNvim/cosmic-ui',
    requires = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' }
  })
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    -- tag = 'release' -- To use the latest release
  }
  use {
    'phaazon/hop.nvim',
    as = 'hop'
  }
  use 'chaoren/vim-wordmotion'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'tpope/vim-repeat'
  use 'thinca/vim-visualstar'
  use 'NvChad/nvim-colorizer.lua'
  use 'ntpeters/vim-better-whitespace'
  use 'folke/zen-mode.nvim'
  use {'seblj/nvim-tabline',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim"
  }
  use({
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup()
    end,
  })
  use 'onsails/lspkind-nvim'
  use 'nacro90/numb.nvim'
  use {'jose-elias-alvarez/null-ls.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'farmergreg/vim-lastplace'
  use 'simrat39/rust-tools.nvim'
end)
