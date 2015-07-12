" set string numeration
set nu
" set syntax highlighting
syntax on
" set color sheme
colorscheme badwolf 
" set default editor encoding
set encoding=utf-8
" for Vundle temporary disabling Vi compatibility
set nocompatible              " be iMproved, required
" default indentation
set tabstop=4
" default shifting
set shiftwidth=4
" converting tabs to spaces
set expandtab
" highlighting current line
set cursorline

" workaround for change current buffer
map gn :bn<cr>
map gp :bp<cr>

map gd :bd<cr> 


" Work with system clipboard
vnoremap <C-c> "*y 

set rtp+=~/.vim/bundle/Vundle.vim

" Vundle plugin settings
" https://github.com/VundleVim/Vundle.vim
filetype off                  " required
" setting vim runtime path
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" git
Plugin 'tpope/vim-fugitive'
" repeat any command by '.'
Plugin 'tpope/vim-repeat'
" autocomplete any command by Tab
Plugin 'ervandew/supertab'
" insert paired quotes, braces and etc
Plugin 'jiangmiao/auto-pairs'
" surrounding selected text by any tag, quotes and etc
Plugin 'tpope/vim-surround'
" make text commented 
Plugin 'tomtom/tcomment_vim'
" famous airline
Plugin 'bling/vim-airline'
" dirs tree at vim
Plugin 'scrooloose/nerdtree'
" any syntax supporting
Plugin 'scrooloose/syntastic'
" nerd tree git supporting
Plugin 'Xuyuanp/nerdtree-git-plugin'
" python autocompletion
Plugin 'davidhalter/jedi-vim'
call vundle#end()            " required
filetype plugin indent on    " required

" Displaying status line always
set laststatus=2

" NERDTree tuning
" automaticly run NERDTree at start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
" map NerdTree to Ctrl+N
map <C-n> :NERDTreeToggle<CR>
"
" close vim if nerd tree is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Airline tuning
let g:airline_theme='badwolf'
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

