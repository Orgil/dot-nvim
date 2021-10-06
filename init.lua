-- plugins list
require('plugins')

-- default settings
require('settings')
require('lsp')

-- configs
require('mappings')
require('plugins.nvimtree')
require('plugins.statusline')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.trouble')
require('plugins.dashboard')
require('plugins.pairs')
require('plugins.cmp')
require('plugins.indentline')
require('plugins.lspsaga')
require('plugins.gitsigns')
require('plugins.hop')
require('plugins.colorizer')
require('plugins.whitespace')
require('plugins.zenmode')

require 'tabline'.setup {}
