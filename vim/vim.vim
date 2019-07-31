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
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
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
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ternjs/tern_for_vim'
Plug 'carlitux/deoplete-ternjs'

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#filetypes = ['jsx', 'javascript.jsx', 'vue' ]
let g:deoplete#sources#ternjs#filter = 0
let g:deoplete#sources#ternjs#types = 1

" tern
let g:tern#arguments = ["--persistent"]
let g:tern#command = ["tern"]
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000


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
let NERDTreeIgnore=[]

" NerdCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1

hi SpellBad  gui=undercurl guisp=red term=undercurl cterm=undercurl
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
set wildmenu

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


if executable('rg') && (exists(':Rg') != 2)
  command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
        \   <bang>0 ? fzf#vim#with_preview('up:60%')
        \           : fzf#vim#with_preview('right:50%', '?'),
        \   <bang>0)
  nnoremap <Leader>zg :Rg<CR>
endif
