local ok, treesitter = pcall(require, 'nvim-treesitter.configs')

if ok then
  treesitter.setup {
    parser_install_dir = "/home/raru/.local/share/nvim/lazy/nvim-treesitter",
    ensure_installed = {
      'go',
      'html',
      'json',
      'markdown',
      'scala',
      'scss',
      'sql',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'yaml',
      'javascript',
      'ruby',
      'lua',
      "terraform",
      "hcl",
    },
    highlight = {
      enable = true,
      disable = {},
    },
    indent = {
      enable = true
    },
  }
end

