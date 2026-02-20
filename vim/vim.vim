let g:vim_home = expand('<sfile>:p:h')
let &runtimepath.=','.g:vim_home
let &runtimepath.=','.g:vim_home.'/after'

set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader = ","
nnoremap <Leader>nt :NERDTreeToggle<cr>
nnoremap <Leader>no :NERDTreeFocus<cr>
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
nmap <leader>bd :bp\|bd #<CR>
nmap <leader>% :MtaJumpToOtherTag<CR>
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" imap <silent> <C-n> <Plug>(copilot-next)
" imap <silent> <C-p> <Plug>(copilot-previous)
" imap <silent> <C-\> <Plug>(copilot-dismiss)
imap <silent> <C-n>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <silent> <C-p>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <silent> <C-\>   <Cmd>call codeium#Clear()<CR>

if has('nvim')
  " imap <silent><script><expr> <C-space> copilot#Accept("\<CR>")
  imap <script><silent><nowait><expr> <C-space> codeium#Accept()
else
  " imap <silent><script><expr> <Nul> copilot#Accept("\<CR>")
  imap <script><silent><nowait><expr> <Nul> codeium#Accept()
endif
let g:copilot_no_tab_map = v:true
let g:codeium_disable_bindings = 1
let g:codeium_enabled = v:false


call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator' " nav from tmux to vim
Plug 'editorconfig/editorconfig-vim'
Plug 'valloric/matchtagalways'
Plug 'lifepillar/vim-solarized8'
Plug 'arcticicestudio/nord-vim'
Plug 'mbbill/undotree'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive' " git stuff
Plug 'tpope/vim-surround' " surround with quotes
" Plug 'dense-analysis/ale' " linting
Plug 'xuyuanp/nerdtree-git-plugin'
" Plug 'mustache/vim-mustache-handlebars'
" Plug 'posva/vim-vue'
Plug 'toml-lang/toml'
" :CocInstall coc-git coc-highlight coc-vetur coc-html coc-tsserver coc-json coc-css coc-spell-checker coc-emmit coc-prettier coc-eslint
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
" Plug 'github/copilot.vim'
Plug 'Exafunction/windsurf.vim'
" Plug 'https://github.com/martinda/Jenkinsfile-vim-syntax.git'
Plug 'https://github.com/lbrayner/vim-rzip'
call plug#end()

" workspace
let g:workspace_autosave = 0

" airline
set laststatus=2
let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#coc#show_coc_status = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_left_sep=''
let g:airline_powerline_fonts = 1
let g:airline_right_sep=''
let g:airline_section_b=''
let g:airline_section_y=''
let g:airline_skip_empty_sections = 1
let g:airline_symbols = {}
let g:airline_symbols.linenr='' " hide the line number symbol
let g:airline_symbols.maxlinenr=''

" NerdTree
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['\~$', '\.git$', '\.DS_Store$', '\.meta$', '\.scss\.d\.ts']
let g:NERDTreeMinimalUI=1
let g:NERDTreeautodeletebuffer=1
let g:NERDTreeWinSize=34
let g:NERDTreeGitStatusUseNerdFonts = 1
autocmd VimEnter * NERDTree

" NerdCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1

" Ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

set autoindent
set autoread
set backspace=indent,eol,start
set backup
set backupcopy=yes
set belloff=all
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
set mouse=n
set noerrorbells
set nowrap
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
set nospell
" set spelllang=en
" set spell
" let &spellfile = g:vim_home . '/spell/en.utf-8.add'
set splitright
set splitbelow
set tabstop=2
set termguicolors
set timeoutlen=2000
set title                " change the terminal's title
set updatetime=750
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu

filetype plugin indent on
syntax enable
au FocusLost * stopinsert
autocmd FocusLost * call feedkeys("\<esc>")
au FocusLost * :wa
au FocusGained,BufEnter * :checktime
au FileType tagbar,nerdtree setlocal signcolumn=no

if matchstr($ITERM_PROFILE, '\cdark') != ''
  set background=dark
  colorscheme nord
  let g:airline_theme='nord'
else
  set background=light
  colorscheme solarized8
  let g:airline_theme='light'
endif

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

command! -nargs=0 Format :CocCommand prettier.formatFile
command! -nargs=0 Lint :CocCommand eslint.executeAutofix

if executable('rg') && (exists(':Rg') != 2)
  " fzf#vim#with_preview([[options to wrap], [preview window expression], [toggle-preview keys...]])
  command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --no-heading --color=always --hidden --smart-case '.(len(<q-args>) > 0 ? <q-args> : '""'), 1,
        \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%', 'ctrl-/')
        \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%', 'ctrl-/'),
        \   <bang>0)
  nnoremap <Leader>zg :Rg!<CR>
endif

let g:fzf_history_dir = g:vim_home . '/fzfHist'

" Use tab for COC completion ----------------------------------------------------

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
