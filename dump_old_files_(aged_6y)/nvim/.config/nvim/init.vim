call plug#begin("~/.vim/plugged")
" Plugin Section
Plug 'ryanoasis/vim-devicons'
" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' } "asynchronous execution library for Vim.

"airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"TypeScript and TSX support
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'jiangmiao/auto-pairs'	" Auto close brases
Plug 'alvan/vim-closetag'     " Auto close web tags

" Loaded when clojure file is opened
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Multiple file types
"Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }

call plug#end()
"Config Section
"base
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
set encoding=UTF-8
set number
" colorschema
" https://github.com/rafi/awesome-vim-colorschemes
colorscheme minimalist
set background=dark
" NerdTree 
let g:NERDTreeShowHidden = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-z> :NERDTreeToggle<CR>

autocmd BufEnter * lcd %:p:h

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='minimalist'


"filesearching
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

"Ignoring node_modules
"-------------------------
" When using npm, the node_modules folder will often fill out most of the search results. 
"To ignore that, and all files included in the .gitignore file, need to tell fzf to use silversearcher-ag
"
"For arch pacman -S the_silver_searcher
let $FZF_DEFAULT_COMMAND = 'ag -g ""'


" buffer management 
" " Change mapleader
let mapleader=" "

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

" Enable mouse in all modes
set mouse=a

"clipboard
set clipboard+=unnamedplus

"Some better configuration to try

syntax on
set nohlsearch
set hidden
set noerrorbells
set shiftwidth=4
set wrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)
nnoremap <leader>cr :CocRestart

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gl :diffget //2<CR>
nmap <leader>gs :G<CR>

" essentials
nmap <C-s> :w<CR>
nmap <C-x> :q<CR>

