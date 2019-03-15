set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-rooter' " cd working dir to git root dir automatically

" js related
" https://drivy.engineering/setting-up-vim-for-react/
Plug 'pangloss/vim-javascript'
Plug 'darthmall/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'

" python
Plug 'davidhalter/jedi-vim'

" rust
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

" CI
Plug 'martinda/Jenkinsfile-vim-syntax'

" Colors
Plug 'junegunn/seoul256.vim'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

syntax on
filetype plugin indent on

let g:seoul256_background = 233
colo seoul256

set cursorline
set number
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

" Keyboards shortcuts
" ============================================================================

"" Hardish mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
"" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" If I really really want to see feedback from showcmd
nmap <Space> \

nmap <leader>/ :Find<Enter>
nmap <leader>n :FZF<Enter>

" Fzf aka steroids for vim
" ============================================================================
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Swap
" =========
set nobackup
set nowb
set noswapfile

" Splits open bottom & right
set splitbelow splitright

" Wildmenu
" =========================
set wildmenu
set wildmode=list:longest,full
set showcmd


" Nerdtree
" =========
map <C-n> :NERDTreeToggle<CR>

let g:ale_linters = {'python': ['flake8'], 'c': []}
let g:jedi#popup_on_dot = 0

" Highlight excessive line length stand out
" https://www.youtube.com/watch?v=aHm36-na4-4
" Line length is based on 90ish idea from Hettinger; 80 + 10% = 88 chars
" https://www.youtube.com/watch?v=wf-BqAjZb8M
" ======================================================================
"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn', '\%81v', 100)
