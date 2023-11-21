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
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'dyng/ctrlsf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-rails'
Plug 'rmagatti/auto-session'
Plug 'vim-scripts/AutoComplPop'
Plug 'mg979/vim-visual-multi'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dstein64/nvim-scrollview'
Plug 'karb94/neoscroll.nvim'

call plug#end()

lua require('neoscroll').setup()
lua require('auto-session').setup()
lua require('catppuccin').setup({flavour = 'mocha'})

set clipboard=unnamedplus
set noswapfile
" set completeopt=noinsert,menuone,noselect
" set wildmenu
set inccommand=split
set number
set updatetime=1000
set nowrap
"set paste # never use this: it breaks shortcuts using <tab>

" visible white spaces
set listchars=eol:¬,tab:»\ ,space:.
set list

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
" set spell spelllang=en_us

" incremental case-insensitive search with highlight
set hlsearch
set ignorecase
set incsearch

set termguicolors
set background=dark
set cursorline

" mouse on
set mouse=a

" colorscheme onedark
colorscheme catppuccin
filetype plugin indent on

" improve keyword matching using %. no need for Plug comes with vim but need
" to be enabled
runtime macros/matchit.vim

syntax on

" default leader \ uncomment below use ' as leader
" let mapleader = "'"

" also use space as leader
map <space> <Leader>

" Save in normal and inser mode using <Leader>S
inoremap <Leader>s <C-\><C-o>:w<CR>
noremap <Leader>s :w<CR>

" shortcuts
noremap <Leader>, :e ~/.config/nvim/init.vim<CR>
noremap <Leader>n :e ~/Desktop/today.txt<CR>
noremap <Leader>N :e ~/Desktop/vim-notes.txt<CR>

let g:airline_powerline_fonts = 1
let g:airline_theme = 'catppuccin'
let g:airline#extensions#tabline#enabled = 1

" jk send escape
inoremap jk <ESC>
inoremap kj <ESC>

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

let g:ctrlsf_auto_close = {"normal" : 0, "compact": 0}
let g:ctrlsf_auto_focus = {"at": "start"}
let g:ctrlsf_auto_preview = 1
let g:ctrlsf_context = '-B 1 -A 2'
let g:ctrlsf_search_mode = 'async'

nmap <Leader>f <Plug>CtrlSFPrompt
nmap <Leader>F <Plug>CtrlSFOpen
vmap <Leader>f <Plug>CtrlSFVwordPath

command FZFP execute 'FZF' s:find_git_root()

" leader t : fuzzy find files in project
nnoremap <leader>t :FZFP<CR>

" query, ag options, fzf#run options, fullscreen
autocmd VimEnter *
\ command! -bang -nargs=* Ag
\ call fzf#vim#ag(<q-args>, '', { 'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all' }, <bang>0)

" leader d : go to nerdtree on current file
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

let g:buffet_powerline_separators = 1

" If another buffer tries to replace NERDTree, put it in the other window, and
" bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Tab : go to next tab
noremap <Tab> :bn<CR>
" Shift Tab : go to previous tab
noremap <S-Tab> :bp<CR>
" leader Tab : close current tab
noremap <Leader><Tab> :Bw<CR>

" display git gutter even without git changes
let g:gitgutter_sign_column_always = 1

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-y>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>
