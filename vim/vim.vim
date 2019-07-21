" node
" scss-syntax.vim
" vim-jsx

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'lifepillar/vim-solarized8'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'gregsexton/matchtag'
Plug 'tpope/vim-surround'
Plug 'mustache/vim-mustache-handlebars'
Plug 'pangloss/vim-javascript'
Plug 'ryanoasis/vim-devicons'
Plug 'yggdroot/indentline'
Plug 'w0rp/ale'
Plug 'tmux-plugins/vim-tmux-focus-events'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'valloric/youcompleteme'
call vundle#end()

" airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='light'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:airline_right_sep=''
let g:airline_left_sep=''
let g:airline_symbols = {}
let g:airline_symbols.linenr=''
let g:airline_symbols.maxlinenr=''
let g:airline#extensions#hunks#enabled=0

" NerdTree
let NERDTreeShowHidden=1

" Ale
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['prettier', 'eslint']
let g:ale_fixers.scss = ['prettier']
let g:ale_javascript_prettier_use_local_config = 1

filetype plugin indent on
syntax enable
set termguicolors
set background=light
colorscheme solarized8
set backspace=indent,eol,start
set number
set hidden
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch
set autoindent
set encoding=utf8
set autoread
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile
set clipboard=unnamed
set cursorline
set splitright
set showcmd
set showmode
au FocusLost * :wa
au FocusLost * stopinsert

if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

let mapleader = ","
nmap <leader>nt :NERDTreeToggle<cr>
nmap <leader>nf :NERDTreeFind<cr>

