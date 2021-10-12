local lspconfig = require "lspconfig"

local on_attach = function(client, bufnr)
end

 --remote-send "<C-\><C-N>:n {file}<CR>{line}G{col}|"
lspconfig.gdscript.setup {
  on_attach = on_attach,
  flags = {debounce_text_changes = 150}
}
