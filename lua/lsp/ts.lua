local lspconfig = require "lspconfig"
local buffer_map = require "utils".buffer_map

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local ts_utils_settings = {
  debug = false,
  enable_import_on_completion = true,
  import_all_scan_buffers = 100,
  eslint_bin = "eslint_d",
  eslint_enable_diagnostics = true,
  eslint_opts = {
    condition = function(utils)
      return utils.root_has_file(".eslintrc") or utils.root_has_file(".eslintrc.js")
    end,
    diagnostics_format = "#{m} [#{c}]",
  },
  enable_formatting = true,
  formatter = "prettierd",
  update_imports_on_move = true,
  filter_out_diagnostics_by_code = { 80001 }
}

local on_attach = function(client, bufnr)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  if client.config.flags then
      client.config.flags.allow_incremental_sync = true
  end

  local ts_utils = require("nvim-lsp-ts-utils")
  ts_utils.setup(ts_utils_settings)
  ts_utils.setup_client(client)

  buffer_map(bufnr, 'n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
  buffer_map(bufnr, 'n','<leader>d','<cmd>lua vim.lsp.buf.definition()<CR>')
  buffer_map(bufnr, 'n','<leader>fr',':TSLspRenameFile<CR>')
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  flags = {debounce_text_changes = 150},
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
