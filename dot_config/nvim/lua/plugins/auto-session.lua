return {
  'rmagatti/auto-session',
  lazy = false,
  enabled = false,
  config = function()
    require('auto-session').setup({
      allowed_dirs = { '~/repos/**', '~/Desktop/Notes', '~/.config/nvim', },

      post_restore_cmds = {
        function()
          -- Set title to session name
          if vim.fn.getenv("TERM_PROGRAM") == "ghostty" then
            vim.opt.title = true
            vim.opt.titlestring = "nvim (" .. require('auto-session.lib').current_session_name(true) .. ")"
          end
        end
      }
    })
  end
}
