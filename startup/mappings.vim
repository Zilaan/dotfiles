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

" Navigation {{{ "
" Treat wraped lines as new lines
noremap j gj
noremap k gk
" }}} Navigering "

" Move lines with arrows{{{ "
nmap <up> ddkP
nmap <down> ddp
" }}}

" Move line with arrows in visual{{{ "
vmap <down> xp`[V`]
vmap <up> xkP`[V`]
" }}}

" Auto centering {{{ "
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz
" }}} Autocentrering "

" Create pairs {{{ "
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i
" }}}

" Remeber last visaul marking when indenting{{{ "
vnoremap > >gv
vnoremap < <gv
" }}}

" Remember last marking {{{ "
nnoremap <leader>V V`]
" }}}

" Source {{{ "
" Soucre specific lines
vnoremap <leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>
" }}}

" Quick editing {{{ "
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>em :vsplit ~/.vim/startup/mappings.vim<cr>
nnoremap <leader>ep :vsplit ~/.vim/startup/plugins.vim<cr>
nnoremap <leader>es :vsplit ~/.vim/startup/settings.vim<cr>
nnoremap <leader>eV :vsplit ~/.vim/startup/visual.vim<cr>
" }}}

" Clear matches {{{ "
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>
" }}}

" Don't move on * {{{ "
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>
" }}}
