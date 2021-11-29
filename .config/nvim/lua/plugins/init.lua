local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.api.nvim_command('autocmd BufWritePost plugins.lua PackerCompile') -- Auto compile when saving plugins.lua

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager

  -- LSP ------------------------------------------------------
  use {
    'williamboman/nvim-lsp-installer',
    config = function() require'plugins.config.lsp-installer' end,
    requires = {'neovim/nvim-lspconfig'}
  }
  use {
    'glepnir/lspsaga.nvim',
    config = function() require'plugins.config.lspsaga' end,
    event = 'BufRead'
  }
  use {
    'onsails/lspkind-nvim',
    config = function() require'plugins.config.lspkind' end
  }
  use {'folke/lsp-colors.nvim', event = 'BufRead'} -- Add missing colors to LSP
  use {
    'phpactor/phpactor',
    ft = {'php'},
    run = 'composer install'
  }

  -- Autocomplete & Syntax ------------------------------------
  use {
    'hrsh7th/nvim-cmp',
    config = function() require'plugins.config.nvim-cmp' end,
    event = 'InsertEnter',
    requires = {
      { 'hrsh7th/cmp-buffer', module = "cmp_buffer" },
      { 'hrsh7th/cmp-nvim-lua', module = "cmp_nvim_lua" },
      { 'hrsh7th/cmp-nvim-lsp', module = "cmp_nvim_lsp" },
      { 'hrsh7th/cmp-path', module = "cmp_path" },
      { "hrsh7th/cmp-calc", module = "cmp_calc" },
      { "hrsh7th/cmp-emoji", module = "cmp_emoji" },
      { 'hrsh7th/cmp-vsnip', module = "cmp_vsnip" }
    }
  } -- Completion

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require'plugins.config.nvim-treesitter' end
  }

  use 'sheerun/vim-polyglot'

  -- File browser & Interface ---------------------------------
  use 'kyazdani42/nvim-web-devicons'
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require'plugins.config.nvim-tree' end
  } -- File browser
  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'plugins.config.nvim-bufferline' end
  }
  use {
  'glepnir/galaxyline.nvim',
     branch = 'main',
     requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'Avimitin/nerd-galaxyline'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require'plugins.config.gitsigns' end,
    event = "BufRead"
  }

  use { 'junegunn/fzf', run = './install --all' }
  use { 'ibhagwan/fzf-lua',
    requires = {
      'vijaymarupudi/nvim-fzf',
      'kyazdani42/nvim-web-devicons',
    },
    config = function() require'plugins.config.fzf' end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require'plugins.config.nvim-colorizer' end,
  } -- Colors highlight
  use {'jared-mackey/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}} -- Color theme

  -- Snippets -------------------------------------------------
  use {
    'hrsh7th/vim-vsnip',
    event = 'InsertEnter',
    config = function () require'plugins.config.vsnip' end
  } -- VSCode LSP Snippet
  use 'hrsh7th/vim-vsnip-integ'

  use {'windwp/nvim-autopairs', config = function() require'plugins.config.nvim-autopairs' end}

  -- Debug ----------------------------------------------------
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    cmd = 'TroubleToggle',
    config = function() require'plugins.config.trouble' end
  }
  use {
    'windwp/nvim-spectre',
    config = function() require'plugins.config.spectre' end,
    requires = {{'nvim-lua/popup.nvim'}},
    event = "BufRead",
  } -- Search and replace
  use {
    'b3nj5m1n/kommentary',
    config = function() require'plugins.config.kommentary' end,
  }

  -- Utils ---------------------------------------------------
  use 'schickling/vim-bufonly'
  use 'qpkorr/vim-bufkill'
end)
