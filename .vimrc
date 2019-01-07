set nocompatible              " be iMproved, required
syntax on
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" js related
" https://drivy.engineering/setting-up-vim-for-react/
Plugin 'pangloss/vim-javascript'
Plugin 'darthmall/vim-vue'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'hail2u/vim-css3-syntax'

" python
Plugin 'davidhalter/jedi-vim'

" CI
Plugin 'martinda/Jenkinsfile-vim-syntax'

Plugin 'romainl/Apprentice'
Plugin 'kiddos/malokai.vim'

call vundle#end()            " required
filetype plugin indent on    " required

set cursorline
set number
"For some reason this is not set by default in macos
set ruler

" Focus mode on high res screens i.e center text in terminal
map <leader>f :Goyo \| set linebreak<CR>

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='minimalist'

" Editing
" =======

" Tabs
set expandtab
set shiftwidth=4
set tabstop=4
colorscheme malokai

" Disable retarded automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically delete all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Wrap Markdown at 80 chars
autocmd BufRead,BufNewFile *.md set tw=80

" Allow JSX syntax in normal .js files
let g:jsx_ext_required = 0

" https://www.npmjs.com/package/standard
autocmd Filetype javascript setlocal sw=2 sts=2 expandtab

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

" Splits open bottom & right
set splitbelow splitright

" Fzf
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
nmap <leader>n :FZF<Enter>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

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

let g:ale_linters = {'python': ['flake8']}
let g:jedi#popup_on_dot = 0

" Highlight excessive line length stand out
" https://www.youtube.com/watch?v=aHm36-na4-4
" Line length is based on 90ish idea from Hettinger; 80 + 10% = 88 chars
" https://www.youtube.com/watch?v=wf-BqAjZb8M
" ======================================================================
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
