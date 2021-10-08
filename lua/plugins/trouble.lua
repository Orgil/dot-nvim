local map = require 'utils'.map

require "trouble".setup {

}

map('n', '<F3>', '<cmd>TroubleToggle lsp_document_diagnostics<CR>')
