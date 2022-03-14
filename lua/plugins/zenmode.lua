local map = require 'utils'.map

require 'zen-mode'.setup {
  window = {
    width = 160
  }
}

map('n', '<leader>o', '<cmd>ZenMode<cr>')
