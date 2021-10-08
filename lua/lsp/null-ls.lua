local lspconfig = require 'lspconfig'
local null_ls = require 'null-ls'
local b = null_ls.builtins

local sources = {
    b.formatting.prettierd.with({
        filetypes = { "html", "json", "yaml", "markdown" },
    }),
    b.formatting.stylua.with({
        condition = function(utils)
            return utils.root_has_file("stylua.toml")
        end,
    }),
    b.formatting.trim_whitespace.with({ filetypes = { "tmux", "teal", "zsh" } }),
    b.formatting.shfmt,
    b.diagnostics.write_good,
    b.diagnostics.markdownlint,
    b.diagnostics.teal,
    b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
    b.code_actions.gitsigns,
}

local on_attach = function(client, server)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    if client.config.flags then
        client.config.flags.allow_incremental_sync = true
    end

    map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
    map('n','<leader>d','<cmd>lua vim.lsp.buf.definition()<CR>')

end

lspconfig['null-ls'].setup({
    on_attach = my_custom_on_attach
})
