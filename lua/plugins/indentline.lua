require("indent_blankline").setup {
    char = "▏",
    buftype_exclude = {"terminal", "packer"},
    use_treesitter = true,
    show_first_indent_level = false,
    filetype_exclude = {"dashboard", "help", "packer"},
    show_trailing_blankline_indent = false
}
