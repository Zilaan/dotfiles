" vim: foldmethod=marker
" vim: foldcolumn=3

" Ag {{{1
if executable('ag') 
" Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m
endif
" }}}

" Ale {{{1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = '✗'
let g:ale_echo_msg_warning_str = '⚠'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8'], 'matlab': ['mlint']}
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" }}}

" Airline {{{1
" Powerline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Set no delay
set ttimeoutlen=50

autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

" Taboo
let g:airline#extensions#taboo#enabled = 1
let g:taboo_tabline = 0

" Tabline
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.whitespace = 'Ξ'

" QuickFix
"let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'

" Buffer
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 1

" Fugitive
let g:airline#extensions#branch#enabled = 1

" Syntastic
let g:airline#extensions#syntastic#enabled = 1

" Ale
let g:airline#extensions#ale#enabled = 1

" Whitespace
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#symbol = '!'
" }}}

" Autoformater {{{1
noremap <F3> :Autoformat<CR>
" }}}

" NCM2 {{{1
if has('nvim')
    augroup NCM2
        autocmd!

        " Enable ncm2 for all buffers
        autocmd BufEnter * call ncm2#enable_for_buffer()

        " :help Ncm2PopupOpen for more information
        set completeopt=noinsert,menuone,noselect

        " When the <Enter> key is pressed while the popup menu is visible, it only
        " hides the menu. Use this mapping to close the menu and also start a
        " new line.
        inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
    augroup END
endif
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

" Rainbow {{{1
au FileType c,cpp,py,m call rainbow#load()
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
" }}}

let python_highlight_all = 1
