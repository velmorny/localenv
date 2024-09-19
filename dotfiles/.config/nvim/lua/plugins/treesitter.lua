require'nvim-treesitter.configs'.setup {
--  ensure_installed = "maintained",
  ensure_installed = {
    "html",
    "css",
    "lua",
    "go",
    "proto",
    "toml",
    "sql",
    "yaml",
    "json",
    "python",
    "terraform",
    "typescript",
    "tsx",
  },
  highlight = {
    enable = true
  },
  -- autotag = {
  --   enable = true
  -- }
}
