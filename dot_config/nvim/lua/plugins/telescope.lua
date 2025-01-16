return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-telescope/telescope-ui-select.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    require('telescope').setup({
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })

    local builtin = require('telescope.builtin')

    local function live_grep_selection()
      local start_pos = vim.fn.getpos("v")
      local end_pos = vim.fn.getpos(".")
      local lines = vim.fn.getline(start_pos[2], end_pos[2])

      -- If only one line was selected, let's search that text
      if #lines == 1 then
        local selection = lines[1]:sub(start_pos[3], end_pos[3])
        if selection and #selection > 0 then
          builtin.live_grep({ default_text = selection })
          return
        end
      end

      -- Otherwise search without any default text
      builtin.live_grep()
    end

    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files - all' })
    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find files - git' })
    vim.keymap.set('n', '<leader>F', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('v', '<leader>F', live_grep_selection, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope find buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope find help' })

    require("telescope").load_extension("ui-select")
  end
}
