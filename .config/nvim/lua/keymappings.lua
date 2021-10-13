-- Global

vim.api.nvim_set_keymap('n', '<Leader>/', ':noh<CR>', { noremap = true, silent = true })

-- Buffer nav
vim.api.nvim_set_keymap('n', '<C-l>', ':bn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':BD<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bc', ':BufOnly<CR>', { noremap = true, silent = true })

-- Nvim tree
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>f', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- LSP Saga
vim.api.nvim_set_keymap('n', 'gh', [[<Cmd> lua require'lspsaga.provider'.lsp_finder()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ca', [[<Cmd> lua require'lspsaga.codeaction'.code_action()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', [[<Cmd> lua require'lspsaga.hover'.render_hover_doc()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gs', [[<Cmd> lua require'lspsaga.signaturehelp'.signature_help()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', [[<Cmd> lua require'lspsaga.rename'.rename()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gD', [[<Cmd> lua require'lspsaga.provider'.preview_definition()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gd', [[<Cmd> lua vim.lsp.buf.definition()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'cc', [[<Cmd> lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[e', [[<Cmd> lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']e', [[<Cmd> lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]], { noremap = true, silent = true })

-- Telescope
-- vim.api.nvim_set_keymap('n', '<C-p>', [[<Cmd>lua require'telescope.builtin'.find_files()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-f>', [[<Cmd>lua require'telescope.builtin'.live_grep()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-b>', [[<Cmd>lua require'telescope.builtin'.buffers()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>fh', [[<Cmd>lua require'telescope.builtin'.help_tags()<CR>]], { noremap = true, silent = true })

-- FZF
vim.api.nvim_set_keymap('n', '<C-p>', [[<Cmd>lua require('fzf-lua').files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', [[<Cmd>lua require('fzf-lua').grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>m', [[<Cmd>lua require('fzf-lua').builtin()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>h', [[<Cmd>lua require'hop'.hint_words()<CR>]], { noremap = true, silent = true })

-- Trouble
vim.api.nvim_set_keymap('n', '<Leader>T', [[<Cmd>TroubleToggle<CR>]], { noremap = true, silent = true })

-- Spectre
vim.api.nvim_set_keymap('n', '<Leader>S', [[<Cmd>lua require('spectre').open()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>s', [[<Cmd>lua require('spectre').open_visual()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sp', [[<Cmd>lua require('spectre').open_file_search()<CR>]], { noremap = true, silent = true })

-- nvim-compe
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
vim.api.nvim_set_keymap('i', '<CR>', [[compe#confirm('<CR>')]], {silent = true, expr = true})

-- Phpactor
vim.api.nvim_set_keymap('n', '<Leader><Space>', ':PhpactorContextMenu<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>g', ':PhpactorGotoDefinition e<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>t', ':PhpactorTransform<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>e', ':PhpactorClassExpand<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>n', ':PhpactorNavigate<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'cl', ':PhpactorClassNew<CR>', { noremap = true, silent = true })
