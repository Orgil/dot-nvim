local map = function(type, key, value)
	vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

local lsp = vim.lsp
local lspconfig = require "lspconfig"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, server)
  client.resolved_capabilities.document_formatting = false
  if client.config.flags then
      client.config.flags.allow_incremental_sync = true
  end

  map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
	map('n','<leader>d','<cmd>lua vim.lsp.buf.definition()<CR>')

  print("'" .. client.name .. "' server attached")
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
      }
    )
  },
  flags = {debounce_text_changes = 150},
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  },
  capabilities = capabilities,
  commands = {
    OrganizeImports = {
      function()
        local params = {
          command = "_typescript.organizeImports",
          arguments = {vim.api.nvim_buf_get_name(0)},
          title = ""
        }
        vim.lsp.buf.execute_command(params)
      end
    }
  }
}
