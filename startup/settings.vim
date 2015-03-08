" Author: Raman Haddad
"
" vim: foldmethod=marker
" vim: foldcolumn=3

" General settings {{{
	set tags=~/tags
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
" }}}

	" Disable gui {{{
	if has('gui_running')
		" GUI Vim

		set guifont=Meslo\ LG\ DZ\ Regular\ for\ Powerline:h12

		" Remove all the UI cruft
		set go-=T
		set go-=l
		set go-=L
		set go-=r
		set go-=R

		highlight SpellBad term=underline gui=undercurl guisp=Orange

		if has("gui_macvim")
			" Full screen means FULL screen
			set fuoptions=maxvert,maxhorz

			" Use the normal HIG movements, except for M-Up/Down
			let macvim_skip_cmd_opt_movement = 1
			no   <D-Left>       <Home>
			no!  <D-Left>       <Home>
			no   <M-Left>       <C-Left>
			no!  <M-Left>       <C-Left>

			no   <D-Right>      <End>
			no!  <D-Right>      <End>
			no   <M-Right>      <C-Right>
			no!  <M-Right>      <C-Right>

			no   <D-Up>         <C-Home>
			ino  <D-Up>         <C-Home>
			imap <M-Up>         <C-o>{

			no   <D-Down>       <C-End>
			ino  <D-Down>       <C-End>
			imap <M-Down>       <C-o>}

			imap <M-BS>         <C-w>
			inoremap <D-BS>     <esc>my0c`y
		else
			" Non-MacVim GUI, like Gvim
		end
	else
		" Console Vim
		" For me, this means iTerm2, possibly through tmux

		" Mouse support
		set mouse=a
	endif

" }}}

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

	" Inställningar för list
	set listchars=eol:¬,extends:»,tab:\|\ ,trail:›

	" Börja 'linebreak' med …
	set showbreak=…
" }}}

" QuickFix window {{{1
	augroup quickfix_size
		autocmd!
		au FileType qf call AdjustWindowHeight(2, 10)
	augroup END
	function! AdjustWindowHeight(minheight, maxheight)
		exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
	endfunction
	let g:syntastic_always_populate_loc_list = 0
	let g:syntastic_auto_loc_list = 0

	" Show last search {{{2
	nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
	" }}}
" }}}

" Inställningar för Python {{{1
	augroup python_indent
		autocmd!
		autocmd FileType *.py :map <F2> :!python3.3 % <CR>
		autocmd FileType python set ts=4
		autocmd FileType python :set foldmethod=indent
	augroup END
" }}}

" Inställningar för LaTex {{{1
	augroup latex_compiling
		autocmd!
		autocmd FileType *.tex :map <leader>ll :!latexmk -pdf % <CR>
		autocmd FileType *.tex :map <F3> :!bibtex %:r <CR>
		autocmd FileType *.tex setlocal foldmethod=marker
	augroup END
" }}}

" C-kompilator {{{1
	augroup c_compiling
		autocmd!
		autocmd FileType *.c :map <F4> :!gcc % <CR>
	augroup END
" }}}

" Error Toggles {{{1

command! ErrorsToggle call ErrorsToggle()
function! ErrorsToggle() " {{{
  if exists("w:is_error_window")
    unlet w:is_error_window
    exec "q"
  else
    exec "Errors"
    lopen
    let w:is_error_window = 1
  endif
endfunction " }}}

command! -bang -nargs=? QFixToggle call QFixToggle(<bang>0)
function! QFixToggle(forced) " {{{
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction " }}}

nmap <silent> <f3> :ErrorsToggle<cr>
nmap <silent> <f4> :QFixToggle<cr>

" }}}

" Command line popup {{{
	set wildmenu
	set completeopt=menuone,preview
" }}}
