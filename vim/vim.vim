"lots from https://github.com/rlue/.vim/blob/master/vimrc
let g:vim_home = expand('<sfile>:p:h')
let &runtimepath.=','.g:vim_home
let &runtimepath.=','.g:vim_home.'/after'

set nocompatible              " be iMproved, required
filetype off                  " required

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
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader>bd :bp\|bd #<CR>

call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator' " nav from tmux to vim
Plug 'editorconfig/editorconfig-vim'
Plug 'gregsexton/matchtag'
Plug 'junegunn/gv.vim' " Git Commit Browser
" Plug 'kamykn/spelunker.vim' " Spelling -- slow
Plug 'lifepillar/vim-solarized8'
Plug 'mbbill/undotree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sjl/vitality.vim' " focus events when not in tmux
Plug 'thaerkh/vim-workspace'
Plug 'tmux-plugins/vim-tmux-focus-events' " focus events when in tmux
Plug 'tpope/vim-fugitive' " git stuff
Plug 'tpope/vim-surround' " surround with quotes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale' " linting
Plug 'xuyuanp/nerdtree-git-plugin'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'posva/vim-vue'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

let g:workspace_autosave = 0

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" airline
set laststatus=2
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#ale#enabled = 1
let g:airline_left_sep=''
let g:airline_powerline_fonts = 1
let g:airline_right_sep=''
let g:airline_symbols = {}
let g:airline_symbols.linenr='' " hide the line number symbol
let g:airline_symbols.maxlinenr=''
let g:airline_theme='light'

" NerdTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=[]

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
set conceallevel=2
set cursorline
set encoding=utf8
set expandtab
set formatoptions-=cro
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set lazyredraw
set noerrorbells
set nowrap
set nospell
set number relativenumber
set scrolloff=3
set shiftwidth=2
set shortmess+=c
set showcmd
set showmatch
set showmode
set signcolumn=yes
set smartcase
set softtabstop=2
set splitright
set splitbelow
set tabstop=2
set termguicolors
set title                " change the terminal's title
set updatetime=750
set visualbell           " don't beep
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu

filetype plugin indent on
syntax enable
colorscheme solarized8
au FocusLost * stopinsert
au FocusLost * :wa


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


if executable('rg') && (exists(':Rg') != 2)
  command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --no-heading --color=always --hidden --smart-case '.(len(<q-args>) > 0 ? <q-args> : '""'), 1,
        \   <bang>0 ? fzf#vim#with_preview('up:60%')
        \           : fzf#vim#with_preview('right:50%', '?'),
        \   <bang>0)
  nnoremap <Leader>zg :Rg<CR>
endif

let g:fzf_history_dir = g:vim_home . '/fzfHist'

" Use tab for COC completion ----------------------------------------------------

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
