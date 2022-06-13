syntax on
set number 
set noswapfile

" incremental case-insensitive search with highlight
set hlsearch
set ignorecase 
set incsearch 

" mouse on
set mouse=a

" jk send escape 
inoremap jk <ESC>

" use default leader backslash
let mapleader = "\\"

" set spell spelllang=en_us

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'bagrat/vim-buffet'
Plug 'airblade/vim-gitgutter' 
Plug 'tpope/vim-commentary'
Plug 'vim-ruby/vim-ruby'

call plug#end()

" leader f : fuzzy find files 
nnoremap <leader>f :FZF<CR>

" leader d : go to nerdtree on current file
nnoremap <leader>d :NERDTreeMirror<CR>:NERDTreeFind<CR>

" Start NERDTree when Vim is started without file arguments.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Tab : go to next tab
noremap <Tab> :bn<CR>
" Shift Tab : go to previous tab
noremap <S-Tab> :bp<CR>
" CRTL-W : close tab
noremap <C-w> :Bw<CR>

" display git gutter even without git changes
let g:gitgutter_sign_column_always = 1

" detect changes every 1 second
set updatetime=1000

