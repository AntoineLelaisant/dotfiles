local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.api.nvim_command('autocmd BufWritePost plugins.lua PackerCompile') -- Auto compile when saving plugins.lua

return require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

  -- LSP ------------------------------------------------------
  use {
    'kabouzeid/nvim-lspinstall',
    config = function() require'plugins.config.lspinstall' end,
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
    'hrsh7th/nvim-compe',
    config = function() require'plugins.config.nvim-compe' end,
    event = 'InsertEnter'
  } -- Completion

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require'plugins.config.nvim-treesitter' end
  }

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
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-media-files.nvim'}},
    config = function() require'plugins.config.telescope' end
  } -- Fuzzy browser
  use 'nvim-telescope/telescope-fzf-writer.nvim' -- Unlock Telescope hyperspeed
  --[[ 
  use {
    'junegunn/fzf',
    run = './install --all',
    config = function() require'plugins.config.fzf' end
  }
  use 'junegunn/fzf.vim'
  ]]
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require'plugins.config.nvim-colorizer' end,
  } -- Colors highlight
  use {'jared-mackey/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}} -- Color theme

  -- Snippets -------------------------------------------------
  use {'hrsh7th/vim-vsnip', event = 'InsertEnter'} -- VSCode LSP Snippet
  use {"rafamadriz/friendly-snippets", event = "InsertEnter"} -- Preconfigured snippets
  use {'windwp/nvim-autopairs', config = function() require'plugins.config.nvim-autopairs' end}
  use 'SirVer/ultisnips'

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

