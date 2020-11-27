"  __  __        __     _____ __  __ ____   ____
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/


" Author: @bone


"===
"=== Atto load for first time uses
"===
 if empty(glob('~/.vim/autoload/plug.vim'))
   silent !curl -flo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
 endif


" ====================
" === Editor Setup ===
" ====================


" ===        ===
" === System ===
" ===        ===
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8

set clipboard=unnamed

"Prevent incorrect backgroung rendering
let &t_ut=''


" ===                   ===
" === Main code display ===
" ===                   ===

set number
set relativenumber
syntax enable
syntax on

"Searching options
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" ===                ===
" === Basic Mappings ===
" ===                ===

" Set <LEADER> as <SPACE>
let mapleader=" "

"make F1 to control paste mode
set pastetoggle=<F1>

" Copy to system clipboard
vnoremap Y "+y

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
map <LEADER>sc :e ~/.vim/vimrc<CR>

" Insert Key
noremap h i
noremap H I

" Search
map <LEADER><CR> :nohlsearch<CR>
noremap = nzz
noremap - Nzz

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

" ===                               ===
" === Install Plugins with Vim-Plug ===
" ===                               ===

call plug#begin('~/.vim/plugged')

"===              ===
"=== Pretty Dress ===
"===              ===

Plug 'theniceboy/vim-deus'
Plug 'bling/vim-bufferline'
Plug 'bpietravalle/vim-bolt'
Plug 'vim-airline/vim-airline'

"===                    ===
"=== Editor Enhancement ===
"===                    ===

Plug 'junegunn/vim-peekaboo'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'

call plug#end()

" ===================== Start of Plugin Settings =====================

" ===                 ===
" === Dress up my vim ===
" ===                 ===

set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark    " Setting dark mode
colorscheme deus
let g:deus_termcolors=256
