local lspconfig = require "lspconfig"

local on_attach = function(client, bufnr)
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false
end

 --remote-send "<C-\><C-N>:n {file}<CR>{line}G{col}|"
lspconfig.gdscript.setup {
  on_attach = on_attach,
  flags = {debounce_text_changes = 150},
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
      }
    )
  },
}
