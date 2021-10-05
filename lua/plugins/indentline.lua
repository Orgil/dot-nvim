require("indent_blankline").setup {
    char = "▏",
    buftype_exclude = {"terminal"},
    use_treesitter = true,
    show_first_indent_level = false,
    filetype_exclude = {"dashboard", "help"},
    show_trailing_blankline_indent = false
}
