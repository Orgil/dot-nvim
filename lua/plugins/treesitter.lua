require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  autotag = {
    enable = true
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = true
  },
  context_commentstring = {
    enable = true
  }
}
