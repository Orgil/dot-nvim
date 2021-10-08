local map = require 'utils'.map
local saga = require 'lspsaga'

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

saga.init_lsp_saga {
   error_sign = '', -- 
   warn_sign = '',
   hint_sign = '',
   infor_sign = '',
   code_action_prompt = {
      enable = true,
      sign = true,
      sign_priority = 20,
      virtual_text = false,
   },
   finder_action_keys = {
      open = 'o', vsplit = 's',split = 'i',quit = '<esc>',scroll_down = '<C-d>', scroll_up = '<C-u>' -- quit can be a table
   },
   code_action_keys = {
      quit = '<esc>',exec = '<CR>'
   },
   rename_action_keys = {
      quit = '<esc>',exec = '<CR>'  -- quit can be a table
   },
}

map('n', '<leader>a', ':Lspsaga code_action<CR>')
map('v', '<leader>a', ':<C-U>Lspsaga range_code_action<CR>')
map('n', ';', ':Lspsaga show_cursor_diagnostics<CR>')
map('n', '<leader>u', ':Lspsaga lsp_finder<CR>')
map('n', '<leader>r', ':Lspsaga rename<CR>')
