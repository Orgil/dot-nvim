local map = require 'utils'.map

require 'hop'.setup {

}

map('n', '<space>w', "<cmd>lua require'hop'.hint_words()<cr>")
map('n', '<space>b', "<cmd>lua require'hop'.hint_words()<cr>")
map('n', '<space>s', "<cmd>lua require'hop'.hint_char1()<cr>")
map('n', '<space>j', "<cmd>lua require'hop'.hint_lines()<cr>")
map('n', '<space>k', "<cmd>lua require'hop'.hint_lines()<cr>")
