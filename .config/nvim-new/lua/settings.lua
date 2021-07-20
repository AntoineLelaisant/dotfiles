vim.o.termguicolors = true

vim.g.background = "dark"
vim.cmd[[colorscheme gruvbox]]

vim.api.nvim_command('autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE')

vim.o.completeopt = "menuone,noselect"

vim.o.fcs="eob: "
vim.o.encoding = "utf8"
vim.o.mouse = "a"
vim.g.incsearch = true
vim.wo.number = true
vim.o.list = true
vim.opt.listchars = { extends = '›', precedes = '‹', nbsp = '·', trail = '·', tab = '~>' }

vim.o.clipboard = "unnamedplus"

vim.o.tabstop = 2
vim.o.shiftwidth = 0
vim.o.expandtab = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.wo.cursorline = true
vim.cmd[[highlight cursorline ctermbg=none]]
vim.cmd[[highlight cursorlinenr ctermfg=yellow ctermbg=none]]

vim.g.mapleader = ","
