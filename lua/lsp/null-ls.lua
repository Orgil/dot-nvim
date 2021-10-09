local lspconfig = require 'lspconfig'
local null_ls = require 'null-ls'
local b = null_ls.builtins
local buffer_map = require 'utils'.buffer_map

local sources = {
  b.formatting.prettierd,
  b.code_actions.gitsigns,
  b.diagnostics.dockerfile,
  b.diagnostics.stylelint
}

null_ls.config({ sources = sources });

local on_attach = function(client, bufnr)
  buffer_map(bufnr, 'n','<leader>ff','<cmd>lua vim.lsp.buf.formatting()<CR>')
  -- format on save
  vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
end

lspconfig['null-ls'].setup({
  on_attach = on_attach,
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
      }
    )
  }
})
