" Author: Raman Haddad
" vim: foldmethod=marker
" vim: foldcolumn=3

" Mappings {{{1
	" Tabs
	nnoremap <leader>( :tabprev<CR>
	nnoremap <leader>) :tabnext<CR>
	" Mode completion
	inoremap <c-f> <c-x><c-f>
	inoremap <c-b> <c-x><c-]>
	inoremap <c-l> <c-x><c-l>

	" Navigering
	noremap <C-H> <C-W>h
	noremap <C-J> <C-W>j
	noremap <C-K> <C-W>k
	noremap <C-L> <C-W>l

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
	
	" Återmarkera
	nnoremap <leader>V V`]

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

	" Open splits
	nnoremap c<C-l> :rightb vsp new<cr>
	nnoremap c<C-h> :leftb vsp new<cr>
	nnoremap c<C-j> :bel sp new<cr>
	nnoremap c<C-k> :abo sp new<cr>

	nnoremap d<C-H> <C-W>h<C-W>c
	nnoremap d<C-J> <C-W>j<C-W>c
	nnoremap d<C-K> <C-W>k<C-W>c
	nnoremap d<C-L> <C-W>l<C-W>c
