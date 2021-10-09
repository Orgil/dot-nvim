local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
  documentation = false,
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  mapping = {
    ['<C-u>'] = cmp.mapping.scroll_docs(4),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'vsnip', max_item_count = 5 },
    { name = 'nvim_lsp', max_item_count = 20 },
    { name = 'buffer', max_item_count = 5 },
    { name = 'path', max_item_count = 5 },
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = ({
        buffer = "[Buf]",
        nvim_lsp = "[LSP]",
        vsnip = "[Snip]",
      })
    })
  }
})
