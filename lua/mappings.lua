local map = require('utils').map
local g = vim.g

g.mapleader = ","
g.mundo_right = 1
g.mundo_width = 60
g.mundo_preview_height = 40

map('n', 'r', '<c-r>')

map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<Up>', '<Nop>')
map('n', '<Down>', '<Nop>')
map('n', '<Left>', '<Nop>')
map('n', '<Right>', '<Nop>')

map("n", "Q", "<Nop>")
map("n", "q:", "<Nop>")

map("n", "j", "gj")
map("n", "k", "gk")

map("n", "<S-h>", "gT")
map("n", "<S-l>", "gt")

map("n", "<leader>q", "<cmd>q<cr>")
map("n", "<leader>w", "<cmd>w<cr>")

map('n', '<f1>', '<Esc>')
map('i', '<f1>', '<Esc>')

map('i', '<c-c>', '<Esc>')

-- move line
map('n', '<S-j>', '<cmd>m .+1<cr>==')
map('n', '<S-k>', '<cmd>m .-2<cr>==')
-- map('v', '<S-j>', "<cmd>m '>+1<cr>gv=gv")
-- map('v', '<S-k>', "<cmd>m '<-2<cr>gv=gv")

map('v', '<silent> y', 'y`]')
map('v', '<silent> p', 'p`]')
map('n', '<silent> p', 'p`]')

map('n', 'zl', 'zL')
map('n', 'zh', 'zH')
map('n', 'Y', 'J')

map('n', '<cr>', ':noh<cr>')

-- switch last buffer
map('n', '<leader><leader>', '<c-^>')

map('n', '<f5>', ':MundoToggle<CR>')
map('n', '<f10>', '<cmd>echo "hi:".synIDattr(synID(line("."),col("."),0),"name")<cr>')
