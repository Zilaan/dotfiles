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
	
	" Disable gui {{{1
	if has('gui_running')
		" GUI Vim

		set guifont=Menlo\ Regular\ for\ Powerline:h12

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
	autocmd FileType python :set foldmethod=indent

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

	" Show last search {{{2
	nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Inställningar för Python {{{1
	autocmd BufReadPost *.py :map <F2> :!python3.3 % <CR>
	autocmd FileType python set ts=4

" Inställningar för LaTex {{{1
	autocmd BufReadPost *.tex :map <F2> :!pdflatex % <CR>
	autocmd BufReadPost *.tex :map <F3> :!bibtex %:r <CR>

" C-kompilator {{{1
	autocmd BufReadPost *.c :map <F4> :!gcc % <CR>

" Folding
set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
nnoremap <c-z> mzzMzvzz15<c-e>`z:Pulse<cr>

" Highlight words {{{1
	function! HiInterestingWord(n)
		" Save our location.
		normal! mz

		" Yank the current word into the z register.
		normal! "zyiw

		" Calculate an arbitrary match ID.  Hopefully nothing else is using it.
		let mid = 86750 + a:n

		" Clear existing matches, but don't worry if they don't exist.
		silent! call matchdelete(mid)

		" Construct a literal pattern that has to match at boundaries.
		let pat = '\V\<' . escape(@z, '\') . '\>'

		" Actually match the words.
		call matchadd("InterestingWord" . a:n, pat, 1, mid)

		" Move back to our original location.
		normal! `z
	endfunction

	nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
	nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
	nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
	nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
	nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
	nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

	hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
	hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
	hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
	hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
	hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
	hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" Visual search
	function! s:VSetSearch()
	  let temp = @@
	  norm! gvy
	  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
	  let @@ = temp
	endfunction

	vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
	vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

