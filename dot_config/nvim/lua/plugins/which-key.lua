return {
  "folke/which-key.nvim",
  version = "*",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = true })
      end,
      desc = "Which Key",
    },
  },
}

