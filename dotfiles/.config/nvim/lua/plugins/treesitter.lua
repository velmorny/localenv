require'nvim-treesitter.configs'.setup {
--  ensure_installed = "maintained",
  ensure_installed = {
    "lua",
    "go",
    "proto",
    "toml",
    "sql",
    "yaml",
    "json",
    "python",
    "terraform",
  },
  highlight = {
    enable = true
  }
}
