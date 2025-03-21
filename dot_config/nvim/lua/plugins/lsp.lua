return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    'williamboman/mason.nvim',
    version = "*",
  },
  {
    'williamboman/mason-lspconfig.nvim',
    version = "*",
  },
  {
    'neovim/nvim-lspconfig',
    version = "*",

    config = function()
      local lspconfig = require('lspconfig')

      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { "lua_ls", "bashls" },
        automatic_installation = false,
      })

      lspconfig.ruby_lsp.setup({
        capabilities = require('blink.cmp').get_lsp_capabilities(),
      })

      lspconfig.flow.setup({
        capabilities = require('blink.cmp').get_lsp_capabilities(),
      })

      lspconfig.ts_ls.setup({
        capabilities = require('blink.cmp').get_lsp_capabilities(),
        root_dir = function(fname)
          return require('lspconfig/util').root_pattern('tsconfig.json')(fname)
        end,
      })

      require('lspconfig').basedpyright.setup({
        capabilities = require('blink.cmp').get_lsp_capabilities(),
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "recommended",
              diagnosticSeverityOverrides = {
                reportAny = false,
              },
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = 'openFilesOnly',
            }
          }
        }
      })

      -- require('mason-lspconfig').setup_handlers({
      --   function(server_name)
      --     local capabilities = require('blink.cmp').get_lsp_capabilities()
      --     require('lspconfig')[server_name].setup({ capabilities = capabilities })
      --   end,
      --   ["ts_ls"] = function()
      --     require('lspconfig').ts_ls.setup({
      --       capabilities = require('blink.cmp').get_lsp_capabilities(),
      --       root_dir = function(fname)
      --         return require('lspconfig/util').root_pattern('tsconfig.json')(fname)
      --       end,
      --     })
      --   end,
      -- })

      vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = 'Format buffer' })
      vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = 'Code References' })
      vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = 'Go to Definition' })
      vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = 'Go to Implementation' })
      vim.keymap.set('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, { desc = 'Go to Type Definition' })
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to Definition' })
    end,
  },
}
