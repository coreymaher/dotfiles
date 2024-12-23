return {
  'Exafunction/codeium.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('codeium').setup({
      virtual_text = {
        enabled = true,
        key_bindings = {
          clear = '<C-]>',
        },
      },
      enable_cmp_source = false,
    })
  end
}
