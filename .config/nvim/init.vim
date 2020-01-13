"   ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
"   ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
"   ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
"   ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
"   ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
"   ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

call plug#begin('~/.local/share/nvim/plugged')

" vim-scripts
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-scripts/Rename'
Plug 'vim-scripts/bufkill.vim'

" Browse
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sjbach/lusty'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Motions
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'austintaylor/vim-commaobject'

" vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'beyondwords/vim-twig'
Plug 'stephpy/vim-yaml'
Plug 'ekalinin/Dockerfile.vim'
Plug 'leafgarland/typescript-vim'
Plug 'jparise/vim-graphql'
Plug 'posva/vim-vue'
Plug 'chr4/nginx.vim'
Plug 'evanleck/vim-svelte' " Svelte
Plug 'amadeus/vim-mjml'
Plug 'dart-lang/dart-vim-plugin'

" PHP
Plug 'arnaud-lb/vim-php-namespace'
Plug 'rafi/vim-phpspec'
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}

" ncm2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'phpactor/ncm2-phpactor' " php
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm1/ncm2-ultisnips'

" CS
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'

" Tags
" Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" Theme / Prettify
Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'

" Must remain the last loaded
Plug 'ryanoasis/vim-devicons'

call plug#end()

set number
set numberwidth=5
set expandtab " converts tabs to spaces
set autoindent " automatically copy indentation from previous line
set smartindent " indents one extra level according to current syntax
" indents with tab = 4 spaces
set ignorecase
set tabstop=4
set softtabstop=4
set shiftwidth=4
set mouse=a
set ls=2
set ruler
set clipboard=unnamedplus
set hidden
set directory=~/.vim/tmp
au BufNewFile,BufRead *.tsx set ft=typescript.jsx
set incsearch
set hlsearch
set encoding=utf-8
set nowrap
set exrc
set updatetime=250
syntax on

let mapleader = ","

" highlight trailing spaces
set list
set listchars=eol:ᛎ,trail:‧,tab:▹∙
match ErrorMsg '\s\+$'

function! StripTrailingWhitespace()
normal mZ
%s/\s\+$//e
normal `Z
endfunction

" Automatically create directory if it does not exist
au BufWrite * :call <SID>MkdirsIfNotExists(expand('<afile>:h'))
function! <SID>MkdirsIfNotExists(directory)
if(!isdirectory(a:directory))
call system('mkdir -p '.shellescape(a:directory))
endif
endfunction

" CURSOR
highlight Cursor guifg=white guibg=white
set cursorline

" Ctags
set tags=tags,.tags,.vendor.tags

" tags jump
nmap <silent> <F2> "zyiw:exe ":tj ".@z.""<CR>

" Gutentags
let g:gutentags_ctags_extra_args = ['--kinds-PHP=cidf']
let g:gutentags_exclude_filetypes = ['gitcommit', 'yaml', 'json', 'xml']

" Filetype support
filetype on
filetype plugin on

set wildmenu
set wildmode=list:longest

" copy to x buffer
vmap <leader>y "+y<CR>
nmap <leader>p "+p<CR>

" Theme
set t_Co=256
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'

hi Normal guibg=NONE ctermbg=NONE

if (empty($TMUX))
if (has("nvim"))
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
set termguicolors
endif
endif

nmap <C-b> <leader>lb
nmap <C-e> <leader>lr
nmap <C-h> :bp<CR>
nmap <C-l> :bn<CR>
nnoremap <C-k> :BD<CR>              " Kill current buffer
nmap <C-n> :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>bc :BufOnly<CR>        " Kill buffers but active one
nnoremap <leader>/ :noh<CR>

nmap tt g<C-]>
nmap TT <C-T>

"unmap arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" TAGBAR
nmap <F8> :TagbarToggle<CR>

" UNDOTREE
nmap <Leader>ut :UndotreeToggle<CR>

autocmd FileType php inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

let g:php_namespace_sort_after_insert = 1

" ULTISNIPS
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_theme='raven'

" NERDTree
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
hi NERDTreeClosable ctermfg=green
hi NERDTreeOpenable ctermfg=green
hi NERDTreeDir ctermfg=green
hi NERDTreeFlags ctermfg=white

let g:jsx_ext_required = 0

" ALE
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1

" ALE colors
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=None ctermfg=red
highlight ALEWarningSign ctermbg=None ctermfg=yellow

" Phpactor
noremap <Leader><space> :call phpactor#ContextMenu()<CR>
noremap <Leader>g :call phpactor#GotoDefinition()<CR>
noremap <Leader>u :call phpactor#UseAdd()<CR>
noremap <Leader>t :call phpactor#Transform()<CR>

" Phpspec
let g:phpspec_executable = 'docker-compose exec php phpspec'
let g:phpspec_config_dir = 'apps/api'

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Ncm2 settings
let ncm2#popup_delay = 200
let g:ncm2#matcher = 'substrfuzzy'

" Fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" C-f bindings
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" C-p bindings
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

map <C-f> <esc>:Rg
noremap <C-p> <esc>:Files<CR>

noremap <C-c> <Esc>
