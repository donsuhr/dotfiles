"lots from https://github.com/rlue/.vim/blob/master/vimrc
let g:vim_home = expand('<sfile>:p:h')
let &runtimepath.=','.g:vim_home
let &runtimepath.=','.g:vim_home.'/after'

" node
" scss-syntax.vim
" vim-jsx

set nocompatible              " be iMproved, required
filetype off                  " required

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

let mapleader = ","
nnoremap <Leader>nt :NERDTreeToggle<cr>
nnoremap <Leader>nf :NERDTreeFind<cr>
nnoremap <Leader>ut :UndotreeToggle<cr>
nnoremap <Leader>af :ALEFix<cr>
nnoremap <Leader>zf :GFiles<CR>
nnoremap <Leader>zb :Buffers<CR>
nnoremap <Leader>zl :Lines<CR>
nnoremap <Leader>zh :History<CR>
" <Leader>zg :Rg -- below

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'gregsexton/matchtag'
Plug 'junegunn/gv.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'mbbill/undotree'
Plug 'mustache/vim-mustache-handlebars'
Plug 'pangloss/vim-javascript'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'thaerkh/vim-workspace'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'yggdroot/indentline'

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
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_left_sep=''
let g:airline_powerline_fonts = 1
let g:airline_right_sep=''
let g:airline_symbols = {}
let g:airline_symbols.linenr=''
let g:airline_symbols.maxlinenr=''
let g:airline_theme='light'
set statusline+=%#warningmsg#
set statusline+=%*

" NerdTree
let NERDTreeShowHidden=1

" NerdCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1

set autoindent
set autoread
set background=light
set backspace=indent,eol,start
set backup
set backupcopy=yes
set clipboard=unnamed
set cursorline
set encoding=utf8
set expandtab
set formatoptions-=cro
set hidden
set history=1000         " remember more commands and search history
set hlsearch
set ignorecase
set incsearch
set lazyredraw
set noerrorbells         " don't beep
set number relativenumber
set scrolloff=3
set shiftwidth=2
set showcmd
set showmatch
set showmode
set signcolumn=yes
set smartcase
set softtabstop=2
set splitright
set tabstop=2
set termguicolors
set title                " change the terminal's title
set visualbell           " don't beep
set wildignore=*.swp,*.bak,*.pyc,*.class

filetype plugin indent on
syntax enable
colorscheme solarized8
au FocusLost * :wa
au FocusLost * stopinsert

" Environment Persistence ------------------------------------------------------

if has('persistent_undo')         " Store vimundo within .vim/
  set undofile
  set undolevels=5000
  let &undodir = g:vim_home . '/vimundo'
  let g:workspace_undodir = g:vim_home . '/vimundo'

  if !isdirectory(&undodir)
    call mkdir(&undodir)
  else
    augroup pruneUndo
      autocmd!
      autocmd VimEnter * call pruneUndo#initialize(&undodir)
    augroup END
  endif
endif

" Encryption -------------------------------------------------------------------

if has('crypt-blowfish2') | set cryptmethod=blowfish2 | endif

" File Persistence -------------------------------------------------------------

if exists('+hidden')     | set hidden         | endif " Keep buffers alive when abandoned

" Store all swap files together
if exists('+directory')
  if !isdirectory(g:vim_home . '/swap')
    call mkdir(g:vim_home . '/swap')
  endif
  let &directory = g:vim_home . '/swap'
endif

if !isdirectory(g:vim_home . '/backup')
  call mkdir(g:vim_home . '/backup')
endif
let &backupdir = g:vim_home . '/backup'
augroup pruneBackup
  autocmd!
  autocmd VimEnter * call pruneUndo#initialize(&backupdir)
augroup END


nnoremap <silent> <Leader><Leader> :call FlashLine()<CR>
function! FlashLine()
  for s:i in [30, 50, 30, 250]
    set cursorline!
    exec 'sleep ' . s:i . 'm'
    redraw
  endfor
endfunction
nmap <leader>nf :NERDTreeFind<cr>


if executable('rg') && (exists(':Rg') != 2)
  command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
        \   <bang>0 ? fzf#vim#with_preview('up:60%')
        \           : fzf#vim#with_preview('right:50%', '?'),
        \   <bang>0)
  nnoremap <Leader>zg :Rg<CR>
endif
