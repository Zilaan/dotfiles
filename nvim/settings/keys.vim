" vim: foldmethod=marker

nnoremap j gj
nnoremap k gk

nnoremap <up> ddkP
nnoremap <down> ddp

vnoremap <down> xp`[V`]
vnoremap <up> xkP`[V`]

vnoremap > >gv
vnoremap < <gv

" Don't move when searching for current word
nnoremap * *``
nnoremap # #``
