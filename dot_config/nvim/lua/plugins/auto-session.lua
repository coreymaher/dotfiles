return {
  'rmagatti/auto-session',
  lazy = false,
  config = function()
    -- Normalize working directory to Git root if inside a Git repo
    vim.api.nvim_create_autocmd("VimEnter", {
      once = true,
      callback = function()
        local ok, git_root = pcall(function()
          return vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        end)
        if ok and git_root and vim.fn.isdirectory(git_root) == 1 then
          vim.cmd("cd " .. git_root)
        end
      end,
    })

    require('auto-session').setup({
      -- Only create sessions in Git repos or allowed non-git dirs
      auto_create = function()
        local cwd = vim.fn.getcwd()

        local allowed_paths = {
          vim.fn.expand("~/Desktop/Notes"),
          vim.fn.expand("~/.config/nvim"),
        }

        local git_ok, git_result = pcall(vim.fn.systemlist, "git rev-parse --is-inside-work-tree")
        if git_ok and git_result[1] == "true" then
          return true
        end

        for _, path in ipairs(allowed_paths) do
          if cwd:sub(1, #path) == path then
            return true
          end
        end

        return false
      end,

      -- Set terminal title in Ghostty after restoring session
      post_restore_cmds = {
        function()
          if vim.fn.getenv("TERM_PROGRAM") == "ghostty" then
            vim.opt.title = true
            vim.opt.titlestring = "nvim (" .. require('auto-session.lib').current_session_name(true) .. ")"
          end
        end,
      },
    })
  end,
}
