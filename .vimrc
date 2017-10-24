" File: .vimrc
" Autor: Uetiko
" Version: 0.3.1


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

" #########################################################
" # Python config
" #

" add pep8
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

"python with virtualenv support
"py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"       execfile(activate_this, dict(__file__=activate_this))
"       EOF

au BufNewFile,BufRead *.js, *.html, *.css, *.json
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

au BufNewFile,BufRead *.coffee 
    \ set tabstop=2 |
    \ set softtabstop=2 | 
    \ set shiftwidth=2
    \ set textwidth=89 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
    \ set filetype=coffee


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'ervandew/supertab'
Plugin 'shawncplus/phpcomplete.vim'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'wakatime/vim-wakatime'
Plugin 'klen/python-mode'
Plugin 'nvie/vim-flake8'
Plugin 'leafgarland/typescript-vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'rhysd/vim-clang-format'
Plugin 'davidhalter/jedi-vim'
Plugin 'mtscout6/vim-cjsx'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'yggdroot/indentline'
Plugin 'noahfrederick/vim-laravel'
Plugin 'stanangeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'joonty/vdebug'
Plugin 'benmills/vimux'
Plugin 'altercation/vim-colors-solarized'
Plugin 'justincampbell/vim-eighties'
Plugin 'wahidrahim/resize-font'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'webdevel/tabulous'
Plugin 'manasthakur/vimsessionist'


call vundle#end()            " required
filetype plugin indent on    " required

" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" " see :h vundle for more details or wiki for FAQ

"" Uetiko configs!
"" YouCompletme config
let g:ycm_key_list_select_completion=['<C-n>, <Down>']
let g:ycm_key_list_previus_completion=['C-p', '<Up>']
let g:SuperTabDefaultCompletionType='<C-n>'

"" YCM config
let g:ycm_python_binary_path = 'python'

"" ULTISNIPS
let g:UltiSnipsExpandTrigger="<tab>"
let g:UtilSnipsListSnippets="<C-tab>"
let g:UltiSnipsJumpForwardTrigger="<ALT-tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

let g:airline_left_sep='>'
let g:airline_right_sep='<'
let g:airline_detect_modified=1
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline_theme='dark'

"" typescript
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd FileType typescript :set makeprg=tsc


"" clang format
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"}

autocmd FileType c ClangFormatAutoEnable

"" nerdtree git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"" ignore for vimgrep

let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn|vevn|venv|node_modules)$',
    \ 'file': '\v\.(pyc|class|so|swp|swo)$',
    \}

"" coffeescript
augroup CoffeeBufNew
    autocmd User * set wrap
augroup END

" Switch back to the source buffer after updating.
let coffee_indent_keep_current = 1



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
