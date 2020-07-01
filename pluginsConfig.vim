
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

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endi

" syntastic config

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

let g:syntastic_aggregate_errors = 1

"" AIRLINE
let g:airline_left_sep='>'
let g:airline_right_sep='<'
let g:airline_detect_modified=1
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline_theme='kolor'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"" YouCompletme config
let g:ycm_key_list_select_completion=['<C-n>, <Down>']
let g:ycm_key_list_previus_completion=['C-p', '<Up>']
let g:SuperTabDefaultCompletionType='<C-n>'

"" YCM config
let g:ycm_python_binary_path = 'python'

" tagbar config
nmap <F8> :TagbarToggle<CR>

" easytag config
:set tags=./tags;
:let g:easytags_dynamic_files = 1

" vim javascript config
let g:javascript_plugin_jsdoc = 1
set conceallevel=1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" vim flake8 config
autocmd FileType python map <buffer> <F3> :call flake8#Flake8()<CR>
let g:flake8_quickfix_height=7
 let g:flake8_show_in_file=1

" ctrlp config
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn|vevn|venv|node_modules)$',
    \ 'file': '\v\.(pyc|class|so|swp|swo)$',
    \}

" clang format

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"}
autocmd FileType c ClangFormatAutoEnable

" indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

"" typescript
let g:typescript_indent_disable = 1
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd FileType typescript :set makeprg=tsc

" phpcomplete
let g:phpcomplete_enhance_jump_to_definition=1
let g:phpcomplete_parse_docblock_comments=1
let g:phpcomplete_search_tags_for_variables=1

let g:phpcomplete_mappings = {
   \ 'jump_to_def': '<C-]>',
   \ 'jump_to_def_split': '<C-W><C-]>',
   \ 'jump_to_def_vsplit': '<C-W><C-\>',
   \ 'jump_to_def_tabnew': '<C-W><C-[>',
   \}
