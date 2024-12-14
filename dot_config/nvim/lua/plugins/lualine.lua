return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      sections = {
        lualine_b = {
          function()
            return require('auto-session.lib').current_session_name(true)
          end,

          "branch",
          "diff",
          "diagnostics",
        },
      },
    })
  end,
}
