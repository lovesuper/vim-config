set background=dark

"set string numeration
set nu
" set syntax highlighting
syntax on
" set color sheme
colorscheme badwolf 
set relativenumber
" set default editor encoding
set encoding=utf-8
" for Vundle temporary disabling Vi compatibility
set nocompatible              " be iMproved, required
" default indentation
set tabstop=4
" live refreshing
set autoread
" default shifting
set shiftwidth=4
" converting tabs to spaces
set expandtab
" highlighting current line
set cursorline
set foldmethod=syntax
" workaround for change current buffer
" set highlighting search results
set hlsearch
set nowrap
map gn :bn<cr>
map gp :bp<cr>

map gd :bd<cr> 
" dismiss search results by C-l
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Work with system clipboard
vnoremap <C-c> "*y 

set rtp+=~/.vim/bundle/Vundle.vim

" Vundle plugin settings
" https://github.com/VundleVim/Vundle.vim
filetype off                  " required
" setting vim runtime path
call vundle#begin()

"ultimate snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" XCode
Plugin 'toyamarinyon/vim-swift'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'kylef/apiblueprint.vim'
" session management
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'

" starting screen (does not work)
"Plugin 'mhinz/vim-startify'

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
"Plugin 'davidhalter/jedi-vim'
" fuzzy files search
Plugin 'kien/ctrlp.vim'
" visual indentations
" Plugin 'nathanaelkane/vim-indent-guides'
" plugin for autocompletion
Plugin 'Shougo/neocomplete.vim'
" vim shell
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'
" plugin for quick commentary
Plugin 'scrooloose/nerdcommenter'

call vundle#end()            " required
filetype plugin indent on    " required
let g:neocomplcache_enable_at_startup = 1
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
" augroup vimrc
"   au BufReadPre * setlocal foldmethod=indent
"   au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
" augroup END
"
"inoremap <F9> <C-O>za
"nnoremap <F9> za
"onoremap <F9> <C-C>za
:"\<Space>")<CR>
"vnoremap <Space> zf
"vnoremap <F9> zf
let NERDTreeIgnore = ['\.pyc$', '\.orig']
" let g:indent_guides_auto_colors = 0
" hi IndentGuidesOdd  ctermbg=black
" hi IndentGuidesEven ctermbg=darkgrey

" auto exit from insert mode
au CursorHoldI * stopinsert
au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
au InsertLeave * let &updatetime=updaterestore

" Setting up Python Mode
let g:pymode_paths = ["bin/py"]
let g:pymode_options_max_line_length = 100
let g:pymode_folding = 0
let g:pymode_rope_lookup_project = 0

" for vim session
let g:session_autoload="no" 
let g:session_directory = "~/develop/"
function! Wipeout()
    let l:buffers = range(1, bufnr('$'))
    let l:currentTab = tabpagenr()
        try
            let l:tab = 0
            while l:tab < tabpagenr('$')
                let l:tab += 1
                let l:win = 0
                while l:win < winnr('$')
                    let l:win += 1
                    let l:thisbuf = winbufnr(l:win)
                    call remove(l:buffers, index(l:buffers, l:thisbuf))
                endwhile
            endwhile
            if len(l:buffers)
                execute 'bwipeout' join(l:buffers)
            endif
        finally
            execute 'tabnext' l:currentTab
        endtry
endfunction


" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
