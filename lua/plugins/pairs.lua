local npairs = require('nvim-autopairs')
local map = require"utils".map
local cmp = require'cmp'

npairs.setup{
  check_ts = true,
  ts_config = {
    lua = {'string'},-- it will not add a pair on that treesitter node
    javascript = {'template_string'},
    java = false,-- don't check treesitter on java
  },
  break_line_filetype = nil, -- enable this rule for all filetypes
  pairs_map = {
    ["'"] = "'",
    ['"'] = '"',
    ['('] = ')',
    ['['] = ']',
    ['{'] = '}',
    ['`'] = '`',
  },
  disable_filetype = { "TelescopePrompt" },
  html_break_line_filetype = {
    'html' , 'vue' , 'typescriptreact' , 'svelte' , 'javascriptreact'
  },
  ignored_next_char = "[%w%.%+%-%=%/%,]"
}

local cmp_pairs = require("nvim-autopairs.completion.cmp");

cmp.event:on('confirm_done', cmp_pairs.on_confirm_done({
      map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
      auto_select = true, -- automatically select the first item
      insert = false, -- use insert confirm behavior instead of replace
      map_char = { -- modifies the function or method delimiter by filetypes
        all = '(',
        tex = '{'
      }
  }))
