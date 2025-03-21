return {
  'Exafunction/codeium.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  enabled = false,
  config = function()
    require('codeium').setup({
      virtual_text = {
        enabled = false,
        key_bindings = {
          clear = '<C-]>',
        },
      },
      enable_cmp_source = true,
    })
  end
}
