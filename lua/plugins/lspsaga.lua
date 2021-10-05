local map = require 'utils'.map
local saga = require 'lspsaga'

saga.init_lsp_saga()

map('n', '<leader>a', ':Lspsaga code_action<CR>')
map('n', '<F3>', '<cmd>TroubleToggle lsp_document_diagnostics<CR>')
