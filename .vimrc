set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'

call vundle#end()            " required
filetype plugin indent on    " required

set cursorline
set number

" Editing
" =======

" Tabs
set expandtab
set shiftwidth=4
set tabstop=4

" Disable retarded automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically delete all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e


" Moving
" ==========
" Hardish mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Swap
" =========
set nobackup
set nowb
set noswapfile


" Wildmenu
" =========================
set wildmenu
set wildmode=list:longest,full


" Nerdtree
" =========
map <C-n> :NERDTreeToggle<CR>


" Highlight excessive line length stand out
" https://www.youtube.com/watch?v=aHm36-na4-4
" Line length is based on 90ish idea from Hettinger; 80 + 10% = 88 chars
" https://www.youtube.com/watch?v=wf-BqAjZb8M
" ======================================================================
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
