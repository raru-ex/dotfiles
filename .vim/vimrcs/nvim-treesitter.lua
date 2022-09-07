require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {
    },
  },
  ensure_installed = { "go", "html", "json", "markdown", "scala", "scss", "sql", "toml", "tsx", "typescript", "vim", "yaml", "javascript", "ruby"},
}
