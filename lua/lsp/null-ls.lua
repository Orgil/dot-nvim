local null_ls = require 'null-ls'
local helpers = require 'null-ls.helpers'
local b = null_ls.builtins
local buf_map = require 'utils'.buffer_map

local gdscript_formatter = {
  method = null_ls.methods.FORMATTING,
  filetypes = { 'gdscript', 'gd' },
  generator = helpers.formatter_factory({
    command = 'gdformat',
    args = { '$FILENAME' },
    to_stdin = false,
    from_stderr = false,
    to_temp_file = true
  })
}

local gdscript_linter = {
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { 'gdscript', 'gd' },
  generator = helpers.generator_factory({
    command = 'gdlint',
    args = { '$FILENAME' },
    to_stdin = true,
    from_stderr = true,
    to_temp_file = true,
    format = "line",
    on_output = helpers.diagnostics.from_patterns({
      {
        pattern = [[:(%d+): ([%w-/]+): (.*)]],
        groups = { "row", "severity", "message" },
      }
    })
  })
}

local sources = {
  gdscript_linter,
  gdscript_formatter,
  b.diagnostics.eslint.with({
      condition = function(utils)
        return utils.root_has_file(".eslintrc")
      end
    }),
  b.diagnostics.jsonlint,
  b.formatting.prettier,
  b.code_actions.eslint.with({
      condition = function(utils)
        return utils.root_has_file(".eslintrc")
      end
    }),
  b.code_actions.gitsigns
}

local on_attach = function(client, bufnr)
  buf_map(bufnr, 'n','<leader>ff','<cmd>lua vim.lsp.buf.formatting()<CR>')
  buf_map(bufnr, 'v', '<leader>ff', '<cmd>lua vim.lsp.buf.range_formatting()<cr>')
  buf_map(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>')
  buf_map(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>')

  buf_map(bufnr, 'n', '<leader>a', '<cmd>lua require("cosmic-ui").code_actions()<cr>')
  buf_map(bufnr, 'v', '<leader>a', '<cmd>lua require("cosmic-ui").range_code_actions()<cr>')
  buf_map(bufnr, 'n', '<leader>r', '<cmd>lua require("cosmic-ui").rename()<cr>')

  -- format on save
  if client.resolved_capabilities.document_formatting then
    vim.cmd([[
      augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      augroup END
      ]])
  end
end

null_ls.setup({
    debug = true,
    sources = sources,
    on_attach = on_attach
  });
