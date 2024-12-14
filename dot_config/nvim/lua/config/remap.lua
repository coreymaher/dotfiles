vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = 'Paste without yank' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Copy to clipboard' })
vim.keymap.set('n', '<C-space>', vim.lsp.buf.code_action, { desc = 'Code actions' })

-- lsp diagnostics
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Open diagnostics' })
vim.keymap.set('c', '<leader>]d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('c', '<leader>[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })

