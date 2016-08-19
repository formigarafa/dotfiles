
set nocompatible              " be iMproved, required
filetype on                   " to fix a wierd behaviour usin vi on mac. (not being able to commit)
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'tpope/vim-rails'
" Plugin 'FuzzyFinder'
" Plugin 'wincent/command-t'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdTree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'ryanoasis/vim-devicons'
Plugin 'majutsushi/tagbar'
Plugin 'leafgarland/typescript-vim'
Plugin 'rking/ag.vim'
Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

set ruler
set nowrap
set expandtab " spaces when press tab
set tabstop=2 " insert 2 spaces when tab pressed
set shiftwidth=2 " insert 2 spaces for identation

let mapleader = "\\"
map <space> <Leader>
set nobackup
set nowritebackup
set noswapfile
set showcmd
set incsearch

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" display extra whitespace (they might be copied to system clipboard using
" cmd+c)
" set list listchars=tab:»·,trail:·,nbsp:·

command W w !sudo tee % > /dev/null
syntax enable
set encoding=utf8
filetype plugin indent on

set t_Co=256
let g:molokai_original = 1
colorscheme molokai

let g:airline_powerline_fonts = 1
set laststatus=2

nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

set number
set numberwidth=5

"install fonts: https://github.com/hbin/top-programming-fonts
" mac
set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h14
" linux 
" set guifont=Sauce\ Code\ Pro\ 10

set guioptions=aegimt

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

" https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>w :w<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <Leader>1 :NERDTreeToggle<CR>
nmap <Leader>2 :TagbarToggle<CR>

nnoremap <leader><leader> <c-^>

set mouse=a

