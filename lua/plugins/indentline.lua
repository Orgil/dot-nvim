require("indent_blankline").setup {
    char = "▏",
    buftype_exclude = {"terminal", "packer"},
    use_treesitter = true,
    show_first_indent_level = false,
    filetype_exclude = {'help', 'dashboard', 'packer', 'neogitstatus', 'NvimTree', ''},
    show_trailing_blankline_indent = false
}
