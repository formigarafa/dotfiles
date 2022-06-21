syntax on
filetype plugin indent on
set number 
set noswapfile

" incremental case-insensitive search with highlight
set hlsearch
set ignorecase 
set incsearch 

" mouse on
set mouse=a

"" use default leader backslash
" let mapleader = "\\"

" use leader '
let mapleader = "'"

" set spell spelllang=en_us

" visible white spaces
set listchars=eol:¬,tab:»\ ,space:.
set list

" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2


noremap <Leader>, :e ~/.config/nvim/init.vim<CR>

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'bagrat/vim-buffet'
Plug 'airblade/vim-gitgutter' 
Plug 'tpope/vim-commentary'
Plug 'vim-ruby/vim-ruby'
Plug 'joshdick/onedark.vim'
Plug 'kana/vim-arpeggio'
" Plug 'dyng/ctrlsf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

" to test
" mg979/vim-visual-multi
"

call plug#end()

set termguicolors
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_diff_background = 1
set background=dark
set cursorline
colorscheme onedark
let g:airline_powerline_fonts = 1

" jk send escape 
" inoremap jk <ESC>
" inoremap kj <ESC>
call arpeggio#map('i', '', 1, 'jk', '<Esc>')

" Save in normal and inser mode using <Leader>S
inoremap <Leader>s <C-\><C-o>:w<CR>
noremap <Leader>s :w<CR>

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" nmap <Leader>t <Plug>CtrlSFPrompt
noremap <Leader>f :Ag 

command FZFP execute 'FZF' s:find_git_root()

" leader f : fuzzy find files in project
nnoremap <leader>t :FZFP<CR>

" query, ag options, fzf#run options, fullscreen
autocmd VimEnter *
\ command! -bang -nargs=* Ag
\ call fzf#vim#ag(<q-args>, '', { 'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all' }, <bang>0)

" leader d : go to nerdtree on current file
" nnoremap <leader>d :NERDTreeMirror<CR>:NERDTreeFind<CR>
nnoremap <leader>D :NERDTreeMirror<CR>:NERDTreeToggle<CR>

nnoremap <Leader>d :call SmartNERDTree()<CR>

fun! s:IsCurrentWindowNERDTree()
  return exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) == winnr()
endfun

function! SmartNERDTree()                   
  if @% == ""
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
      NERDTreeToggle
    else
      NERDTreeVCS
    endif
  else
    if s:IsCurrentWindowNERDTree()
      NERDTreeClose
    else
      NERDTreeFind
    endif
  endif
endfun 

let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusConcealBrackets = 1

" If another buffer tries to replace NERDTree, put it in the other window, and
" bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

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
" noremap <C-w> :Bw<CR>

" display git gutter even without git changes
let g:gitgutter_sign_column_always = 1

" detect changes every 1 second
set updatetime=1000

runtime macros/matchit.vim

