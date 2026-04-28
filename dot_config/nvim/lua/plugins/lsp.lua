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
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { "lua_ls", "bashls" },
        automatic_enable = false,
      })

      vim.lsp.config('*', {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
      })

      vim.lsp.config('ts_ls', {
        root_markers = { 'tsconfig.json' },
      })

      vim.lsp.config('basedpyright', {
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "recommended",
              diagnosticSeverityOverrides = {
                reportAny = false,
                reportMissingTypeStubs = false,
                reportUnknownImportSymbol = false,
                reportUnknownVariableType = false,
                reportImplicitOverride = false,
                reportUnusedCallResult = false,
                reportUninitializedInstanceVariable = false,
                reportUnannotatedClassAttribute = false,
              },
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = 'openFilesOnly',
            }
          }
        }
      })

      vim.lsp.enable({
        'ruby_lsp',
        'flow',
        'ts_ls',
        'eslint',
        'docker_compose_language_service',
        'basedpyright',
        'tilt_ls',
      })

      vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = 'Format buffer' })
      vim.keymap.set('n', 'grr', require('telescope.builtin').lsp_references, { desc = 'Code References' })
      vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = 'Go to Definition' })
      vim.keymap.set('n', 'gri', require('telescope.builtin').lsp_implementations, { desc = 'Go to Implementation' })
      vim.keymap.set('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, { desc = 'Go to Type Definition' })
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to Definition' })

       vim.filetype.add({
        filename = {
          ["docker-compose.yml"] = "yaml.docker-compose",
          ["docker-compose.yaml"] = "yaml.docker-compose",
          ["Tiltfile"] = "starlark",
        },
      })
    end,
  },
}
