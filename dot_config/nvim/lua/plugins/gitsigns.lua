return {
  "lewis6991/gitsigns.nvim",
  version = "*",
  config = function()
    require("gitsigns").setup()

    local gitsigns = require('gitsigns')
    vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk_inline, { desc = 'Preview git hunk' })
    vim.keymap.set('n', '<leader>gd', gitsigns.diffthis, { desc = 'Diff git hunk' })

    require('which-key').add({
      { '<leader>g', 'git' },
    })
  end,
}
