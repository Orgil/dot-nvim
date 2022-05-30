local lspconfig = require "lspconfig"
local buf_map = require "utils".buffer_map

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(client, bufnr)
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false

  local ts_utils = require("nvim-lsp-ts-utils")
  ts_utils.setup({
    debug = false,
    enable_import_on_completion = true,
    update_imports_on_move = true,
    filter_out_diagnostics_by_code = { 80001 },
    auto_inlay_hints = true,
    inlay_hints_highlight = 'Comment'
  })
  ts_utils.setup_client(client)

  buf_map(bufnr, 'n','<leader>fr',':TSLspRenameFile<CR>')
  buf_map(bufnr, 'n', ';', '<cmd>lua vim.diagnostic.open_float(nil, { scope = "line", })<cr>')

  buf_map(bufnr, 'n', '<leader>ff', '<cmd>EslintFixAll<CR>')
  buf_map(bufnr, 'v', '<leader>ff', '<cmd>lua vim.lsp.buf.range_formatting()<cr>')
  buf_map(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>')
  buf_map(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>')

  buf_map(bufnr, 'n', '<leader>a', '<cmd>lua require("cosmic-ui").code_actions()<cr>')
  buf_map(bufnr, 'v', '<leader>a', '<cmd>lua require("cosmic-ui").range_code_actions()<cr>')
  buf_map(bufnr, 'n', '<leader>r', '<cmd>lua require("cosmic-ui").rename()<cr>')
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
    ),
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
