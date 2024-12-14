return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  build = ':TSUpdate',

  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'bash',
        'css',
        'dockerfile',
        'hcl',
        'html',
        'javascript',
        'json',
        'lua',
        'make',
        'markdown',
        'ruby',
        'sql',
        'typescript',
        'yaml',
      },
      sync_install = false,
      auto_install = true,
      indent = {
        enable = true,
      },
      highlight = {
        enable = true,
      },
    })
  end
}
