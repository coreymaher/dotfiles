return {
  {
    'saghen/blink.compat',
    version = '*',
    lazy = true,
    opts = {},
  },

  {
    'saghen/blink.cmp',

    version = '*',

    dependencies = {
      { "Exafunction/codeium.nvim", },
    },

    opts = {
      keymap = { preset = 'default' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      sources = {
        -- default = { 'lsp', 'path', 'snippets', 'buffer', 'codeium' },
        default = { 'lsp', 'path', 'buffer', 'codeium' },

        providers = {
          codeium = {
            name = 'codeium',
            module = 'blink.compat.source',
            score_offset = -3,
            override = {
              get_keyword_pattern = function(self)
                return [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]]
              end
            },
          },
        },
      },

      completion = {
        menu = { border = 'single' },
        documentation = { window = { border = 'single' } },
      },
      signature = { window = { border = 'single' } },

      -- experimental signature help support
      signature = { enabled = true }
    },
    opts_extend = { "sources.default" }
  }
}
