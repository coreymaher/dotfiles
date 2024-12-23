return {
  'neovim/nvim-lspconfig',
  version = "*",

  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'saghen/blink.cmp',
  },

  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup()

    require('mason-lspconfig').setup_handlers({
      function(server_name)
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        require('lspconfig')[server_name].setup({ capabilities = capabilities })
      end,
    })

    vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = 'Format buffer' })
    vim.keymap.set('n', '<leader>gr', '<Cmd>Telescope lsp_references<CR>', { desc = 'Code References' })
  end,
}
