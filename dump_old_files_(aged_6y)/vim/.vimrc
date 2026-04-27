" Make Vim more useful
set nocompatible              " be iMproved, required
filetype off                  " required
syntax on

" Utf-8 encoding
"set encoding=utf-8
" Use UTF-8 without BOM
set encoding=utf-8 nobomb

set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" force hbs templete to html
au BufReadPost *.hbs set syntax=html

" Allow backspace in insert mode
set backspace=indent,eol,start

" Set foldings with display
set foldmethod=manual
set foldcolumn=1


" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Change mapleader
let mapleader=","

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>t :enew<cr>

" Move to the next buffer
nmap <leader>n :bnext<CR>

" Move to the previous buffer
nmap <leader>p :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>ls :ls<CR>

" For next tab
nnoremap <silent> <C-z> :bnext<CR>
" Map nerd tree to ctrl + n
map <silent> <C-n> :NERDTree<CR>
map <silent> <C-x> :NERDTreeClose<CR>
map <silent> <C-z> :bnext<CR>

" Map current file to open in browser
nnoremap <F12> :exe ':silent !firefox %'<CR>
"nnoremap <F12>f :exe ':silent !firefox %'<CR>
"nnoremap <F12>c :exe ':silent !chromium-browser %'<CR>
"nnoremap <F12>o :exe ':silent !opera %'<CR>

" Don\u2019t add empty newlines at the end of files
"set binary
"set noeol

" Enable per-directory .vimrc files and disable unsafe commands in them
"set exrc
set secure

" Highlight current line
"set cursorline

" Make tabs as wide as four spaces
set tabstop=4

" Set no swap file
set noswapfile

" Set shiftwdith
set shiftwidth=4

" Set expandtab
set expandtab

" Enable line numbers
set number

" Highlight searches
set hlsearch

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it\u2019s being typed
set showcmd

" Smart indent
set smartindent

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Don\u2019t show the intro message when starting Vim
"set shortmess=I

" Show the cursor position
set ruler

" Don\u2019t reset cursor to start of line when moving around.
set nostartofline

" Disable error bells
set noerrorbells

" Respect modeline in files
set modeline
set modelines=4

" Enable mouse in all modes
set mouse=a

" Always show status line
set laststatus=2
set showtabline=2

"
"----------------------
" Vundle Plugin starts-
"----------------------
"
"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()           " required
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'     " Current file browsing
Plugin 'tpope/vim-fugitive' " Git wrapper
Plugin 'vim-scripts/The-NERD-tree'  " Directory browsing
Plugin 'scrooloose/syntastic'	" Syntax checking & errors repoting
"Plugin 'itchyny/lightline.vim'  " quick vim statusbar
Plugin 'vim-airline/vim-airline' " Powerline statusbar
Plugin 'vim-airline/vim-airline-themes' " Powerline themes
Plugin 'edkolev/tmuxline.vim'	" Tmux statusline generator
Plugin 'jiangmiao/auto-pairs'	" Auto close brases
Plugin 'alvan/vim-closetag'     " Auto close web tags
Plugin 'Valloric/YouCompleteMe'  " Code Completions
Plugin 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode

" JavaScript plugins
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'

" Track the engine.
Plugin 'SirVer/ultisnips'    " Ultisnips for snippets
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ


"
"-------------------
"Vundle Plugin Ends-
"-------------------
"

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Use python 3 path
let g:ycm_path_to_python_interpreter = 'python'

let g:ycm_cache_omnifunc = 1 "required



" -- Put your non-Plugin stuff after this line --

" check color scheme @ ls /usr/share/vim/vimfiles/colors
" Set color scheme!¬
colorscheme Tomorrow-Night

" 265 color display
set t_Co=256

" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.htm,*.php"

" Buffer only open tabs
let g:ctrlp_cmd = 'CtrlPBuffer'

"Syntastic rules
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:ycm_semantic_triggers =  {
            \     'c' : ['->', '.'],
            \     'cpp,objcpp' : ['->', '.', '::'],
            \     'php' : ['->', '::'],
            \     'cs,java,javascript,typescript,python' : ['.'],
            \     'ruby' : ['.', '::']
            \ }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" UltiSnips rules
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Airline rules
let g:airline_theme='tomorrow'
let g:airline#extensions#tmuxline#enabled = 0 
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = '☰'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.whitespace = 'Ξ'

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
