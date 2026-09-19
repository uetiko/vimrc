" File: pluginsConfig.vim
" Configuracion de cada plugin. Todo va protegido con comprobaciones para que
" un plugin que falte no rompa el arranque de Vim.

" Devuelve 1 si el plugin esta realmente cargado por vim-plug.
function! s:HasPlug(name) abort
    return exists('g:plugs') && has_key(g:plugs, a:name)
                \ && isdirectory(g:plugs[a:name].dir)
endfunction

" ---------------------------------------------------------------- NERDTree --
if s:HasPlug('nerdtree')
    " Abrir / cerrar el arbol
    nnoremap <C-n> :NERDTreeToggle<CR>
    nnoremap <F2>  :NERDTreeToggle<CR>
    " Situar el arbol en el archivo actual
    nnoremap <leader>n :NERDTreeFind<CR>

    let g:NERDTreeShowHidden = 1
    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeWinSize = 32
    let g:NERDTreeIgnore = ['\.pyc$', '\.class$', '\~$', '^__pycache__$',
                \ '^node_modules$', '^\.git$', '^target$']

    augroup nerdtree_config
        autocmd!
        " Abrir NERDTree cuando se arranca vim sin argumentos.
        autocmd StdinReadPre * let s:std_in = 1
        autocmd VimEnter *
                    \ if argc() == 0 && !exists('s:std_in') |
                    \     NERDTree |
                    \     wincmd p |
                    \ endif
        " Cerrar Vim si NERDTree es la unica ventana que queda.
        autocmd BufEnter *
                    \ if winnr('$') == 1
                    \ && exists('b:NERDTree')
                    \ && b:NERDTree.isTabTree() |
                    \     quit |
                    \ endif
    augroup END
endif

" ------------------------------------------------------ nerdtree-git-plugin --
if s:HasPlug('nerdtree-git-plugin')
    let g:NERDTreeGitStatusUseNerdFonts = 0
    let g:NERDTreeGitStatusIndicatorMapCustom = {
        \ 'Modified'  : '✹',
        \ 'Staged'    : '✚',
        \ 'Untracked' : '✭',
        \ 'Renamed'   : '➜',
        \ 'Unmerged'  : '═',
        \ 'Deleted'   : '✖',
        \ 'Dirty'     : '✗',
        \ 'Ignored'   : '☒',
        \ 'Clean'     : '✔︎',
        \ 'Unknown'   : '?',
        \ }
endif

" ----------------------------------------------------------------- airline --
if s:HasPlug('vim-airline')
    let g:airline_left_sep = '>'
    let g:airline_right_sep = '<'
    let g:airline_detect_modified = 1
    let g:airline_section_y = 'BN: %{bufnr("%")}'
    " Nota: airline_powerline_fonts requiere una fuente parcheada instalada
    " en el terminal. Si ves simbolos raros, ponlo a 0.
    let g:airline_powerline_fonts = 0
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#ale#enabled = 1
endif

if s:HasPlug('vim-airline-themes')
    let g:airline_theme = 'dark'
endif

" --------------------------------------------------------------------- ALE --
" Sustituye a syntastic, vim-flake8 y jedi-vim: linting y completado asincronos.
if s:HasPlug('ale')
    let g:ale_linters = {
        \ 'python':     ['flake8'],
        \ 'javascript': ['eslint'],
        \ 'typescript': ['eslint', 'tsserver'],
        \ 'rust':       ['cargo'],
        \ 'php':        ['php'],
        \ }
    let g:ale_fixers = {
        \ '*':          ['remove_trailing_lines', 'trim_whitespace'],
        \ 'python':     ['black', 'isort'],
        \ 'javascript': ['prettier'],
        \ 'typescript': ['prettier'],
        \ 'rust':       ['rustfmt'],
        \ }
    " Solo se ejecutan los linters cuyo binario existe en el sistema.
    let g:ale_linters_explicit = 1
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_insert_leave = 1
    let g:ale_lint_on_save = 1
    let g:ale_fix_on_save = 0
    let g:ale_sign_error = '>>'
    let g:ale_sign_warning = '--'
    let g:ale_completion_enabled = 1
    set omnifunc=ale#completion#OmniFunc

    nmap <silent> [g <Plug>(ale_previous_wrap)
    nmap <silent> ]g <Plug>(ale_next_wrap)
    nnoremap <F3> :ALEFix<CR>
    nnoremap <leader>d :ALEGoToDefinition<CR>
    nnoremap <leader>r :ALEFindReferences<CR>
endif

" ------------------------------------------------------------------ tagbar --
if s:HasPlug('tagbar')
    nnoremap <F8> :TagbarToggle<CR>
endif

" -------------------------------------------------------------- gutentags --
" Sustituye a xolox/vim-easytags, que no funciona con Universal Ctags.
if s:HasPlug('vim-gutentags')
    set tags=./tags;,tags
    let g:gutentags_ctags_tagfile = '.tags'
    let g:gutentags_cache_dir = expand('~/.vim/tags')
    if !isdirectory(g:gutentags_cache_dir)
        call mkdir(g:gutentags_cache_dir, 'p', 0700)
    endif
    let g:gutentags_ctags_exclude = ['node_modules', '.git', 'target',
                \ '__pycache__', 'venv', '.venv', 'dist', 'build']
