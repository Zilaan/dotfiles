" vim: foldmethod=marker
" vim: foldcolumn=3

" Mappings {{{
	" Navigering
	map <C-H> <C-W>h
	map <C-J> <C-W>j
	map <C-K> <C-W>k
	map <C-L> <C-W>l

	" Kortkommando för list
	nmap <leader>l :set list!<CR>

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

	noremap H ^
	noremap L $

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

	" Source
	vnoremap <leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>
	nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

	" Quick editing
	nnoremap <leader>ev :vsplit $MYVIMRC<cr>
	nnoremap <leader>em :vsplit ~/.vim/startup/mappings.vim<cr>
	nnoremap <leader>ep :vsplit ~/.vim/startup/plugins.vim<cr>
	nnoremap <leader>es :vsplit ~/.vim/startup/settings.vim<cr>
	nnoremap <leader>eV :vsplit ~/.vim/startup/visual.vim<cr>

	" Clear matches
	noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

	" Don't move on *
	nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>
