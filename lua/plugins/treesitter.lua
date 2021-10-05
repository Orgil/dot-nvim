require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true, -- <= THIS LINE is the magic!
    disable = {"vue"}
  },
  indent = {
    enable = true,
    disable = {"vue"}
  }
}
