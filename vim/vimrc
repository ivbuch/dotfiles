set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required


Plugin 'VundleVim/Vundle.vim'
Plugin 'surround.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-commentary.git' " simple comment/uncomment pluginlugin 'vim-airline/vim-airline-themes'

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

set noswapfile
set paste
syntax on
set hlsearch
set ignorecase
command FixSvnPaths %s/\s\/.*plugins/ plugins/
command FixIdeaPaths %s/^.*plugins/plugins/
vmap <F3> "+y
nmap <F3> "*yiw
map <S-F3> "*p
vmap <S-F3> "*p
inoremap jj <Esc>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>
nnoremap <S-E> :Explore<CR>
vmap X y/<C-R>"<CR>
set number

let g:airline_theme='dark'
set laststatus=2
set t_Co=256
colors darkblue
so /dotfiles/vim/user-functions.vim
set shiftwidth=2
set foldmethod=manual
set hidden

let g:netrw_liststyle = 3
