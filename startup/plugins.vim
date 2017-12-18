" vim: foldmethod=marker
" vim: foldcolumn=3


" Ag {{{1
let g:ackhighlight = 1
let g:ag_apply_qmappings = 1
let g:agprg = 'ag --nogroup --nocolor --column'
if executable('ag')
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m
endif
" }}}

" Airline {{{1
"- " Set no delay
"- set ttimeoutlen=50
"- 
"- autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()
"- 
"- " Taboo
"- let g:airline#extensions#taboo#enabled = 1
"- let g:taboo_tabline = 0
"- 
"- " Tabline
"- let g:airline#extensions#tabline#show_tab_nr = 1
"- let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
"- let g:airline#extensions#tabline#enabled = 1
"- let g:airline#extensions#tabline#show_buffers = 1
"- let g:airline#extensions#tabline#left_sep = ''
"- let g:airline#extensions#tabline#left_alt_sep = ''
"- let g:airline#extensions#tabline#right_sep = ''
"- let g:airline#extensions#tabline#right_alt_sep = ''
"- 
"- " Powerline symbols
"- if !exists('g:airline_symbols')
"-     let g:airline_symbols = {}
"- endif
"- let g:airline_left_sep = ''
"- let g:airline_left_alt_sep = ''
"- let g:airline_right_sep = ''
"- let g:airline_right_alt_sep = ''
"- let g:airline_symbols.branch = ''
"- let g:airline_symbols.readonly = ''
"- let g:airline_symbols.linenr = ''
"- let g:airline_symbols.whitespace = 'Ξ'
"- 
"- " QuickFix
"- let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
"- let g:airline#extensions#quickfix#location_text = 'Location'
"- 
"- " Buffer
"- let g:airline#extensions#bufferline#enabled = 1
"- let g:airline#extensions#bufferline#overwrite_variables = 1
"- 
"- " Fugitive
"- let g:airline#extensions#branch#enabled = 1
"- 
"- " Syntastic
"- let g:airline#extensions#syntastic#enabled = 1
"- 
"- " Tagbar
"- let g:airline#extensions#tagbar#enabled = 1
"- 
"- " CtrlP
"- let g:airline#extensions#ctrlp#color_template = 'replace'
"- let g:airline#extensions#ctrlp#show_adjacent_modes = 1
"- 
"- " Whitespace
"- let g:airline#extensions#whitespace#enabled = 1
"- let g:airline#extensions#whitespace#symbol = '!'
" }}}

" Easy Align {{{1
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}} Easy Align "

" Incsearch {{{1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" }}}

" Matchit {{{1
let loaded_mathit = 1
" }}}

" Matchmaker {{{1
let g:matchmaker_enable_startup = 0
nnoremap <leader>mm :<C-u>MatchmakerToggle<CR>
" }}}

" NERDTree {{{1
nnoremap <LEADER>nt :NERDTreeToggle<CR>
let g:NERDTreeWinPos='right'
"}}}

" NERDCommenter {{{1
" Add spaces after comment delimiter by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiter flush left instad of following code indent
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" }}}

" Syntastic {{{1
let g:syntastic_aggregate_errors         = 1
let g:syntastic_loc_list_height          = 5
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 0
let g:syntastic_check_on_open            = 1
let g:syntastic_auto_jump                = 0
let g:syntastic_enable_signs             = 1
let g:syntastic_error_symbol             = '✗'
let g:syntastic_style_error_symbol       = '※'
let g:syntastic_warning_symbol           = '★'
let g:syntastic_style_warning_symbol     = '☆'
let g:syntastic_enable_balloons          = 1
let g:syntastic_enable_highlighting      = 1
let g:pymode_lint_write                  = 0
let g:syntastic_stl_format               = '[%E{Err: %fe #%e}%B{,}%W{Warn: %fw #%w}]'
let g:syntastic_python_checkers          = ['flake8']
" let g:syntastic_tex_checkers = ['chktex']
let g:syntastic_tex_checkers = ['']

" Bad color, not visible
highlight link SyntasticErrorSign NeomakeErrorSign
highlight link SyntasticWarningSign NeomakeErrorSign
highlight link SyntasticStyleErrorSign NeomakeWarningSign
highlight link SyntasticStyleWarningSign NeomakeWarningSign

" E501: Line too long
" E841: Unused variable

let g:syntastic_python_flake8_args = '--ignore="
            \ E501,
            \ E401,
            \ E402,
            \ E841"'

"let g:syntastic_python_flake8_args = '--ignore="
"            \ E251,
"            \ F403,
"            \ E501,
"            \ E502,
"            \ E126,
"            \ E127,
"            \ E128,
"            \ W801,
"            \ W191,
"            \ E101,
"            \ F401,
"            \ E221,
"            \ E203,
"            \ E202,
"            \ E261,
"            \ E222,
"            \ E262"'
" }}}

" Taboo {{{1
let taboo_renamed_tab_format='[%l]%m'
let taboo_tab_format='%f%m'
" }}} Taboo "

" Flake8 {{{1
"let g:flake8_cmd="/opt/strangebin/flake8000"

let g:flake8_show_quickfix     = 1    " show (default)
let g:flake8_show_in_gutter    = 1    " show
let g:flake8_max_markers       = 500  " (default)
let g:flake8_error_marker      = 'EE' " set error marker to 'EE'
let g:flake8_warning_marker    = 'WW' " set warning marker to 'WW'
let g:flake8_pyflake_marker    = ''   " disable PyFlakes warnings
let g:flake8_complexity_marker = ''   " disable McCabe complexity warnings
let g:flake8_naming_marker     = ''   " disable naming warnings

" to use colors defined in the colorscheme
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg
" }}} Flake8

let python_highlight_all = 1
