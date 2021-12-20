
" I like 4 spaces for indenting
set ts=4
set tabstop=4
set expandtab
set shiftwidth=4
set smarttab
set hidden
" enable indenting file
set cindent
set ai
" Use Vim settings, rather then Vi settings (much better!).
set nocompatible
set nolist
set rnu
" set the commandheight
set cmdheight=2
" command line history
set history=100
" show cursor position
set ruler
" smart search
set scs
" utf8 encode
set encoding=utf-8
" filetype
filetype off

syntax on

" Terminal color
if has("gui_running")
    set guifont=Courier:h18
    set background=dark
    set t_Co=256
    set cursorline
    highlight CursorLine  guibg=#003853 ctermbg=24  gui=none cterm=none
    colors moria
else
    highlight CursorLine  guibg=#003853 ctermbg=24  gui=none cterm=none
    set cursorline
    colors default
endif

" vim directories
set backup
set backupdir=~/.vim/backup/
set dir=~/.vim/tmp/

" status line
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y] 
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L


fun! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfun

fun! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfun


au BufNewFile,BufRead *.py, *.php
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=89 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" make my code look pretty
let python_highlight_all=1


au BufNewFile,BufRead *.js, *.html, *.css, *.json, *.yml
    \ set tabstop=2 |
    \ set softtabstop=2 | 
    \ set shiftwidth=2
    \ set textwidth=89 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.ts
    \ set tabstop=2 |
    \ set softtabstop=2 | 
    \ set shiftwidth=2
    \ set textwidth=89 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
    \ set filetype=ts

" code limit
highlight ColorColumn ctermbg=yellow
let &colorcolumn=80
map <F4> :call UpdateTitle()<cr>'s


"" otras configuraciones interesantes

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" color schema vim
syntax enable
"" set numbres
set number relativenumber
