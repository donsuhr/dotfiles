" installed
" Vundle.vim
" YouCompleteMe
" ctrlp.vim
" editorconfig-vim
" gundo.vim
" matchtag
" mustache
" neoformat
" nerdtree
" node
" scss-syntax.vim
" syntastic
" vim-airline
" vim-airline-themes
" vim-colors-solarized
" vim-fugitive
" vim-gitgutter
" vim-javascript
" vim-jsx
" vitality.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'git@github.com:Valloric/YouCompleteMe.git'
" All of your Plugins must be added before the following line
call vundle#end()            " required

" pathogen
execute pathogen#infect()
filetype plugin indent on
syntax enable

" solarized
set background=light
colorscheme solarized

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

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_debug = 3
let g:syntastic_error_symbol = '⚡'
let g:syntastic_warning_symbol = '⚑'
let g:syntastic_style_error_symbol = '●'
let g:syntastic_style_warning_symbol = '›'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
let g:syntastic_filetype_map = { 'html.handlebars': 'handlebars' }
let g:syntastic_handlebars_checkers = ['handlebars', 'hbstidy']
"let g:syntastic_handlebars_exec = '$(npm bin)/handlebars/bin/handlebars'
"let g:syntastic_scss_checkers = ['scss-lint']
"let g:syntastic_scss_lint_exec='scss-lint'
"let g:syntastic_scss_scss_lint_exec='scss-lint'

" prettier
autocmd FileType javascript set formatprg=$(npm\ bin)/prettier\ --tab-width\ 4\ --single-quote\ --trailing-comma\ es5\ --stdin
autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"
autocmd BufWritePre *.jsx exe "normal! gggqG\<C-o>\<C-o>"

" neoformat
"let g:neoformat_try_formatprg = 1
"let g:neoformat_verbose = 1
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_javascript_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin', '--single-quote', '--trailing-comma=es5', '--tab-width=4'],
            \ 'stdin': 1,
            \ }
let g:neoformat_javascript_jsbeautify = {
            \ 'exe': 'js-beautify',
            \ 'args': ['--config .jsbeautifyrc'],
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_html = ['prettydiff']
let g:neoformat_html_htmlbeautify = {
            \ 'exe': 'js-beautify',
            \ 'args': ['--html', '--editorconfig', '--config .jsbeautifyrc'],
            \ 'stdin': 1,
            \ }
let g:neoformat_html_prettydiff = {
        \ 'exe': substitute(system('echo $(npm bin)/prettydiff'), '\n\+$', '', ''),
        \ 'args': ['mode:"beautify"',
                 \ 'lang:"xml"',
                 \ 'readmethod:"filescreen"',
                 \ 'endquietly:"quiet"',
                 \ 'source:"%:p"'],
        \ 'no_append': 1
        \ }

" ctrlP
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|\.tmp)|(\.(swp|ico|git|svn))$'
let g:ctrlp_show_hidden = 1

" NerdTree
let NERDTreeShowHidden=1

" Gundo
let g:gundo_preview_bottom=1
let g:gundo_width=35
let g:gundo_close_on_revert=1

" personal
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
nmap <leader>cf :CtrlP<cr>
nmap <leader>cb :CtrlPBuffer<cr>
nmap <leader>cr :CtrlPMRU<cr>
nmap <leader>fm :Neoformat<cr>
nmap <leader>ln :SyntasticCheck<cr>
nmap <leader>un :GundoToggle<CR>
nmap <leader>bq :bn<cr>:bd #<cr>

