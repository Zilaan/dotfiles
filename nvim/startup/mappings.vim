" Author: Raman Haddad
" vim: foldmethod=marker
" vim: foldcolumn=3

" Mappings

" Navigering {{{ "
noremap j gj
noremap k gk
" }}} Navigering "

" Flytta rader med piltangenterna {{{ "
nmap <up> ddkP
nmap <down> ddp
" }}} Flytta rader med piltangenterna "

" Flytta flera rader {{{ "
vmap <down> xp`[V`]
vmap <up> xkP`[V`]
" }}} Flytta flera rader "

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

" Terminal {{{1
" Clear Terminal
if has('nvim')
    function! ClearScrollback()
        if &scrollback == 0
            set scrollback=10000
        else
            set scrollback=0
        endif
    endfunction

    command TermCS call ClearScrollback()
    tnoremap <C-h> <C-\><C-n>:TermCS<CR><s-a>
endif

" Enter normal mode using <Esc>
tnoremap <Esc> <C-\><C-n>
" }}}
