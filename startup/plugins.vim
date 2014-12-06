" vim: foldmethod=marker
" vim: foldcolumn=3

" Syntasic {{{1
	let g:syntastic_auto_loc_list=1
	let g:syntastic_check_on_open=1
	let g:syntastic_auto_jump=2
	let g:syntastic_enable_signs=1
	let g:syntastic_error_symbol='✗'
	let g:syntastic_warning_symbol='⚠'
	let g:syntastic_enable_balloons=1
	let g:syntastic_enable_highlighting=1
	let g:pymode_lint_write=0
	let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{,}%W{Warn: %fw #%w}]'
	let g:syntastic_python_checkers = ['flake8']
	let g:syntastic_python_flake8_args = '--ignore="E251,F403,E501,E502,E126,E127,E128,W801,W191,E101,F401,E221,E203,E202,E261,E222,E262"'
" }}}

" NERDTree {{{1
	nmap <LEADER>nt :NERDTreeToggle<CR>
	let g:NERDTreeWinPos='right'
"}}}

" Inställningar för SkyBison {{{1
	nnoremap <space>e :<c-u>call SkyBison("e ")<cr>
	nnoremap <space>cd :<c-u>call SkyBison("cd ")<cr>
	nnoremap <space>h :<c-u>call SkyBison("h ")<cr>
	nnoremap <space>; :<c-u>call SkyBison("")<cr>
	nnoremap <space>b :<c-u>call SkyBison("b ")<cr>
	nnoremap <space>t :<c-u>call SkyBison("tag ")<cr>
	let g:skybison_fuzz=1
"}}}

" CtrlP {{{1

	" Mapping {{{2
		nnoremap <leader>p :CtrlP<cr>
		nnoremap <leader>cd :CtrlPDir<cr>
		nnoremap <leader>li :CtrlPLine<cr>
		nnoremap <leader>m :CtrlPMixed<cr>
		nnoremap <leader>b :CtrlPBuffer<cr>
		nnoremap <leader>q :CtrlPQuickfix<cr>
		let g:ctrlp_map='<Leader>cf'
	" }}}

	" Ignore {{{2
		set wildignore+=*/Dropbox/*,*/tmp/*,*.so,*.eps,*.swp,*.zip,*.jpegs,*.swp,*.jpeg,*.eps,*.gz,*.xls,*.pdf,*.mat,*.xlsx,*.png,*.gz,*.out,*.rar,*.zip,*.mp4,*.tiff,*.bmp,*.gif,*.pyc,*.jpg,*.wav,*.mp3,*.ogg,*.blend,*.aux,*.log,*.toc,*.blg,*.db,*.rdp,*.epf,*.eps,*.prj,*.h,
		"let g:ctrlp_custom_ignore='\v\~$|\.(o|swp|jpeg|docx|doc|eps|gz|xls|pdf|m|mat|xlsx|png|gz|out|rar|zip|mp4|tiff|bmp|gif|pyc|jpg|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|^Dropbox.*'

		let g:ctrlp_custom_ignore = {
			\ 'dir': '\v[\/]\.(git|hg|svn|bzr)$|.*Dropbox.*',
			\ 'file': '\v\.(o|swp|jpeg|docx|doc|eps|gz|xls|pdf|mat|xlsx|png|gz|out|rar|zip|mp4|tiff|bmp|gif|pyc|jpg|wav|mp3|ogg|blend|nb|pptx|gdoc|rtf|plist)$'}
	" }}}

	" Settings {{{2
		let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'
		let g:ctrlp_match_window_bottom=0
		let g:ctrlp_match_window_reversed=0
		let g:ctrlp_working_path_mode=0
		let g:ctrlp_dotfiles=0
		let g:ctrlp_switch_buffer='Et'
		let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
		let g:ctrlp_use_caching = 1
		let g:ctrlp_max_depth = 100
		let g:ctrlp_clear_cache_on_exit = 0
		let g:ctrlp_extensions=['tag', 'buffertag', 'quickfix', 'dir', 'undo', 'line', 'changes', 'mixed', 'bookmardir', 'rtscript']
		let g:ctrlp_buftag_ctags_bin='/usr/local/bin/ctags'
		let g:ctrlp_mruf_max = 10

		"Use "ag" for searching
		if executable('ag')
		"Use Ag over Grep
			set grepprg=ag\ --nogroup\ --nocolor
			let g:ctrlp_user_command = 'ag %s -l --nocolor
						\ --ignore-dir Dropbox
						\ --ignore-dir Arduino
						\ --ignore-dir Arduino_Build
						\ -g  ""'
		endif
	" }}}
" }}}

" Taglist {{{1
	filetype plugin on
	let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
	nnoremap <c-t> :TlistToggle<cr>
	let Tlist_Auto_Open=0

	" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
	filetype plugin on

	" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
	" can be called correctly.
	" set shellslash

	" IMPORTANT: grep will sometimes skip displaying the file name if you
	" search in a singe file. This will confuse Latex-Suite. Set your grep
	" program to always generate a file-name.
	set grepprg=grep\ -nH\ $*

	" OPTIONAL: This enables automatic indentation as you type.
	filetype indent on

	" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
	" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
	" The following changes the default filetype back to 'tex':
	let g:tex_flavor='latex'
	let g:Tex_TreatMacViewerAsUNIX=1
	let g:Tex_ExecuteUNIXViewerInForeground=1
	let g:Tex_ViewRule_pdf='open -a /Applications/Preview.app'
	let g:Tex_MultipleCompileFormats='pdf'
" }}}

" NeoComplete {{{1
	" Note: This option must set it in .vimrc(_vimrc). NOT IN .gvimrc(_gvimrc)!
	" Disable AutoComplPop.
	let g:acp_enableAtStartup=0
	" Use neocomplete.
	let g:neocomplete#enable_at_startup=1
	" Use smartcase.
	let g:neocomplete#enable_smart_case=1
	" Set minimum syntax keyword length.
	let g:neocomplete#sources#syntax#min_keyword_length=3
	let g:neocomplete#lock_buffer_name_pattern='\*ku\*'

	" Define dictionary.
	let g:neocomplete#sources#dictionary#dictionaries={
				\ 'default' : '',
				\ 'vimshell' : $HOME.'/.vimshell_hist',
				\ 'scheme' : $HOME.'/.gosh_completions'
		\ }

	" Define keyword.
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns={}
	endif
	let g:neocomplete#keyword_patterns['default']='\h\w*'

	" Plugin key-mappings.
	inoremap <expr><C-g>   neocomplete#undo_completion()
	inoremap <expr><C-l>   neocomplete#complete_common_string()

	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
		return neocomplete#close_popup() . "\<CR>"
		" For no inserting <CR> key.
		"return pumvisible() ? neocomplete#close_popup() : "\<CR>"
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y> neocomplete#close_popup()
	inoremap <expr><C-e> neocomplete#cancel_popup()
	" Close popup by <Space>.
	" inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

	" For cursor moving in insert mode(Not recommended)
	" inoremap <expr><Left> neocomplete#close_popup() . "\<Left>"
	" inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
	" inoremap <expr><Up>  neocomplete#close_popup() . "\<Up>"
	" inoremap <expr><Down> neocomplete#close_popup() . "\<Down>"
	" Or set this.
	" let g:neocomplete#enable_cursor_hold_i=1
	" Or set this.
	" let g:neocomplete#enable_insert_char_pre=1

	" AutoComplPop like behavior.
	" let g:neocomplete#enable_auto_select=1

	" Shell like behavior(not recommended).
	" set completeopt+=longest
	" let g:neocomplete#enable_auto_select=1
	autocmd BufReadPost *.tex let g:neocomplete#disable_auto_complete=1
	" inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

	" Enable omni completion.
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

	" Enable heavy omni completion.
	if !exists('g:neocomplete#sources#omni#input_patterns')
		let g:neocomplete#sources#omni#input_patterns={}
	endif
	" let g:neocomplete#sources#omni#input_patterns.php='[^. \t]->\h\w*\|\h\w*::'
	" let g:neocomplete#sources#omni#input_patterns.c='[^.[:digit:] *\t]\%(\.\|->\)'
	" let g:neocomplete#sources#omni#input_patterns.cpp='[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

	" For perlomni.vim setting.
	" https://github.com/c9s/perlomni.vim
	let g:neocomplete#sources#omni#input_patterns.perl='\h\w*->\h\w*\|\h\w*::'
	let g:neocomplete#ctags_command='/usr/local/bin/ctags'
" }}}

" Gundo {{{1
	nnoremap <F5> :GundoToggle<CR>
	let g:gundo_right=1
" }}}

" Indent Guides {{{1
	" Enable Indent Guides
	let g:indent_guides_enable_on_vim_startup = 0

	" Number of indent levels
	let g:indent_guides_indent_levels = 30

	" Auto colors
	let g:indent_guides_auto_colors = 1

	" Size of guides
	let g:indent_guides_guide_size = 1

	" Start at level
	let g:indent_guides_start_level = 2

	" Disable for filetypes
	let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

	" Default mapping <Leader>ig
	let g:indent_guides_default_mapping = 1
" }}}

" Matchit {{{1
	let loaded_mathit = 1
" }}}

" Poweline {{{1
	let g:Powerline_symbols='fancy'
	let g:Powerline_mode_n = 'N'
" }}}

" Ag {{{
	let g:ackhighlight = 1
	let g:ag_apply_qmappings = 1
	let g:agprg = 'ag --nogroup --nocolor --column'
	if executable('ag')
		" Note we extract the column as well as the file and line number
		set grepprg=ag\ --nogroup\ --nocolor\ --column
		set grepformat=%f:%l:%c%m
	endif
" }}}

" Ack {{{
	let g:ackhighlight = 1
" }}}

" Arduino {{{
	" How to interpret files
	augroup filetype_arduino
		autocmd!
		au BufRead, BufNewFile *.pde set filetype=arduino
		au BufRead, BufNewFile *.ino set filetype=arduino
	augroup END
" }}}

" Airline {{{
	" Set no delay
	set ttimeoutlen=50
	" Theme
	let g:airline_theme = 'powerlineish'
	" Tabline
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#show_buffers = 1
	let g:airline#extensions#tabline#left_sep = ''
	let g:airline#extensions#tabline#left_alt_sep = ''
	let g:airline#extensions#tabline#right_sep = ''
	let g:airline#extensions#tabline#right_alt_sep = ''

	" Powerline symbols
	if !exists('g:airline_symbols')
		let g:airline_symbols = {}
	endif
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.branch = ''
	let g:airline_symbols.readonly = ''
	let g:airline_symbols.linenr = ''
	let g:airline_symbols.whitespace = 'Ξ'

	" QuickFix
	let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
	let g:airline#extensions#quickfix#location_text = 'Location'

	" Buffer
	let g:airline#extensions#bufferline#enabled = 1
	let g:airline#extensions#bufferline#overwrite_variables = 1

	" Fugitive
	let g:airline#extensions#branch#enabled = 1

	" Syntastic
	let g:airline#extensions#syntastic#enabled = 1

	" Tagbar
	let g:airline#extensions#tagbar#enabled = 1

	" CtrlP
	let g:airline#extensions#ctrlp#color_template = 'replace'
	let g:airline#extensions#ctrlp#show_adjacent_modes = 1

	" Whitespace
	let g:airline#extensions#whitespace#enabled = 1
	let g:airline#extensions#whitespace#symbol = '!'
" }}}

" Better whitespace {{{
	nnoremap <Leader>w :StripWhitespace<CR>
	let g:strip_whitespace_on_save = 0
" }}}

" Matchmaker {{{
	let g:matchmaker_enable_startup = 0
	nnoremap <leader>mm :<C-u>MatchmakerToggle<CR>
" }}}

" Rainbow parentheses {{{
	" Set colors
	let g:rbpt_colorpairs = [
		\ ['brown',       'RoyalBlue3'],
		\ ['Darkblue',    'SeaGreen3'],
		\ ['darkgray',    'DarkOrchid3'],
		\ ['darkgreen',   'firebrick3'],
		\ ['darkcyan',    'RoyalBlue3'],
		\ ['darkred',     'SeaGreen3'],
		\ ['darkmagenta', 'DarkOrchid3'],
		\ ['brown',       'firebrick3'],
		\ ['gray',        'RoyalBlue3'],
		\ ['black',       'SeaGreen3'],
		\ ['darkmagenta', 'DarkOrchid3'],
		\ ['Darkblue',    'firebrick3'],
		\ ['darkgreen',   'RoyalBlue3'],
		\ ['darkcyan',    'SeaGreen3'],
		\ ['darkred',     'DarkOrchid3'],
		\ ['red',         'firebrick3'],
		\ ]

	let g:rbpt_max = 16
	let g:rbpt_loadcmd_toggle = 0
	au VimEnter * RainbowParenthesesToggle
	au Syntax * RainbowParenthesesLoadRound
	au Syntax * RainbowParenthesesLoadSquare
	au Syntax * RainbowParenthesesLoadBraces
" }}}

" Incsearch {{{
	map /  <Plug>(incsearch-forward)
	map ?  <Plug>(incsearch-backward)
	map g/ <Plug>(incsearch-stay)
" }}}
