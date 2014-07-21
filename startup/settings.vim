" vim: foldmethod=marker
" vim: foldcolumn=3

" General settings {{{1
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

" QuickFix window {{{1
	au FileType qf call AdjustWindowHeight(2, 10)
	function! AdjustWindowHeight(minheight, maxheight)
	  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
	endfunction
	let g:syntastic_always_populate_loc_list = 0
	let g:syntastic_auto_loc_list = 0

" Inställningar för Python {{{1
	autocmd BufReadPost *.py :map <F2> :!python3.3 % <CR>
	autocmd FileType python set ts=4

" Inställningar för LaTex {{{1
	autocmd BufReadPost *.tex :map <F2> :!pdflatex % <CR>
	autocmd BufReadPost *.tex :map <F3> :!bibtex %:r <CR>

" C-kompilator {{{1
	autocmd BufReadPost *.c :map <F4> :!gcc % <CR>

