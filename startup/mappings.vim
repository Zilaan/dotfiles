" Author: Raman Haddad
" vim: foldmethod=marker
" vim: foldcolumn=3

" Mappings

" Tabs {{{ "
nnoremap <silent> tt :tabnew<CR>
nnoremap <silent> TT :tabclose<CR>
nnoremap <silent> [g :tabprevious<CR>
nnoremap <silent> ]g :tabnext<CR>
nnoremap <silent> [G :tabrewind<CR>
nnoremap <silent> ]G :tablast<CR>
" }}} Tabs "

" Mode completion {{{ "
inoremap <c-f> <c-x><c-f>
inoremap <c-b> <c-x><c-]>
inoremap <c-l> <c-x><c-l>
" }}} Mode completion "

" Navigering {{{ "
noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l

noremap j gj
noremap k gk
noremap <left> g<s-^>
noremap <right> g$
noremap <s-left> <s-^>
noremap <s-right> $

vmap j gj
vmap k gk
vmap 9 g<s-^>
vmap 0 g$
vmap <leader>0 0

noremap H ^
noremap L $
" }}} Navigering "

" Avmappa piltangenterna {{{ "
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
" }}} Avmappa piltangenterna "

" Flytta rader med piltangenterna {{{ "
nmap <up> ddkP
nmap <down> ddp
" }}} Flytta rader med piltangenterna "

" Flytta flera rader {{{ "
vmap <down> xp`[V`]
vmap <up> xkP`[V`]
" }}} Flytta flera rader "

" Autocentrering {{{ "
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz
" }}} Autocentrering "

" Skapa par {{{ "
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i
" }}} Skapa par "

" Återmarker för indentering {{{ "
vnoremap > >gv
vnoremap < <gv
" }}} Återmarker för indentering "

" Återmarker {{{ "
nnoremap <leader>V V`]
" }}} Återmarker "

" Source {{{ "
vnoremap <leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>
" }}} Source "

" Quick editing {{{ "
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>em :vsplit ~/.vim/startup/mappings.vim<cr>
nnoremap <leader>ep :vsplit ~/.vim/startup/plugins.vim<cr>
nnoremap <leader>es :vsplit ~/.vim/startup/settings.vim<cr>
nnoremap <leader>eV :vsplit ~/.vim/startup/visual.vim<cr>
" }}} Quick editing "

" Clear matches {{{ "
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>
" }}} Clear matches "

" Don't move on * {{{ "
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>
" }}} Don't move on * "

" Open splits {{{ "
nnoremap <C-c><C-l> :bel vsp new<cr>
nnoremap <C-c><C-h> :abo vsp new<cr>
nnoremap <C-c><C-j> :bel sp new<cr>
nnoremap <C-c><C-k> :abo sp new<cr>

"nnoremap <C-d><C-H> <C-W>h<C-W>c
"nnoremap <C-d><C-J> <C-W>j<C-W>c
"nnoremap <C-d><C-K> <C-W>k<C-W>c
"nnoremap <C-d><C-L> <C-W>l<C-W>c
" }}} Open splits "
