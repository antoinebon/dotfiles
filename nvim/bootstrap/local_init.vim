set pastetoggle=<F1>                            " Toggle pastemode, doesn't indent
set hidden                                      " buffer change, more undo
set history=1000                                " default 20
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.  " Highlight problematic whitespace
" set cursorline                              " hilight cursor line
set scrolloff=3                             " lines above/below cursor
set showcmd                                 " show cmds being typed
set title                                   " window title
set wildmenu                                " better auto complete
set wildmode=list:longest,full              " bash-like auto complete
set shortmess+=I                                " disable startup message
set splitbelow                                  " splits go below w/focus
set splitright                                  " vsplits go right w/focus
" Folding
set foldcolumn=0                            " hide folding column
set foldmethod=indent                       " folds using indent
set foldnestmax=10                          " max 10 nested folds
set foldlevelstart=99                       " folds open by default
" Files
set noautowrite                                 " never autowrite
set confirm                                     " confirm changed files
set nobackup                                    " disable backups
set mouse=                                      " disable mouse

" Persistent undo. Requires Vim 7.3
if has('persistent_undo') && exists("&undodir")
    set undodir=$HOME/.vim/undo/            " where to store undofiles
    set undofile                            " enable undofile
    set undolevels=500                      " max undos stored
    set undoreload=10000                    " buffer stored undos
endif

" Treat wrapped lines as normal lines
nnoremap j gj
nnoremap k gk

" Let's make escape better, together.
inoremap jk <Esc>
inoremap JK <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>

" shortcuts for windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffers, preferred over tabs now with bufferline.
nnoremap gn :bnext<CR>
nnoremap gN :bprevious<CR>
nnoremap gd :bdelete<CR>
nnoremap gf <C-^>

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" Fold levels
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" Clear search
noremap <silent><leader>/ :nohls<CR>
" Paste in new line
nmap <leader>p o<ESC>p

" remap Ultisnips for compatibility for YCM
let g:UltiSnipsExpandTrigger = '<C-b>'
let g:UltiSnipsJumpForwardTrigger = '<C-b>'
let g:UltiSnipsJumpBackwardTrigger = '<C-e>'
