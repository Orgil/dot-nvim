local null_ls = require 'null-ls'
local helpers = require 'null-ls.helpers'
local b = null_ls.builtins
local buffer_map = require 'utils'.buffer_map

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
  b.diagnostics.eslint_d.with({ 
    condition = function(utils)
      return utils.root_has_file(".eslintrc")
    end
  }),
  b.formatting.prettier,
  b.code_actions.gitsigns,
  b.code_actions.eslint_d.with({ 
    condition = function(utils)
      return utils.root_has_file(".eslintrc")
    end
  })
}

local on_attach = function(client, bufnr)
  buffer_map(bufnr, 'n','<leader>ff','<cmd>lua vim.lsp.buf.formatting()<CR>')
  -- format on save
  vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
end

null_ls.setup({
  debug = true,
  sources = sources,
  on_attach = on_attach
});
