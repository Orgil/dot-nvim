local map = require 'utils'.map

require "trouble".setup {
  indent_lines = false,
  padding = 1
}

map('n', '<F3>', '<cmd>TroubleToggle lsp_document_diagnostics<CR>')
