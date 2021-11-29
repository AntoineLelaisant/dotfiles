vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 0,
}

-- vim.g.nvim_tree_follow = 1

require'nvim-tree'.setup {
  auto_close = false,
  disable_netrw = true,
  ignore_ft_on_setup  = {'.git', 'node_modules'},
  diagnostics = {
    enable = true,
  },
  update_focused_file = {
    update_cwd = true,
  },
  update_to_buf_dir = {
    auto_open = false,
  },
  git = {
    ignore = true
  }
}
