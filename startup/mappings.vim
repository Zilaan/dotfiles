" vim: foldmethod=marker
" vim: foldcolumn=3

" Mappings {{{1
	" Navigering
	map <C-H> <C-W>h<C-W>
	map <C-J> <C-W>j<C-W>
	map <C-K> <C-W>k<C-W>
	map <C-L> <C-W>l<C-W>

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
