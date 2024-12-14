return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "[b", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
    { "]b", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
    { "<leader>bp", "<Cmd>BufferLinePick<CR>", desc = "Pick buffer" },
    { "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", desc = "Go to buffer 1" },
    { "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", desc = "Go to buffer 2" },
    { "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", desc = "Go to buffer 3" },
  },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        truncate_names = false,
        diagnostics = "nvim_lsp",
        separator_style = "thick",
        show_buffer_close_icons = false,
        show_close_icon = false,
        always_show_bufferline = true,
      }
    })
  end,
}

