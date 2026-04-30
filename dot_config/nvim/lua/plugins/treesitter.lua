return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',

  config = function()
    require('nvim-treesitter').install({
      'bash',
      'css',
      'dockerfile',
      'hcl',
      'html',
      'javascript',
      'json',
      'lua',
      'make',
      'markdown',
      'python',
      'ruby',
      'sql',
      'starlark',
      'tsx',
      'typescript',
      'yaml',
    })

    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if lang and pcall(vim.treesitter.start, args.buf, lang) then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
