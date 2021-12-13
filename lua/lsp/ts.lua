local lspconfig = require "lspconfig"
local buffer_map = require "utils".buffer_map

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(client, bufnr)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  local ts_utils = require("nvim-lsp-ts-utils")
  ts_utils.setup({
    debug = false,
    enable_import_on_completion = true,
    update_imports_on_move = true,
    filter_out_diagnostics_by_code = { 80001 }
  })
  ts_utils.setup_client(client)

  buffer_map(bufnr, 'n','<leader>fr',':TSLspRenameFile<CR>')
end

lspconfig.tsserver.setup {
  init_options = require("nvim-lsp-ts-utils").init_options,
  on_attach = on_attach,
  flags = {debounce_text_changes = 150, allow_incremental_sync = true},
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
      }
    )
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  },
  capabilities = capabilities
}
