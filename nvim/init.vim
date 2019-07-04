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

" Search files
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sjbach/lusty'

" vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"
" Syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'beyondwords/vim-twig'
Plug 'stephpy/vim-yaml'
Plug 'ekalinin/Dockerfile.vim'
Plug 'leafgarland/typescript-vim'
Plug 'jparise/vim-graphql'
Plug 'posva/vim-vue'

" PHP
Plug 'arnaud-lb/vim-php-namespace'
Plug 'rafi/vim-phpspec'
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}

" ncm2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'phpactor/ncm2-phpactor' " php
Plug 'ncm2/ncm2-tern' " javascript
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-ultisnips'

Plug 'SirVer/ultisnips'
Plug 'editorconfig/editorconfig-vim'
Plug 'majutsushi/tagbar'
Plug 'austintaylor/vim-commaobject'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mbbill/undotree'
Plug 'junegunn/goyo.vim'

call plug#end()

set number
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
set colorcolumn=80
set hidden
set directory=~/.vim/tmp
au BufNewFile,BufRead *.twig set ft=htmljinja
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

autocmd FileType php,js,jsx,ts,tsx,css,html,xml,yaml,vim autocmd BufWritePre <buffer> :call StripTrailingWhitespace()

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
let g:gutentags_exclude_filetypes = ['gitcommit']

filetype plugin indent on

set wildmenu
set wildmode=list:longest

" copy to x buffer
vmap <leader>y "+y<CR>
nmap <leader>p "+p<CR>

set t_Co=256
colorscheme hybrid

autocmd InsertEnter * hi LineNr      ctermfg=16 ctermbg=214 guifg=Orange guibg=#151515
autocmd InsertLeave * hi LineNr      term=underline ctermfg=59 ctermbg=232 guifg=#605958 guibg=#151515

" clear vim cache
nnoremap <leader>c :!rm -rf ~/.vim/tmp/*<CR><CR>

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

" Speed up ctrl p
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v([\/]\.(git|hg|svn))|([\/]node_modules)|([\/]compiled)|([\/]dist)|([\/]app/cache)|([\/]bower_components)|([\/]doc)$',
  \ }

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_theme='raven'

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:jsx_ext_required = 0

" ALE
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1

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
