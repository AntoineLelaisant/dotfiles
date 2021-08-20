require'fzf-lua'.setup {
  fzf_layout = 'default',
  default_previewer   = 'bat',
  previewers = {
    bat = {
      cmd    = 'bat',
      args   = '--style=numbers --color always',
      theme  = 'gruvbox-dark', -- bat preview theme (bat --list-themes)
      config = nil,            -- nil uses $BAT_CONFIG_PATH
    },
  },
  grep = {
    rg_opts = '--hidden --column --line-number',
  }
}
