local map = require 'utils'.map

require "trouble".setup {
  indent_lines = false,
  padding = 1,
  auto_close = true
}

map('n', '<F2>', '<cmd>TodoTrouble<CR>')
map('n', '<F3>', '<cmd>TroubleToggle document_diagnostics<CR>')
