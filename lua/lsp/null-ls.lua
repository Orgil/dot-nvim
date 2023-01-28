local null_ls = require 'null-ls'
local helpers = require 'null-ls.helpers'
local b = null_ls.builtins
local buf_map = require 'utils'.buffer_map

local sources = {
  b.completion.vsnip,
  b.code_actions.gomodifytags,
  b.code_actions.gitsigns,
  b.code_actions.refactoring,
  b.diagnostics.stylelint,
  b.diagnostics.golangci_lint,
  b.diagnostics.gdlint,
  b.formatting.fixjson,
  b.formatting.fixjson,
  b.formatting.gdformat,
  b.formatting.gofmt
}

local on_attach = function(client, bufnr)
  buf_map(bufnr, 'n', '<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>')
  buf_map(bufnr, 'v', '<leader>ff', '<cmd>lua vim.lsp.buf.range_formatting()<cr>')
  buf_map(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>')
  buf_map(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>')

  buf_map(bufnr, 'n', '<leader>a', '<cmd>lua require("cosmic-ui").code_actions()<cr>')
  buf_map(bufnr, 'v', '<leader>a', '<cmd>lua require("cosmic-ui").range_code_actions()<cr>')
  buf_map(bufnr, 'n', '<leader>r', '<cmd>lua require("cosmic-ui").rename()<cr>')

  -- format on save
  -- if client.server_capabilities.document_formatting then
    -- vim.cmd([[ autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll ]])
  -- end
end

null_ls.setup({
    debug = true,
    sources = sources,
    on_attach = on_attach
  });
