local map = require('utils').map
local g = vim.g

g.mapleader = ","

map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map("n", "Q", "<Nop>")
map("n", "q:", "<Nop>")
