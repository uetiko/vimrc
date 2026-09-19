" File: config.vim
" Ajustes generales del editor (sin dependencias de plugins).

" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" I like 4 spaces for indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set hidden
" enable indenting file
set autoindent
set cindent
set nolist
" set the commandheight
set cmdheight=2
" command line history
set history=100
" show cursor position
set ruler
" smart search
set ignorecase
set smartcase
set incsearch
set hlsearch
" utf8 encode
set encoding=utf-8
set fileencoding=utf-8

" filetype: se reactiva en plugins.vim mediante plug#end()
filetype off

syntax enable

" Terminal color
set cursorline
if has("gui_running")
    set guifont=Courier:h18
    set background=dark
    set t_Co=256
    silent! colorscheme moria
else
    silent! colorscheme default
endif
highlight CursorLine guibg=#003853 ctermbg=24 gui=none cterm=none

" vim directories
" Se crean si no existen para que 'backup' no falle en el primer arranque.
for s:dir in ['~/.vim/backup', '~/.vim/tmp', '~/.vim/undo']
    if !isdirectory(expand(s:dir))
        call mkdir(expand(s:dir), 'p', 0700)
    endif
endfor
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/tmp//
set undofile
set undodir=~/.vim/undo//

" status line
" Nota: vim-airline sobrescribe 'statusline'. Esto es el respaldo
" para cuando airline no esta instalado o esta desactivado.
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

" Ajustes por tipo de archivo.
" IMPORTANTE: los patrones van separados por comas SIN espacios. Un espacio
" corta la lista de patrones y Vim interpreta el resto como una orden.
augroup filetype_indent
    autocmd!
    autocmd FileType python,php
        \ setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=89
        \          expandtab autoindent fileformat=unix
    autocmd FileType javascript,typescript,html,css,json,yaml
        \ setlocal tabstop=2 softtabstop=2 shiftwidth=2 textwidth=89
        \          expandtab autoindent fileformat=unix
augroup END

" make my code look pretty
let python_highlight_all=1

" code limit
set colorcolumn=80
highlight ColorColumn ctermbg=yellow

"" otras configuraciones interesantes

" Navegacion entre ventanas
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Quitar el resaltado de la ultima busqueda
nnoremap <silent> <leader><space> :nohlsearch<CR>

"" set numbers
set number
set relativenumber
