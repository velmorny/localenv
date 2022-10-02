require'nvim-treesitter.configs'.setup {
--  ensure_installed = "maintained",
  ensure_installed = {
    "go",
    "dart"
  },
  highlight = {
    enable = true
  }
}