endif

" --------------------------------------------------------------------- fzf --
if s:HasPlug('fzf.vim')
    " Sustituye a ctrlp: mismas teclas, backend fzf.
    nnoremap <C-p> :Files<CR>
    nnoremap <leader>b :Buffers<CR>
    nnoremap <leader>f :Rg<CR>
    nnoremap <leader>t :Tags<CR>
    let g:fzf_layout = { 'down': '40%' }
endif

" -------------------------------------------------------------- UltiSnips --
if s:HasPlug('ultisnips')
    " No se usa <Tab>: choca con el completado de ALE.
    let g:UltiSnipsExpandTrigger = '<C-j>'
    let g:UltiSnipsJumpForwardTrigger = '<C-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
endif

" ---------------------------------------------------------- vim-javascript --
if s:HasPlug('vim-javascript')
    let g:javascript_plugin_jsdoc = 1
    " El 'conceal' solo se activa en JS/TS, no de forma global.
    let g:javascript_conceal_function       = "ƒ"
    let g:javascript_conceal_null           = "ø"
    let g:javascript_conceal_this           = "@"
    let g:javascript_conceal_return         = "⇚"
    let g:javascript_conceal_undefined      = "¿"
    let g:javascript_conceal_NaN            = "ℕ"
    let g:javascript_conceal_prototype      = "¶"
    let g:javascript_conceal_static         = "•"
    let g:javascript_conceal_super          = "Ω"
    let g:javascript_conceal_arrow_function = "⇒"

    augroup javascript_config
        autocmd!
        autocmd FileType javascript setlocal foldmethod=syntax foldlevel=99
        autocmd FileType javascript,typescript setlocal conceallevel=1
    augroup END
endif

" --------------------------------------------------------- typescript-vim --
if s:HasPlug('typescript-vim')
    let g:typescript_indent_disable = 1
    let g:typescript_compiler_binary = 'tsc'
    let g:typescript_compiler_options = ''
    augroup typescript_config
        autocmd!
        " Solo se define makeprg si tsc esta realmente instalado.
        if executable('tsc')
            autocmd FileType typescript setlocal makeprg=tsc
        endif
        autocmd QuickFixCmdPost [^l]* nested cwindow
        autocmd QuickFixCmdPost l*    nested lwindow
    augroup END
endif

" ------------------------------------------------------------- phpcomplete --
if s:HasPlug('phpcomplete.vim')
    let g:phpcomplete_enhance_jump_to_definition = 1
    let g:phpcomplete_parse_docblock_comments = 1
    let g:phpcomplete_search_tags_for_variables = 1
    let g:phpcomplete_mappings = {
        \ 'jump_to_def':        '<C-B>',
        \ 'jump_to_def_split':  '<C-W><C-V>',
        \ 'jump_to_def_vsplit': '<C-W><C-/>',
        \ 'jump_to_def_tabnew': '<C-W><C-I>',
        \ }
endif

" ------------------------------------------------------------ clang-format --
if s:HasPlug('vim-clang-format') && executable('clang-format')
    let g:clang_format#style_options = {
                \ "AccessModifierOffset" : -4,
                \ "AllowShortIfStatementsOnASingleLine" : "true",
                \ "AlwaysBreakTemplateDeclarations" : "true",
                \ "Standard" : "C++11",
                \ "BreakBeforeBraces" : "Stroustrup"}
    augroup clang_format_config
        autocmd!
        autocmd FileType c,cpp ClangFormatAutoEnable
    augroup END
endif

" -------------------------------------------------------------- indentLine --
if s:HasPlug('indentLine')
    let g:indentLine_char = '|'
    " indentLine fuerza conceallevel=2 y oculta las comillas en JSON/Markdown.
    let g:indentLine_fileTypeExclude = ['json', 'markdown', 'nerdtree', 'help']
endif

" ------------------------------------------------------------- vim-gitgutter --
if s:HasPlug('vim-gitgutter')
    set updatetime=250
    highlight clear SignColumn
    highlight GitGutterAdd          ctermfg=green
    highlight GitGutterChange       ctermfg=yellow
    highlight GitGutterDelete       ctermfg=red
    highlight GitGutterChangeDelete ctermfg=yellow
endif

" ------------------------------------------------------------ vimsessionist --
" OJO: Vim carga los plugin/*.vim DESPUES de terminar el vimrc, asi que aqui
" todavia no existen sus mapeos. Por eso se configura mediante variables, que
" es lo que el plugin consulta al cargarse (patron 'if !exists(...)').
if s:HasPlug('vimsessionist')
    let g:sessionist_directory = expand('~/.vim/sessions')
    " Por defecto mapea SN/SS/SO/SP/SC/SL/SD en modo normal, lo que secuestra
    " la tecla S de Vim (sinonimo de cc). Se recolocan bajo <leader>s.
    let g:sessionist_new      = '<leader>sn'
    let g:sessionist_save     = '<leader>ss'
    let g:sessionist_open     = '<leader>so'
    let g:sessionist_previous = '<leader>sp'
    let g:sessionist_current  = '<leader>sc'
    let g:sessionist_list     = '<leader>sl'
    let g:sessionist_delete   = '<leader>sd'
endif
