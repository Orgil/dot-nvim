local utils = require('utils')
local g = vim.g
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

g.nvim_tree_ignore = { '.git', '.cache', '.DS_Store' }

require'nvim-tree'.setup ({
	disable_netrw = true,
  view = {
    mappings = {
      list = {
        { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
        { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
        { key = "s",                        cb = tree_cb("vsplit") },
        { key = "i",                        cb = tree_cb("split") },
        { key = "<C-t>",                        cb = tree_cb("tabnew") },
        { key = "<",                            cb = tree_cb("prev_sibling") },
        { key = ">",                            cb = tree_cb("next_sibling") },
        { key = "h",                            cb = tree_cb("parent_node") },
        { key = "<BS>",                         cb = tree_cb("close_node") },
        { key = "<S-CR>",                       cb = tree_cb("close_node") },
        { key = "<Tab>",                        cb = tree_cb("preview") },
        { key = "K",                            cb = tree_cb("first_sibling") },
        { key = "J",                            cb = tree_cb("last_sibling") },
        { key = "I",                            cb = tree_cb("toggle_ignored") },
        { key = "H",                            cb = tree_cb("toggle_dotfiles") },
        { key = "R",                            cb = tree_cb("refresh") },
        { key = "ma",                            cb = tree_cb("create") },
        { key = "md",                            cb = tree_cb("remove") },
        { key = "mr",                            cb = tree_cb("rename") },
        { key = "<C-r>",                        cb = tree_cb("full_rename") },
        { key = "x",                            cb = tree_cb("cut") },
        { key = "mc",                            cb = tree_cb("copy") },
        { key = "mp",                            cb = tree_cb("paste") },
        { key = "y",                            cb = tree_cb("copy_name") },
        { key = "Y",                            cb = tree_cb("copy_path") },
        { key = "gy",                           cb = tree_cb("copy_absolute_path") },
        { key = "[c",                           cb = tree_cb("prev_git_item") },
        { key = "]c",                           cb = tree_cb("next_git_item") },
        { key = "-",                            cb = tree_cb("dir_up") },
        { key = "mo",                            cb = tree_cb("system_open") },
        { key = "q",                            cb = tree_cb("close") },
        { key = "?",                           cb = tree_cb("toggle_help") },
      }
    }
  }
})

utils.map("n", "<f4>", ":NvimTreeToggle<cr>")
