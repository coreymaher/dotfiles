return {
  'echasnovski/mini.bufremove',
  keys = {
    { '<leader>bd', function() require('mini.bufremove').delete() end, desc = 'Delete buffer' },
  },
}
