"  __  __        __     _____ __  __ ____   ____
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/


" Author: @Qbone

" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ====================
" === Editor Setup ===
" ====================

" ===        ===
" === System ===
" ===        ===

" open filetype detection
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" close 'vi' compatible
set nocompatible

" Enable mouse
set mouse=a
set selection=exclusive
set selectmode=mouse,key

set encoding=utf-8

set clipboard=unnamed

" Prevent incorrect backgroung rendering
let &t_ut=''

" ===                   ===
" === Main code display ===
" ===                   ===

syntax enable
syntax on

set number
set relativenumber

set ruler
set cursorline

" ===                 ===
" === Editor behavior ===
" ===                 ===

" Better tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5

" Prevent auto line split
set wrap
set tw=0

set indentexpr=

" Better backspace
set backspace=indent,eol,start

set foldmethod=indent
set foldlevel=99

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ===                  ===
" === Window behaviors ===
" ===                  ===

set splitright
set splitbelow

" ===                    ===
" === Status/command bar ===
" ===                    ===

set laststatus=2
set autochdir
set showcmd
set formatoptions-=tc

" Show command autocomplete
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

" Searching options
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase


" ===                         ===
" === Restore Cursor Position ===
" ===                         ===

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ======================
" === Basic Mappings ===
" ======================

" Set <LEADER> as <SPACE>
let mapleader=" "

" make Y to copy till the end of the line
nnoremap Y y$

" Column (:) mods
map ; :
map q; q:
map <LEADER>/ :!
map <LEADER>r :r !
map <LEADER>sr :%s/

" Save & quit
map Q :q<CR>
map S :w<CR>

" Open the vimrc file anytime
map <LEADER>rc :e ~/.vim/vimrc<CR>

" Insert Key
noremap h i
noremap H I

" Search
map <LEADER><CR> :nohlsearch<CR>
noremap = nzz
noremap - Nzz

" Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1

" Others
map <LEADER>o o<Esc>u

" ===                 ===
" === Cursor Movement ===
" ===                 ===

" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     i
" < j   l >
"     k
"     v

noremap j h
noremap i k
noremap k j

" I/K keys for 5 times i/k (faster navigation)
noremap I 5k
noremap K 5j
" J key: go to the start of the line
noremap J 0
" L key: go to the end of the line
noremap L $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" Ctrl + I or K will move up/down the view port without moving the cursor
noremap <C-I> 5<C-y>
noremap <C-K> 5<C-e>
inoremap <C-I> <Esc>5<C-y>a
inoremap <C-K> <Esc>5<C-e>a

" ===                   ===
" === Window management ===
" ===                   ===

" Use <space> + new arrow keys for moving the cursor around windows
map <LEADER>w <C-w>w
map <LEADER>j <C-w>h
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <LEADER>l <C-w>l

" Disabling the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

" Resize splits with arrow keys
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H


" ===                ===
" === Tab management ===
" ===                ===

" Create a new tab with tu
map tu :tabe<CR>

" Move around tabs with tj and tl
map tj :-tabnext<CR>
map tl :+tabnext<CR>

" Move the tabs with tmj and tml
map tmj :-tabmove<CR>
map tml :+tabmove<CR>

" ===                    ===
" === Other useful stuff ===
" ===                    ===

" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

" Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
map tx :r !figlet

" ===                               ===
" === Install Plugins with Vim-Plug ===
" ===                               ===

call plug#begin('~/.vim/plugged')

" Pretty Dress
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'bling/vim-bufferline'

call plug#end()



" ===                 ===
" === Dress up my vim ===
" ===                 ===
map <LEADER>c1 :set background=dark<CR>:colorscheme snazzy<CR>:AirlineTheme dracula<CR>
map <LEADER>c2 :set background=light<CR>:colorscheme ayu<CR>:AirlineTheme ayu_light<CR>

set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
colorscheme snazzy
let g:SnazzyTransparent = 1
set background=dark
let g:airline_theme='dracula'

let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

