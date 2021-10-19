local map = require('utils').map
local actions = require "telescope.actions"
local telescope = require "telescope"

telescope.setup {
  defaults = {
    prompt_prefix = " ❯ ",
    selection_caret = '❯ ',
    file_ignore_patterns = {".git/*", "node_modules/.*", "%.import", ".import/*"},
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
      theme = "dropdown",
      hidden = true
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
map('n', '<leader>d', ':Telescope lsp_definitions theme=dropdown<CR>')
map('n', '<leader>t', ':Telescope lsp_type_definitions theme=dropdown<CR>')
map('n', '<leader>a', ':Telescope lsp_code_actions theme=cursor<CR>')
map('v', '<leader>a', ':Telescope lsp_range_code_actions theme=cursor<CR>')

telescope.load_extension('fzf')
