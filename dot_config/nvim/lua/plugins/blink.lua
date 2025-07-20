return {
  {
    'saghen/blink.cmp',

    version = '*',

    opts = {
      keymap = { preset = 'default' },

      cmdline = {
        completion = {
          menu = {
            auto_show = false,
          },
        },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      sources = {
        default = { 'lazydev', 'lsp', 'path', 'buffer', 'dadbod' },

        providers = {
          dadbod = {
            name = "Dadbod",
            module = "vim_dadbod_completion.blink",
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },

      completion = {
        menu = {
          border = 'single',
          draw = {
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
            treesitter = { 'lsp' },
          },
        },
        documentation = { window = { border = 'single' }, auto_show = true },
      },
      signature = { enabled = true, window = { border = 'single' } },
    },
    opts_extend = { "sources.default" }
  }
}
