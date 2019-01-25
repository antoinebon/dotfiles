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

colorscheme Tomorrow-Night

" Treat wrapped lines as normal lines
nnoremap j gj
nnoremap k gk

" Let's make escape better, together.
inoremap jk <Esc>
inoremap JK <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>

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

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Yank(copy) to system clipboard
noremap <leader>y "+y

" remap Ultisnips for compatibility for YCM
let g:UltiSnipsExpandTrigger = '<C-b>'
let g:UltiSnipsJumpForwardTrigger = '<C-b>'
let g:UltiSnipsJumpBackwardTrigger = '<C-e>'


" UndoTree
nnoremap <Leader>u :GundoToggle<CR>

" Nerd Tree
unlet g:NERDTreeWinSize
let NERDTreeQuitOnOpen=1

" ctrlp
if isdirectory(expand("~/.config/nvim/plugged/ctrlp.vim/"))
    let g:ctrlp_working_path_mode = 'rw'
    let g:ctrlp_regexp = 1

    if executable('ag')
        " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
        let g:ctrlp_user_command =
                    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'
    endif

    " Mappings
    nmap <leader>l :CtrlP<CR>
    nmap <leader>lw :CtrlP<CR><C-\>w
    vmap <leader>lw :CtrlP<CR><C-\>v

    if isdirectory(expand("~/.vim/bundle/ctrlp-funky/"))
        " CtrlP extensions
        let g:ctrlp_extensions = ['funky']

        " funky
        nnoremap <Leader>lf :CtrlPFunky<Cr>
        " narrow the list down with a word under cursor
        nnoremap <Leader>lfw :execute 'CtrlPFunky ' .  expand('<cword>')<Cr>>)
    endif
endif

" augroup vimrc-python
"   autocmd!
"   autocmd FileType python setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
" augroup END
"
" Pymode
let g:pymode_rope_regenerate_on_write = 0

" Tagbar
nnoremap <silent> <F9> :TagbarToggle<CR> 

" Airline
let g:airline_theme='tomorrow'

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
