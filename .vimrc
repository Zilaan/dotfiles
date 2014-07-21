" vim: foldmethod=marker
" vim: foldcolumn=3

" Annat {{{1
call pathogen#infect()
set t_Co=256

if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
set backspace=2
set nocompatible
set langmenu=none
set fileencodings=ucs-bom,utf-8,default,latin1
set guitablabel=%M%t
set helplang=sv
set mouse=a
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error
set termencoding=utf-8
let g:Powerline_symbols='fancy'

" Sätt "," som <leader>
let mapleader=","

" Text, färg och utseende {{{1

" Välj typsnitt
"set gfn=Menlo\ Regular:h15
set gfn=Sauce\ Code\ Powerline:h15

" Välj färgschema
let g:hybrid_use_iTerm_colors = 1
colo hybrid

" Sätt på syntaxfärg
syntax on

" Visa aktuell rad
set cul

" Visa aktuell kolumn
" set cuc

" Toggla highlight searh
map <leader>hl :set hlsearch! <CR>

" Set no higligh
map <leader>nhl :set nohlsearch <CR>


" Rader, tabbar och indrag relaterad {{{1

" Sätt på radnumrering
set number

" Statusbar ska alltid vara på
set laststatus=2

" Slå på radbrytning
set wrap

" Ingen radbrytning vid ord
set linebreak

" Textvikningsmetod ska va syntaxberoende
set fdm=syntax

" Textvikning ska va fönsterberoende
set textwidth=0

" 1 tab ska va 4 mellanslag
set ts=4
set sts=4
set sw=4
set noexpandtab

" Sökning ska ske i realtid
set incsearch

" Markera alla sökta ord
set hlsearch

" Slå på automatisk styckeindrag
set autoindent

" Styckeindrag ska göras som i C-programmering
set cindent

" Sätt på list
set list

" Kortkommando för list
nmap <leader>l :set list!<CR>

" Inställningar för list
set listchars=eol:¬,extends:»,tab:\|\ ,trail:›

" Börja 'linebreak' med …
set showbreak=…

" Inställningar för Syntasic {{{1

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

" Inställningar för Python {{{1

autocmd BufReadPost *.py :map <F2> :!python3.3 % <CR>
autocmd FileType python set ts=4
" Inställningar för LaTex {{{1

autocmd BufReadPost *.tex :map <F2> :!pdflatex % <CR>
autocmd BufReadPost *.tex :map <F3> :!bibtex %:r <CR>

" C-kompilator {{{1

autocmd BufReadPost *.c :map <F4> :!gcc % <CR>

" Kortkommando för NERDTree {{{1

nmap <LEADER>nt :NERDTreeToggle<CR>
let g:NERDTreeWinPos='right'

" Inställningar för SkyBison {{{1

nnoremap <space>e :<c-u>call SkyBison("e ")<cr>
nnoremap <space>cd :<c-u>call SkyBison("cd ")<cr>
nnoremap <space>h :<c-u>call SkyBison("h ")<cr>
nnoremap <space>; :<c-u>call SkyBison("")<cr>
nnoremap <space>b :<c-u>call SkyBison("b ")<cr>
nnoremap <space>t :<c-u>call SkyBison("tag ")<cr>
let g:skybison_fuzz=1

" Inställningar för CommandT {{{1

nnoremap <space>ct :CommandT ~/Documents/<CR>

" Inställningar för CtrlP {{{1
" Mapping {{{2
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>cd :CtrlPDir<cr>
nnoremap <leader>li :CtrlPLine<cr>
nnoremap <leader>m :CtrlPMixed<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>q :CtrlPQuickfix<cr>
let g:ctrlp_map='<Leader>cf'

" Ignore {{{2
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpegs,*.swp,*.jpeg,*.eps,*.gz,*.xls,*.pdf,*.m,*.mat,*.xlsx,*.png,*.gz,*.out,*.rar,*.zip,*.mp4,*.tiff,*.bmp,*.gif,*.pyc,*.jpg,*.wav,*.mp3,*.ogg,*.blend,*.aux,*.log,*.toc,*.blg,*.db,*.rdp,*.epf,*.eps,*.prj,*.m,*.h,*.ino
let g:ctrlp_custom_ignore='\v\~$|\.(o|swp|jpeg|docx|doc|eps|gz|xls|pdf|m|mat|xlsx|png|gz|out|rar|zip|mp4|tiff|bmp|gif|pyc|jpg|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'

" Settings {{{2
" Where to disable CtrlP
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
let g:ctrlp_user_command = 'find %s -type f'

" Inställningar för supertab {{{1

"let g:SuperTabMappingForward='<A-space>'
"let g:SuperTabMappingBackward='<s-space>'

" För Taglist {{{1

filetype plugin on
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
nnoremap <c-t> :TlistToggle<cr>
let Tlist_Auto_Open=1

" Andra kortkommandon {{{1

" Navigering
map <C-H> <C-W>h<C-W>
map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>
map <C-L> <C-W>l<C-W>


nmap j gj
nmap k gk
nmap <left> g<s-^>
nmap <right> g$
nmap <s-left> <s-^>
nmap <s-right> $

vmap j gj
vmap k gk
vmap 9 g<s-^>
vmap 0 g$
vmap <leader>0 0

" Avmappa piltangenterna
" no <left> <Nop>
" no <right> <Nop>
ino <down> <Nop>
" ino <left> <Nop>
" ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

" Flytta rader med piltangenterna
nmap <up> ddkP
nmap <down> ddp

" Flytta flera rader
vmap <down> xp`[V`]
vmap <up> xkP`[V`]

" Radera paranteser och annat
nmap ds{ F{xf}x
nmap cs{ F{xf}xi
nmap ds" F"x,x
map cs" F"x,xi
nmap ds' F'x,x
nmap cs' F'x,xi
nmap ds( F(xf)x
nmap cs( F(xf)xi
nmap ds) F(xf)x
nmap cs) F(xf)xi


" Autocentrering
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

" Skapa par av citat och annat
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i

" Återmarkera för indentering
vnoremap > >gv
vnoremap < <gv



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

" Gundo {{{1
nnoremap <F5> :GundoToggle<CR>
let g:gundo_right=1

" QuickFix window {{{1
au FileType qf call AdjustWindowHeight(2, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0

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

" Matchit {{{1
let loaded_mathit = 1

" Poweline {{{1
let g:Powerline_mode_n = 'N'
