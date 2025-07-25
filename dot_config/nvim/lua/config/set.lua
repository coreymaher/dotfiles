vim.opt.guicursor = ''

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '-', extends = '>', precedes = '<', eol = '¬' }

-- prevent markdown from changing my tab configs
vim.g.markdown_recommended_style = 0

-- auto session options
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.opt.laststatus = 3
