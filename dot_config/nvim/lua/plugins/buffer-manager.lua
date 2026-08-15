return {
  "j-morano/buffer_manager.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("buffer_manager").setup()

    vim.keymap.set("n", "<leader>bb", "<cmd>lua require('buffer_manager.ui').toggle_quick_menu()<CR>", { desc = "Toggle Buffer Manager" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "buffer_manager",
      callback = function()
        vim.keymap.set({"n", "i"}, "<C-c>", "<Cmd>close<CR>", { buffer = true, desc = "Close buffer manager" })
        vim.keymap.set({"n", "i"}, "<Esc>", "<Nop>", { buffer = true })
      end,
    })
  end,
}

