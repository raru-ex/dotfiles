local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
local parser_dir

if os_name == "Darwin" then  -- MacOS
  parser_dir = "/Users/raru/.local/share/nvim/lazy/nvim-treesitter"
elseif os_name == "Linux" then  -- Linux
  parser_dir = "/home/raru/.local/share/nvim/lazy/nvim-treesitter"
end

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

