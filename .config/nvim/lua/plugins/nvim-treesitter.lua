local ok, treesitter = pcall(require, 'nvim-treesitter.configs')

if ok then
  treesitter.setup {
    highlight = {
      enable = true,
      disable = {},
    },
    indent = {
      enable = true
    },
    ensure_installed = {
      "go",
      "html",
      "json",
      "markdown",
      "scala",
      "scss",
      "sql",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "yaml",
      "javascript",
      "ruby",
      "lua",
    },
  }
end

