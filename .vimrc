" ### Vundle plugin settings ###
set rtp+=~/.vim/bundle/Vundle.vim
filetype off
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" session management
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'

Plugin 'terryma/vim-multiple-cursors'
Plugin 'kylef/apiblueprint.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'

" git supporting
Plugin 'tpope/vim-fugitive'

" Repeat any command by '.'
Plugin 'tpope/vim-repeat'

" Autocomplete any command by Tab
Plugin 'ervandew/supertab'

" Inserting paired quotes, braces and etc
Plugin 'jiangmiao/auto-pairs'

" Surrounding selected text by any tag, quotes and etc
Plugin 'tpope/vim-surround'

" Make code commented
Plugin 'tomtom/tcomment_vim'

" Any syntax supporting
Plugin 'scrooloose/syntastic'

" Nerd tree git supporting
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Fuzzy files search
Plugin 'kien/ctrlp.vim'

" Plugin for autocompletion
Plugin 'Shougo/neocomplete.vim'

" plugin for quick commentary
Plugin 'scrooloose/nerdcommenter'

Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on

set nu
syntax on
colorscheme thaumaturge
" set listchars=tab:͢͢–,trail:•,extends:>,precedes:<,space:•
set list
set encoding=utf8
" for Vundle temporary disabling Vi compatibility set nocompatible be iMproved, required
set tabstop=2
" default shifting
set shiftwidth=2
" converting tabs to spaces
set expandtab
" highlighting current line
set cursorline
"set foldmethod=syntax
set hlsearch
set nowrap
" workaround for change current buffer
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

match ErrorMsg '\s\+$'
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

" dismiss search results by C-l
nnoremap <silent> <C-l> :nohl<CR><C-l>
" Work with system clipboard
vnoremap <C-c> "*y

"let g:neocomplcache_enable_at_startup = 1
" Displaying status line always
set laststatus=2

" ### NERDTree tuning

" automaticly run NERDTree at start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if nerd tree is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.pyc$', '\.orig']

" ### Airline tuning
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Setting up Python Mode PyMode (Klen)
"let g:pymode_paths = ["bin/py"]
"let g:pymode_options_max_line_length = 100
"let g:pymode_folding = 0
"let g:pymode_rope_lookup_project = 0

" For vim session
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

" autotrim whitespaces
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
