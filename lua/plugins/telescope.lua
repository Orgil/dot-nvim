local map = require('utils').map
local finders = require "telescope.builtin"
local actions = require "telescope.actions"
local telescope = require "telescope"
local sorters = require "telescope.sorters"
local previewers = require "telescope.previewers"
local transform_mod = require("telescope.actions.mt").transform_mod

-- vim.fn.setenv("FZF_DEFAULT_COMMAND", "rg --files --hidden --glob '!.git/**'")

telescope.setup {
  defaults = {
    prompt_prefix = " ❯ ",
    file_ignore_patterns = {".git/*", "node_modules"},
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-q>"] = actions.send_to_qflist
      },
      n = {
        ["<esc>"] = actions.close
      }
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown"
    },
    live_grep = {
      theme = "dropdown",
    },
    buffers = {
      theme = "dropdown"
    }
  },
  extensions = {
    fzf = {
      fuzzy = true
    }
  }
}

map('n', '<c-p>', "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>")
map('n', '<c-b>', "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>")
map('n', '<c-f>', '<cmd>Telescope live_grep<cr>')

require('telescope').load_extension('fzf')

-- map("n", "<C-f>", "<CMD>lua TelescopeOpenPrewiev('find_files')<CR>")
-- map("n", "<C-p>", "<CMD>lua TelescopeOpenPrewiev('git_files')<CR>")
-- map("n", "<C-w>", "<CMD>lua TelescopeOpenPrewiev('oldfiles')<CR>")
-- map("n", "<leader>bb", "<CMD>lua TelescopeOpen('buffers')<CR>")
-- map("n", "<leader>bt", "<CMD>lua TelescopeOpenPrewiev('current_buffer_tags')<CR>")
-- map("n", "<leader>cc", "<CMD>lua TelescopeOpen('commands')<CR>")
-- map("n", "<leader>cb", "<CMD>lua TelescopeOpen('builtin')<CR>")
-- map("n", "<leader>sw", "<CMD>lua TelescopeOpenPrewiev('grep_string')<CR>")

-- map("n", "<leader>sg", "<CMD>lua TelescopeOpenPrewiev('live_grep')<CR>")
-- map("n", "<leader>cr", "<CMD>lua TelescopeOpenPrewiev('lsp_references')<CR>")
-- map("n", "<leader>cs", "<CMD>lua TelescopeOpenPrewiev('symbols')<CR>")
-- map("n", "<leader>cg", "<CMD>lua TelescopeOpenPrewiev('git_status')<CR>")
-- map("n", "<leader>gb", "<CMD>lua TelescopeOpenPrewiev('git_branches')<CR>")
-- map("n", "<leader>csd", "<CMD>lua TelescopeOpenPrewiev('lsp_document_symbols')<CR>")
-- map("n", "<leader>csw", "<CMD>lua TelescopeOpenPrewiev('lsp_workspace_symbols')<CR>")
-- map("n", "<leader>ca", "<CMD>lua TelescopeOpenPrewiev('lsp_code_actions')<CR>")
-- map("n", "<leader>cw", "<CMD>lua TelescopeOpenPrewiev('spell_suggest')<CR>")
-- map("n", "<leader>cm", "<CMD>lua TelescopeOpenPrewiev('keymaps')<CR>")
-- map("n", "<leader>cl", "<CMD>lua TelescopeOpenPrewiev('reloader')<CR>")
-- map("n", "<leader>cv", "<CMD>lua TelescopeOpenPrewiev('vim_options')<CR>")

-- map("n", "<leader>",  "<CMD>lua TelescopeOpenPrewiev('')<CR>")


