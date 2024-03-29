local map = require('utils').map

require'nvim-tree'.setup ({
  disable_netrw = true,
  hijack_cursor = true,
  respect_buf_cwd = true,
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
  renderer= {
    add_trailing = true,
    group_empty = false,
    highlight_git = true,
    highlight_opened_files = "icon",
    root_folder_modifier = ":t:r",
    icons= {
      webdev_colors = true,
      git_placement = "signcolumn",
      padding = " ",
      symlink_arrow = " ➛ ",
      show= {
        git = true,
        folder = true,
        file = true,
        folder_arrow = false
      },
      glyphs ={
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
    }
  },
  view = {
    signcolumn = "yes",
    mappings = {
      custom_only = true,
      list = {
        { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
        { key = {"<2-RightMouse>", "<C-]>"},    action = "cd" },
        { key = "s",                            action = "vsplit" },
        { key = "i",                            action = "split" },
        { key = "<C-t>",                        action = "tabnew" },
        { key = "h",                            action = "parent_node" },
        { key = "<BS>",                         action = "close_node" },
        { key = "<S-CR>",                       action = "close_node" },
        { key = "<Tab>",                        action = "preview" },
        { key = "K",                            action = "first_sibling" },
        { key = "J",                            action = "last_sibling" },
        { key = "I",                            action = "toggle_git_ignored" },
        { key = ">",                            action = "toggle_dotfiles" },
        { key = "R",                            action = "refresh" },
        { key = "ma",                           action = "create" },
        { key = "md",                           action = "remove" },
        { key = "mr",                           action = "rename" },
        { key = "<C-r>",                        action = "full_rename" },
        { key = "mx",                            action = "cut" },
        { key = "mc",                           action = "copy" },
        { key = "mp",                           action = "paste" },
        { key = "y",                            action = "copy_name" },
        { key = "Y",                            action = "copy_path" },
        { key = "gy",                           action = "copy_absolute_path" },
        { key = "[c",                           action = "prev_git_item" },
        { key = "]c",                           action = "next_git_item" },
        { key = "-",                            action = "dir_up" },
        { key = "mo",                           action = "system_open" },
        { key = "q",                            action = "close" },
        { key = "?",                            action = "toggle_help" },
      }
    }
  }
})

map("n", "<f4>", ":NvimTreeToggle<cr>")
map("n", "<leader>nt", ":NvimTreeFindFile<cr>")
