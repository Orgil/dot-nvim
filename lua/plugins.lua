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
  -- Packer can manage itself as an optional plugin
  use 'wbthomason/packer.nvim'

use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
}
use 'folke/tokyonight.nvim'
use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
}
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
use 'neovim/nvim-lspconfig'
use 'tami5/lspsaga.nvim'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/nvim-cmp'
end)
