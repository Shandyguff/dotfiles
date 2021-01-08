set encoding=utf-8
scriptencoding utf-8
syntax on
set t_Co=256
set clipboard=unnamedplus

set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set shiftwidth=4

set incsearch
set ignorecase
set smartcase
set hlsearch

set whichwrap=b,s,h,l,<,>,[,],~
set number

nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

set backspace=indent,eol,start

set showmatch
source $VIMRUNTIME/macros/matchit.vim

set wildmenu
set history=5000

if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XtermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'majutsushi/tagbar'
Plug 'junegunn/goyo.vim'
Plug 'neoclide/coc.nvim'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'

call plug#end()

set termguicolors

colorscheme gruvbox
set background=dark

set laststatus=2

set noshowmode
let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }
