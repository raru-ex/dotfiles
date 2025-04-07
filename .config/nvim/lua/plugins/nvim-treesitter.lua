local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
local parser_dir

if ok then
  treesitter.setup {
    parser_install_dir = parser_dir,
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
      "proto",
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

