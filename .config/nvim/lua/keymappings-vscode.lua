
vim.api.nvim_set_keymap('n', '<Leader>cc', [[<Cmd>call VSCodeNotify('problems.action.showQuickFixes')<CR>]], { noremap = true, silent = true })

