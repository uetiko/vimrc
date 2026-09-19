" File: plugins.vim
" Gestor: vim-plug  (https://github.com/junegunn/vim-plug)
" Instalar/actualizar:  :PlugInstall  /  :PlugUpdate  /  :PlugClean

" Autoinstala vim-plug si no esta presente todavia.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" --- Explorador de archivos ---
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" --- Interfaz ---
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" --- Git ---
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" --- Busqueda ---
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" --- Linting / diagnosticos (asincrono, sustituye a syntastic + vim-flake8) ---
Plug 'dense-analysis/ale'

" --- Tags (sustituye a xolox/vim-easytags + vim-misc) ---
Plug 'preservim/tagbar'
Plug 'ludovicchabant/vim-gutentags'

" --- Snippets ---
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" --- Lenguajes ---
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'rhysd/vim-clang-format'

" --- Sesiones ---
Plug 'manasthakur/vimsessionist'

" --- Otros ---
Plug 'wakatime/vim-wakatime'

call plug#end()

" plug#end() ya ejecuta 'filetype plugin indent on' y 'syntax enable'.
