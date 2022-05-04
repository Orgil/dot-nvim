local map = require('utils').map
local g = vim.g
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

g.nvim_tree_respect_buf_cwd = 1

g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_add_trailing = 1
g.nvim_tree_group_empty = 1
g.nvim_tree_root_folder_modifier = ":t:r"
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 0,
}
g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged= "✗",
    staged= "✓",
    unmerged= "",
    renamed= "➜",
    untracked= "★",
    deleted= "",
    ignored= "◌"
  },
  folder = {
    arrow_open= "",
    arrow_closed= "",
    default= "",
    open= "",
    empty= "",
    empty_open= "",
    symlink= "",
    symlink_open= "",
  }
}

require'nvim-tree'.setup ({
  disable_netrw = true,
  hijack_cursor = true,
  ignore_ft_on_setup = {
    'startify',
    'dashboard',
    'alpha',
  },
  actions = {
    open_file = {
      window_picker = {
        exclude = {
          filetype = { 'Trouble' },
          buftype = { 'terminal' }
        }
      }
    }
  },
  update_focused_file = {
    -- enables the feature
    enable      = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  filters = {
    dotfiles = false,
    custom = {  '.git', '.cache', '.DS_Store', '.devspace', '.history' },
    exclude = { '.github', '.gitignore'}
  },
  view = {
    mappings = {
      custom_only = true,
      list = {
        { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
        { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
        { key = "s",                        cb = tree_cb("vsplit") },
        { key = "i",                        cb = tree_cb("split") },
        { key = "<C-t>",                        cb = tree_cb("tabnew") },
        { key = "h",                            cb = tree_cb("parent_node") },
        { key = "<BS>",                         cb = tree_cb("close_node") },
        { key = "<S-CR>",                       cb = tree_cb("close_node") },
        { key = "<Tab>",                        cb = tree_cb("preview") },
        { key = "K",                            cb = tree_cb("first_sibling") },
        { key = "J",                            cb = tree_cb("last_sibling") },
        { key = "I",                            cb = tree_cb("toggle_git_ignored") },
        { key = ">",                            cb = tree_cb("toggle_dotfiles") },
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

map("n", "<f4>", ":NvimTreeToggle<cr>")
map("n", "<leader>nt", ":NvimTreeFindFile<cr>")
