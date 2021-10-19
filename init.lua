-- plugins list
require('plugins')

-- default settings
require('settings')
require('lsp')
require('mappings')

-- configs
require('plugins.nvimtree')
require('plugins.statusline')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.trouble')
require('plugins.dashboard')
require('plugins.cmp')
-- pairs must be below cmp
require('plugins.pairs')
require('plugins.indentline')
require('plugins.lspsaga')
require('plugins.gitsigns')
require('plugins.hop')
require('plugins.numb')
require('plugins.colorizer')
require('plugins.whitespace')
require('plugins.zenmode')
require('plugins.tabline')
require('plugins.todo')
